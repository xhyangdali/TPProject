<?php
namespace Common\Model;
use Common\Model\BaseModel;
/**
 * 系统日志则model
 */
class LogModel extends BaseModel{

	/**
	 * 添加日志
	 * @param	string	$action  用户操作
	 * @param	string	$class_name  操作表名称
	 * @param	array	$result  操作结果
	 * @return	boolean			操作是否成功
	 */
	public static function addLog($action, $class_name ,$result = "",$OldData = ""){
		if($_SESSION['user'])
		{
			$now_time = time();
			$log = D("Log");
			if($_SESSION['user']['username']) {
				$log->user_name = $_SESSION['user']['username'];
			}else{
				$log->user_name = $_SESSION['user_']['name'];
			}
			$log->action = $action;
			$log->class_name = $class_name;
			if( $_SESSION['user']['id']) {
				$log->class_obj = $_SESSION['user']['id'];
			}else{
				$log->user_name = $_SESSION['user_']['id'];
			}
			$log->op_time = $now_time;
			$log->result = $result;
			$log->OldData = $OldData;
			//写入日志
			$isok = $log->add();
			return $isok;
		}else
		{
			return 0;
		}
	}




}
