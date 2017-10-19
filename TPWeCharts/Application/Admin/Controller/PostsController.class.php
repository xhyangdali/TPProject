<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
/**
 * 文章
 */
class PostsController extends AdminBaseController{
    /**
     * 文章列表
     */
    public function index(){
		//访问日志
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','Articles',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
        $this->display();
    }

}