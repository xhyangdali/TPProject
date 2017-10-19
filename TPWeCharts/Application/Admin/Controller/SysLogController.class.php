<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统日志单管理 
 */
class SysLogController extends AdminBaseController{
	/**
	 * 系统日志列表
	 */
	public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log");
		$log->addLog('ACSESS','Log',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//查询
		$condition=array();
		if($keywords != ''){
			$condition["user_name"] =array('like','%'.$keywords.'%');
		}
		if($start_date !='' && $end_date !=''){
			$condition["op_time[<>]"] =array($start_date,$end_date);
		}
		
		$totalRows = $log->where($condition)->order('op_time desc')->count();
		$totalPages = 1;
		$listRows = 20;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$sys_logs=$log->where($condition)->order('op_time desc')->page($p,$listRows)->select(); 
		
		//字段翻译处理
		foreach ($sys_logs as &$log){
			//系统常量获取
			$COMMAND_FOR_LOG = C('COMMAND_FOR_LOG');
			$CLASS_FOR_LOG = C('CLASS_FOR_LOG');
			//
			$log['op_time'] = gmdate("Y-m-d H:i:s",$log['op_time']);
			if(array_key_exists($log['action'],$COMMAND_FOR_LOG)){
				$log['action']=$COMMAND_FOR_LOG[$log['action']];
			}
			 
			$class_obj = $log['class_obj'];
			if(array_key_exists($log['class_name'],$CLASS_FOR_LOG)){
				$log['class_name'] = $CLASS_FOR_LOG[$log['class_name']];
			}		
			
			if($log['class_obj']==""){
				$log['class_obj']='null';
			}
		
			if(empty($log['result'])){
				$log['result'] = '成功';
			}else{
				$result =json_decode($log['result'],true);
				if(is_array($result)){
					$temp = null;
					
					foreach($result as $key => $value){
						if(is_array($value))
						{
							foreach($value as $key0 => $value0){
								$temp[] = "$key0=>$value0";
							}
						}else
						{
							$temp[] = "$key=>$value";
						}
					}
					$log['result']=implode(';',$temp);
				}else{
					$log['result']=$result;
				}
			}
		}
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$assign=array(
			'data' => $sys_logs,
			'pagehtml' => $pagehtml
			);
		$this->assign($assign);
		$this->display();
	}

}
