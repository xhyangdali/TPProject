<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think\Db;
use OT\Database;
/**
 * 数据备份/优化/修复 控制器
 */
class DataBackupController extends AdminBaseController{ 

	/**
	 * 用户表 列表 （备份） 
	 */
	public function index(){ 
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('ACSESS','DataBackup',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//数据表状态查询
		$Db    = Db::getInstance();
        $list  = $Db->query('SHOW TABLE STATUS');
        $list  = array_map('array_change_key_case', $list);
		
        $title = '数据备份';
		//
		$this->assign('meta_title', $title);
        $this->assign('data', $list);
		$this->display();
	}
	
	/**
	 * 用户表 列表 （还原）
	 */
	public function Recover(){
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log"); 
		$log->addLog('ACSESS','DataBackup',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//数据表状态查询
		$path = C('DATA_BACKUP_PATH');
        if(!is_dir($path)){
              mkdir($path, 0755, true);
        }
        $path = realpath($path);
        $flag = \FilesystemIterator::KEY_AS_FILENAME;
        $glob = new \FilesystemIterator($path,  $flag);

        $list = array();
        foreach ($glob as $name => $file) {
			if(preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql(?:\.gz)?$/', $name)){
				$name = sscanf($name, '%4s%2s%2s-%2s%2s%2s-%d');

				$date = "{$name[0]}-{$name[1]}-{$name[2]}";
				$time = "{$name[3]}:{$name[4]}:{$name[5]}";
				$part = $name[6];

				if(isset($list["{$date} {$time}"])){
					$info = $list["{$date} {$time}"];
					$info['part'] = max($info['part'], $part);
					$info['size'] = $info['size'] + $file->getSize();
				} else {
					$info['part'] = $part;
					$info['size'] = $file->getSize();
				}
				$extension        = strtoupper(pathinfo($file->getFilename(), PATHINFO_EXTENSION));
				$info['compress'] = ($extension === 'SQL') ? '-' : $extension;
				$info['time']     = gmdate("Ymd-His",strtotime("{$date} {$time}"));
				$info['status']     = '正常';
				$info['time_obj'] = strtotime("{$date} {$time}");
				$list["{$date} {$time}"] = $info;
			}
      	}
		//
		 $title = '数据还原';
		$this->assign('meta_title', $title);
        $this->assign('data', $list);
		$this->display();
	}
	/**
     * 备份数据库
     * @param  String  $tables 表名
     * @param  Integer $id     表ID
     * @param  Integer $start  起始行数
     * @author xhy
     */
    public function export($tables = null, $id = null, $start = null){
		$tab = array();
		$msg ="";
		$state = 1;
        if(IS_POST && !empty($tables) && is_array($tables)){ //初始化
            $path = C('DATA_BACKUP_PATH');
            if(!is_dir($path)){
                mkdir($path, 0755, true);
            }
            //读取备份配置
            $config = array(
                'path'     => realpath($path) . DIRECTORY_SEPARATOR,
                'part'     => C('DATA_BACKUP_PART_SIZE'),
                'compress' => C('DATA_BACKUP_COMPRESS'),
                'level'    => C('DATA_BACKUP_COMPRESS_LEVEL'),
            );

            //检查是否有正在执行的任务
            $lock = "{$config['path']}backup.lock";
            if(is_file($lock)){
                //$this->error('检测到有一个备份任务正在执行，请稍后再试！');
				$msg = "检测到有一个备份任务正在执行，请稍后再试！";
				$state = 2;
            } else {
                //创建锁文件
                file_put_contents($lock, NOW_TIME);
            }

            //检查备份目录是否可写
            is_writeable($config['path']) || $this->error('备份目录不存在或不可写，请检查后重试！');
            session('backup_config', $config);

            //生成备份文件信息
            $file = array(
                'name' => date('Ymd-His', NOW_TIME),
                'part' => 1,
            );
            session('backup_file', $file);

            //缓存要备份的表
            session('backup_tables', $tables);

            //创建备份文件
            $Database = new Database($file, $config);
            if(false !== $Database->create()){
                $tab = array('id' => 0, 'start' => 0);
                //$this->success('初始化成功！', '', array('tables' => $tables, 'tab' => $tab));
				$msg = "初始化成功！";
				$state = 1;
            } else {
                //$this->error('初始化失败，备份文件创建失败！');
				$msg = "初始化失败，备份文件创建失败！";
				$state = 2;
            }
        } elseif (IS_GET && is_numeric($id) && is_numeric($start)) { //备份数据
            $tables = session('backup_tables');
            //备份指定表
            $Database = new Database(session('backup_file'), session('backup_config'));
            $start  = $Database->backup($tables[$id], $start);
            if(false === $start){ //出错
                //$this->error('备份出错！');
				$msg = "备份出错！";
				$state = 2;
            } elseif (0 === $start) { //下一表
                if(isset($tables[++$id])){
                    $tab = array('id' => $id, 'start' => 0);
                    //$this->success('备份完成！', '', array('tab' => $tab));
					$msg = "$tables[$id],备份完成！";
					$state = 1;
                } else { //备份完成，清空缓存
                    unlink(session('backup_config.path') . 'backup.lock');
                    session('backup_tables', null);
                    session('backup_file', null);
                    session('backup_config', null);
					$msg = "备份完成！";
					$state = 1;
                    //$this->success('备份完成！');
                }
            } else {
                $tab  = array('id' => $id, 'start' => $start[0]);
                $rate = floor(100 * ($start[0] / $start[1]));
                //$this->success("正在备份...({$rate}%)", '', array('tab' => $tab));
				//$msg = "正在备份...({$rate}%)!";
				//$state = 0;
            }

        } else { //出错
            //$this->error('参数错误！');
			$msg = "参数错误！";
			$state = 2;
        }
		$result = array(
			'state' => $state,
			'msg' => $msg,
			'tables' =>$tables,
			'tab' => $tab
			);
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('ADD','DataExport',json_encode(array('Result::' => $result,'Data::'=>session('backup_file'),'IP::'=>$ip)),'');
		$this->ajaxReturn($result);
    }
	
	/**
     * 还原数据库
     * @author xhy
     */
    public function import($time = 0, $part = null, $start = null){
		$msg ="";
		$state = 0;
		$gz;
        if(is_numeric($time) && is_null($part) && is_null($start)){ //初始化
            //获取备份文件信息
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            $files = glob($path);
            $list  = array();
            foreach($files as $name){
                $basename = basename($name);
                $match    = sscanf($basename, '%4s%2s%2s-%2s%2s%2s-%d');
                $gz       = preg_match('/^\d{8,8}-\d{6,6}-\d+\.sql.gz$/', $basename);
                $list[$match[6]] = array($match[6], $name, $gz);
            }
            ksort($list);

            //检测文件正确性
            $last = end($list);
            if(count($list) === $last[0]){
                session('backup_list', $list); //缓存备份列表
                //$this->success('初始化完成！', '', array('part' => 1, 'start' => 0));
				$part =1;
				$start = 0;
				$msg = '初始化完成!';
				$state = 1;
            } else {
                //$this->error('备份文件可能已经损坏，请检查！');
				$msg = '备份文件可能已经损坏，请检查！';
				$state = 2;
            }
        } elseif(is_numeric($part) && is_numeric($start)) {
            $list  = session('backup_list');
            $db = new Database($list[$part], array(
                'path'     => realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR,
                'compress' => $list[$part][2]));
            $start = $db->import($start);

            if(false === $start){
                //$this->error('还原数据出错！');
				$msg = '还原数据出错！';
				$state = 2;
            } elseif(0 === $start) { //下一卷
                if(isset($list[++$part])){
                    $data = array('part' => $part, 'start' => 0);
					$part =$part;
					$start = 0;
					$msg = "正在还原...#{$part})";
                    //$this->success("正在还原...#{$part}", '', $data);
                } else {
                    session('backup_list', null);
                    //$this->success('还原完成！');
					$state = 1;
					$msg = '还原完成！';
                }
            } else {
                $data = array('part' => $part, 'start' => $start[0]);
				$part =$part;
				$start = $start[0];
                if($start[1]){
                    $rate = floor(100 * ($start[0] / $start[1]));
					$start = $start[1];
                    //$this->success("正在还原...#{$part} ({$rate}%)", '', $data);
					$msg = "正在还原...#{$part} ({$rate}%)";
                } else {
                    $data['gz'] = 1;
					$gz =1;
					$msg = "正在还原...#{$part})";
                    //$this->success("正在还原...#{$part}", '', $data);
                }
            }

        } else {
            $msg = '参数错误！';
			$state = 2;
        }
		$result = array(
			'state' => $state,
			'msg' => $msg,
			'time' =>$time,
			'start' =>$start,
			'gz' => $gz,
			'part' => $part
			);
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('MODIFY','DataImport',json_encode(array('Result::' => $result,'Data::'=>session('backup_list'),'IP::'=>$ip)),'');
		$this->ajaxReturn($result);
    }
	 /**
     * 删除备份文件
     * @param  Integer $time 备份时间
     * @author xhy
     */
    public function del($time = 0){
		$result ="";
		$msg ="备份文件删除成功!";
		$ip = get_client_ip();
		$log = D("Log"); 
        if($time){
            $name  = date('Ymd-His', $time) . '-*.sql*';
            $path  = realpath(C('DATA_BACKUP_PATH')) . DIRECTORY_SEPARATOR . $name;
            array_map("unlink", glob($path));
			$result = $path;
            if(count(glob($path))){
				$msg = "备份文件删除失败，请检查权限！";
				$data = array('filepath'=>$result,'msg'=>$msg);
				//访问日志 
				$log->addLog('DELETE','BackupfileDel',json_encode(array('Result::' =>$time,'Data::'=>$data,'IP::'=>$ip)),'');
                $this->error($msg);
            } else {
				$data = array('filepath'=>$result,'msg'=>$msg);
				//访问日志  
				$log->addLog('DELETE','BackupfileDel',json_encode(array('Result::' =>$time,'Data::'=>$data,'IP::'=>$ip)),'');
                $this->success($msg);
            }
        } else {
			$msg ="参数错误！";
			$data = array('filepath'=>$result,'msg'=>$msg);
			//访问日志  
			$log->addLog('DELETE','BackupfileDel',json_encode(array('Result::' =>$time,'Data::'=>$data,'IP::'=>$ip)),'');
            $this->error($msg);
        }		
    }
	/**
     * 优化表
     * @param  String $tables 表名
     * @author xhy
     */
    public function optimize($tables = null){
		$msg ="";
		$state = 1;
        if($tables) {
            $Db   = Db::getInstance();
            if(is_array($tables)){
                $tables = implode('`,`', $tables);
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");

                if($list){
                    $msg = "数据表:'{$tables}'优化完成！";
                } else {
                    $msg = "数据表:'{$tables}'优化出错请重试！";
					$state = 0;
                }
            } else {
                $list = $Db->query("OPTIMIZE TABLE `{$tables}`");
                if($list){
                   $msg = "数据表'{$tables}'优化完成！";
                } else {
                    $msg = "数据表'{$tables}'优化出错请重试！";
					$state = 0;
                }
            }
        } else {
            $msg = "请指定要优化的表！";
			$state = 2;
        }
		$result = array(
			'state' => $state,
			'msg' => $msg
			);
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('MODIFY','Optimize',json_encode(array('Result::' => $result,'Data::'=>$tables,'IP::'=>$ip)),'');
		$this->ajaxReturn($result);
    }

    /**
     * 修复表
     * @param  String $tables 表名
     * @author xhy
     */
    public function repair($tables = null){
		$msg ="";
		$state = 1;
        if($tables) {
            $Db   = Db::getInstance();
            if(is_array($tables)){
                $tables = implode('`,`', $tables);
                $list = $Db->query("REPAIR TABLE `{$tables}`");

                if($list){
					$msg ="数据表:'{$tables}'修复完成！";
                } else {
                    $msg = "数据表:'{$tables}'修复出错请重试！";
					$state = 0;
                }
            } else {
                $list = $Db->query("REPAIR TABLE `{$tables}`");
                if($list){
                    $msg = "数据表'{$tables}'修复完成！";
                } else {
                    $msg = "数据表'{$tables}'修复出错请重试！";
					$state = 0;
                }
            }
        } else {
            $msg = "请指定要修复的表！";
			$state = 2;
        }
		//
		$result = array(
			'state' => $state,
			'msg' => $msg
			);
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('MODIFY','Repair',json_encode(array('Result::' => $result,'Data::'=>$tables,'IP::'=>$ip)),'');
		$this->ajaxReturn($result);
    }
}
