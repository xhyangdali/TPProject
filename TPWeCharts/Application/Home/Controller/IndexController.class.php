<?php
namespace Home\Controller;
use Common\Controller\HomeBaseController;
/**
 * 首页Controller
 */
class IndexController extends HomeBaseController{
	/**
	 * 首页 
	 */
	public function index0(){
		$ip = get_client_ip();
		$log = D("Log");
		$Error_Msg = "账号或密码错误"; 
        if(IS_POST){
            // 做一个简单的登录 组合where数组条件 
            $map=I('post.');
            $map['password']=md5($map['password']);
            $data=M('Users')->where($map)->find();
            if (empty($data)) {
                $this->error($Error_Msg);

            }else{
                $_SESSION['user']=array(
                    'id'=>$data['id'],
                    'username'=>$data['username'],
					'nickname'=>$data['nickname'],//昵称
					'org_id'=>$data['org_id'],//机构
					'dept_id'=>$data['dept_id'],//部门
					'p_id'=>$data['p_id'],//岗位
					'e_id'=>$data['e_id'],//人员
                    'avatar'=>$data['avatar']
                    );
				$_SESSION['user_menu']=array(
                    'id'=>'-1',//系统设置
					'id_item'=>'-1'//模块管理
                  );
				$log->addLog('LOGIN','Users',json_encode(array("IP" => $ip)),json_encode($data));
                $this->success('登录成功、前往管理后台',U('Admin/Index/index'));
            }
        }else{
            $data=check_login() ? $_SESSION['user']['username'].'已登录' : '未登录';
            $assign=array(
                'data'=>$data
                );
            $this->assign($assign);
            $this->display();
        }
	}

	/**
     * 登录
     */
	public function index(){
		$ip = get_client_ip();
		$log = D("Log");
		$Error_Msg = "账号或密码错误";
        if(IS_POST){ 
            // 做一个简单的登录 组合where数组条件 
            $map=I('post.');
			//$this->error(check_verify($map['verifycode'],''));
			if(check_verify($map['verifycode'],'')!="1")
			{
				$this->error("验证码错误！");
			}
            $map['password']=md5($map['password']);
			$where["username"] = $map['username'];
			$where["password"] = $map['password'];
            $data=M('Users')->where($where)->find();
            if (empty($data)) {
                $this->error($Error_Msg);
				
            }else{
                $_SESSION['user']=array(
                    'id'=>$data['id'],
					'username'=>$data['username'],
					'nickname'=>$data['nickname'],//昵称
					'org_id'=>$data['org_id'],//机构
					'dept_id'=>$data['dept_id'],//部门
					'p_id'=>$data['p_id'],//岗位
					'e_id'=>$data['e_id'],//人员
                    'avatar'=>$data['avatar']
                    );
				$_SESSION['user_menu']=array(
                    'id'=>'-1',//系统设置
					'id_item'=>'-1'//模块管理
                  );
				$log->addLog('LOGIN','Users',json_encode(array("IP" => $ip)),json_encode($data));
                $this->success('登录成功、前往管理后台',U('Admin/Index/index'));
            }
        }else{
            $data=check_login() ? $_SESSION['user']['username'].'已登录' : '未登录';
            $assign=array(
                'data'=>$data
                );
            $this->assign($assign);
            $this->display();
        }
	}
    /**
     * 退出
     */
    public function logout(){
		if($_SESSION['user'])
		{	
			//日志
			$log = D("Log");	
			$ip = get_client_ip();
			$log->addLog('LOGOUT','Users',json_encode(array("IP" => $ip)),json_encode($_SESSION['user']));
		}
        session('user',null);
        $this->success('退出成功、前往登录页面',U('Home/Index/index'));
    }

    /**
     * geetest生成验证码
     */
    public function geetest_show_verify(){
         /*$geetest_id=C('GEETEST_ID');
        $geetest_key=C('GEETEST_KEY');
        $geetest=new \Org\Xb\Geetest($geetest_id,$geetest_key);
        $user_id = "test";
        $status = $geetest->pre_process($user_id);
        $_SESSION['geetest']=array(
            'gtserver'=>$status,
            'user_id'=>$user_id
            );
        echo $geetest->get_response_str();*/
		$Verify =     new \Think\Verify();// 开启验证码背景图片功能 随机使用 ThinkPHP/Library/Think/Verify/bgs 目录下面的图片
		$Verify->useImgBg = true;
		echo $Verify->entry();
    }


	/**
     * 检测输入的验证码是否正确，$code为用户输入的验证码字符串
     */
	function check_verify($code, $id = '')
	{
		$verify = new \Think\Verify();
		return $verify->check($code, $id);
	}

}

