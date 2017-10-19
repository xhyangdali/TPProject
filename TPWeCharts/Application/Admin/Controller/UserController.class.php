<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
/**
 * 后台首页控制器
 */
class UserController extends AdminBaseController{

	/**
	 * 用户列表
	 */
	public function index(){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log"); 
		$log->addLog('ACSESS','Users',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		$word=I('get.word','');
		if (empty($word)) {
			$map=array();
		}else{
			$map=array(
				'username'=>$word
				);
		}
		$assign=D('Users')->getAdminPage($map,'register_time desc');
		$this->assign($assign);
		$this->display();
	}

	/**
	 * 获取用户信息
	 * @param  string $id  用户编码
	 * @return array       数据
	 */
	public function GetUserInfo($id=1)
	{
		$condition = array();
		$condition["id"] = $id;
		$user = D('Users')->where($condition)->select();
		foreach($user as &$item)
		{
			$item["status"] = $item["status"]==1?"有效":"无效";
			$item['register_time'] = gmdate("Y-m-d H:i:s",$item['register_time']);
		}
		return $this->ajaxReturn($user);;
	}


}
