<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统保险信息管理
 */
class InsuranceController extends AdminBaseController{
	/**
	 * 保险信息列表
	 */
	public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log");
		$Insurance = D("Insurance");
		$log->addLog('Log','Insurance',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//查询
		$condition=array();
		$condition["isdel"] = 0;
		if($keywords != ''){
			$condition["name"] =array('like','%'.$keywords.'%');
		}
		if($start_date !='' && $end_date !=''){
			$condition["createdate[<>]"] =array($start_date,$end_date);
		}
		
		$totalRows = $Insurance->where($condition)->order('createdate desc')->count();
		$totalPages = 1;
		$listRows = C('PAGE_NUM');;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$channels=$Insurance->where($condition)->order('createdate desc')->page($p,$listRows)->select();
		foreach ($channels as &$item){
			//$item['createdateformat'] = gmdate("Y-m-d H:i:s",$item['createdate']);
			$item['iseffectiveformat'] = $item['iseffective'] =="1"?"有效":"无效";
		}
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$assign=array(
			'data' => $channels,
			'pagehtml' => $pagehtml
			);
		$this->assign($assign);
		$this->display();
	}
	/**
	 * 保险信息信息添加
	 */
	function add()
	{
		$data=I('post.');
		unset($data['id']);
		if(!empty($data['indate']) && !empty($data['groupnum']) && !empty($data['iseffective'])&& !empty($data['num'])) {//字段校验
			$result = D('Insurance')->iaddData($data);
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
		}else
		{
			$this->display();
		}
	}
	/**
	 * 保险信息信息修改（ajax）
	 *
	 */
	function editdata()
	{
		$data=I('post.');
		$map=array(
			'id'=>$data['id']
		);
		$result = D('Insurance')->ieditData($map,$data);
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
	 * 保险信息道信息获取，一句数据id
	 */
	function GetDetail($id = 1)
	{
		$msg ="";
		$state = 1;
		if(!empty($id))
		{
			$Insurance = D('Insurance');
			$condition["id"] = $id;
			$data = $Insurance->where($condition)->select();
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
	 * 删除(假删除)保险信息
	 */
	public function delete($id = 0){

		if(!empty($id))
		{
			$map=array(
				'id'=>$id
			);
			$result=D('Insurance')->ideleteData($map);
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