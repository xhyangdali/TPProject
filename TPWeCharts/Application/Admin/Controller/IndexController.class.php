<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
/**
 * 后台首页控制器
 */
class IndexController extends AdminBaseController{
	/**
	 * 首页
	 */
	public function index(){
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','AdminIndex',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//
		$_SESSION['user_menu']=array(
                    'id'=>'-1',//系统设置
					'id_item'=>'-1'//模块管理
                  );
		$count = $log->where(" action ='LOGIN' ")->order('op_time desc')->count();
		$assign=array(
			'hcount' => $count
			);
		$this->assign($assign);
		$this->display();
	}
	/**
	 * elements
	 */
	public function elements(){

		$this->display();
	}
	
	/**
	 * welcome
	 */
	public function welcome(){
	    $this->display();
	}

	public function SetMenu($menu_id ='1',$item_id = '1')
	{
		$_SESSION['user_menu']=array(
                    'id'=>$menu_id,
					'id_item'=>$item_id
                  );		  
	}
}
