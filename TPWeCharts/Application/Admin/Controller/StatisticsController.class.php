<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统统计单管理
 */
class StatisticsController extends AdminBaseController{
	/**
	 * 白名单列表
	 */
	public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log");
		//$Statistics = D("Statistics");
		$log->addLog('Log','Statistics',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//查询
		$this->display();
	}
	/**
	 * 白名单信息添加
	 */
	public function adddata()
	{
		$data=I('post.');
		unset($data['id']);
		$data["nickname"] = base64_encode($data["nickname"]);
		$result = D('Statistics')->iaddData($data);
		if ($result) {
			$msg = '添加成功';//,U('Admin/DicData/index')
			$iresult = array(
				'state' => 0,
				'msg' => $msg
			);
		}else{
			$msg = '添加失败';
			$iresult = array(
				'state' => 1,
				'msg' => $msg
			);
		}
		$this->ajaxReturn($iresult);//返回操作结果
	}
	/**
	 * 白名单信息修改（ajax）
	 *
	 */
	public function editdata()
	{
		$data=I('post.');
		$map=array(
			'id'=>$data['id']
		);
		$data["nickname"] = base64_encode($data["nickname"]);
		$result = D('Statistics')->ieditData($map,$data);
		if ($result) {
			$msg = '编辑成功';//,U('Admin/DicData/index')
			$iresult = array(
				'state' => 0,
				'msg' => $msg
			);
		}else{
			$msg = '编辑失败';
			$iresult = array(
				'state' => 1,
				'msg' => $msg
			);
		}
		$this->ajaxReturn($iresult);//返回操作结果
	}
	/**
	 * 白名单道信息获取，一句数据id
	 */
	public function GetDetail($id = 1)
	{
		$msg ="";
		$state = 1;
		if(!empty($id))
		{
			$Statistics = D('Statistics');
			$condition["id"] = $id;
			$data = $Statistics->where($condition)->select();
			if($data)
			{
				$state = 0;
				$msg ="成功！";
			}else{
				$msg ="数据获取失败！";
			}
		}else
		{
			$state = -1;
			$data = array();
			$msg ="数据获取失败(参数不正确)！";
		}
		$result =array(
			'state' => $state,
			'msg' => $msg,
			'data' => $data
		);
		$this->ajaxReturn($result);//返回操作结果
	}
	/**
	 * 删除(假删除)白名单
	 */
	public function delete($id = 0){

		if(!empty($id))
		{
			$map=array(
				'id'=>$id
			);
			$result=D('Statistics')->ideleteData($map);
			if($result){
				$state = 0;
				$msg ="成功！";
			}else{
				$state = -1;
				$msg ="失败！";
			}
		}else{
			$state = -1;
			$msg ="失败(参数不正确)！";
		}
		$result =array(
			'state' => $state,
			'msg' => $msg
		);
		$this->ajaxReturn($result);//返回操作结果
	}
	/**
	 * 启用，禁止 用户访问统计模块
	 */
	public function ForBidden($id =0,$iseffictive =0)
	{
		if(!empty($id) && $id !=0)
		{
			$admin=D('Statistics');
			$map=array(
				'id'=>$id
			);
			$sql = " UPDATE white_list SET iseffective=$iseffictive WHERE id=$id  ";
			$result = $admin->execute($sql);
			if($result){
				$state = 0;
				$msg ="成功！";
			}else{
				$state = -1;
				$msg ="失败！";
			}
		}else{
			$state = -1;
			$msg ="失败(参数不正确)！";
		}
		$result =array(
			'state' => $state,
			'msg' => $msg
		);
		$this->ajaxReturn($result);//返回操作结果
	}
}
