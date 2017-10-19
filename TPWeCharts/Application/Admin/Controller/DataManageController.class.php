<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;
use Think\Db;
use OT\Database;
/**
 * 数据备份/优化/修复 控制器
 */
class DataManageController extends AdminBaseController{

	/**
	 * 用户表 列表 （数据管理）
	 *表创建/数据管理 
	 */
	public function index($type = null){
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('ACSESS','DataManage',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//数据表状态查
		$Db    = Db::getInstance();
        $list  = $Db->query('SHOW TABLE STATUS');
        $list  = array_map('array_change_key_case', $list);
        $title = '数据管理';
		$this->assign('meta_title', $title);
        $this->assign('data', $list);
		$this->display();
	}
	/**
	 * 用户表 详细数据 （数据管理）
	 *数据查询处理依据表名称
	 *数据管理
	 */
	public function QuickLook($tablename = 'Log',$p=1){
		//数据表
		$totalPages = 1;
		$listRows = 20;
		$totalRows =0;
		if(!empty($tablename) && tablename != "")
		{
			$tb = D($tablename);
			$totalRows = $tb->count();
			if($totalRows>$listRows)
			{
				$totalPages = $totalRows/$listRows;
			}
			$data=$tb->page($p,$listRows)->select();
		}
		$Db    = Db::getInstance();
        $list  = $Db->query('DESCRIBE  '.$tablename);
        $list  = array_map('array_change_key_case', $list);
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$result =array(
			'data'=>$data,
			'list'=>$list,
			'pagehtml' => $pagehtml
		);
		$Dt = !empty($data)?"0":"1";
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('ACSESS','DataManage',json_encode(array('Result::' => $tablename,'Data::'=>$Dt,'IP::'=>$ip)),'');
		$this->assign($result);
		$this->display();
	}
	//
	/**
	 * 用户表 编辑 （数据管理）
	 *数据查询处理依据表名称
	 *数据管理
	 */
	public function DataEdit($tablename = 'Log',$p=1){
		//数据表
		$totalPages = 1;
		$listRows = 20;
		$totalRows =0;
		if(!empty($tablename) && tablename != "")
		{
			$tb = D($tablename);
			$totalRows = $tb->count();
			if($totalRows>$listRows)
			{
				$totalPages = $totalRows/$listRows;
			}
			$data=$tb->page($p,$listRows)->select();
		}
		$Db    = Db::getInstance();
        $list  = $Db->query('DESCRIBE  '.$tablename);
        $list  = array_map('array_change_key_case', $list);
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$result =array(
			'data'=>$data,
			'list'=>$list,
			'pagehtml' => $pagehtml
		);
		$Dt = !empty($data)?"0":"1";
		//访问日志
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','DataManage',json_encode(array('Result::' => $tablename,'Data::'=>$Dt,'IP::'=>$ip)),'');
		
		$this->assign($result);
		$this->display();
	}
	/**
	 * 表删除处理
	 */
	public function DataDel($tablename=null){
		$msg ="删除失败！";
		$state = 0;
		$sql ="";
		if(!empty($tablename) &&$tablename !="")
		{
			$Model = new Model(); // 实例化一个model对象 没有对应任何数据表
			$sql = "DROP  TABLE $tablename ";
			$Model->execute($sql);
			if($Model)
			{
				$msg ="删除成功！";
				$state = 1;
			}
		}
		$result = array(
			'state' => $state,
			'msg' => $msg
			);
		//访问日志 
		$ip = get_client_ip(); 
		$log = D("Log");  
		$log->addLog('DELETE','DataManage',json_encode(array('Result::' => $result,'Data::'=>$sql,'IP::'=>$ip)),'');
		$this->ajaxReturn($result);
	}
}
