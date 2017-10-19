<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;


/**
 * 后台部署信息
 */
class SysInfoController extends AdminBaseController{
	/**
	 * 部署环境信息
	 */
	public function index(){
		//
		//访问日志
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','SysInfo',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//
		$sys_info_array = array ();
		$sys_info_array['gmt_time'] = gmdate("Y-m-d H:i:s",time ());
		$sys_info_array['bj_time'] = gmdate("Y-m-d H:i:s",time() + 8 * 3600);
		$sys_info_array['server_ip'] = gethostbyname($_SERVER ["SERVER_NAME"]);
		$sys_info_array['software'] = $_SERVER["SERVER_SOFTWARE"];
		$sys_info_array['port'] = $_SERVER["SERVER_PORT"];
		$sys_info_array['admin'] = $_SERVER["SERVER_ADMIN"];
		$sys_info_array['diskfree'] = intval(diskfreespace( "." )/(1024 * 1024) ).'MB';
		$sys_info_array['current_user'] = @get_current_user();
		$sys_info_array['timezone'] = date_default_timezone_get();
		//$db = D('');
		$mysql_version = $this->_mysql_version();
		$sys_info_array ['mysql_version'] = $mysql_version;
		$sys_info_array ['mysql_size'] = $this->_mysql_db_size();
		$sys_info_array ['PC_Name'] = $_SERVER['SERVER_NAME'];//服务器用户名
		$sys_info_array ['lang'] = $_SERVER['HTTP_ACCEPT_LANGUAGE'];//服务器语言
		$this->assign('sys_info', $sys_info_array);
		$this->display();
	}
	//
	 private function _mysql_version()
     {
         $Model = self::_model();
         $version = $Model->query("select version() as ver");
         return $version[0]['ver'];
     }
	 //
     private function _mysql_db_size()
     {        
         $Model = self::_model();
         $sql = "SHOW TABLE STATUS FROM ".C('DB_NAME');
         $tblPrefix = C('DB_PREFIX');
         if($tblPrefix != null) {
             $sql .= " LIKE '{$tblPrefix}%'";
         }
         $row = $Model->query($sql);
         $size = 0;
         foreach($row as $value) {
             $size += $value["Data_length"] + $value["Index_length"];
         }
         return round(($size/1048576),2).'M';
    }
	//
	protected function _model(){
         return new \Think\Model();
    }
}
