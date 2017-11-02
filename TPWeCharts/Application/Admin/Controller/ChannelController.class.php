<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统渠道管理
 */
class ChannelController extends AdminBaseController{
	/**
	 * 售票渠道列表
	 */
	public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log");
		$channel = D("Channel");
		$log->addLog('Log','Channel',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//查询
		$condition=array();
		$condition["isdel"] = 0;
		if($keywords != ''){
			$where["name"] =array('like','%'.$keywords.'%');
			$where['_logic'] = 'or';
			$where["code"] =array('like','%'.$keywords.'%');
			$condition["_complex"] = $where;
		}
		if(!empty($start_date) &&  $start_date!=''){
			$condition["createdate"] =array('egt',$start_date);
		}
		if(!empty($end_date) &&  $end_date!=''){
			$condition["createdate"] =array('elt',$end_date);
		}
		
		$totalRows = $channel->where($condition)->order('iseffective ,sort ')->count();
		$totalPages = 1;
		$listRows = C('PAGE_NUM');;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$channels=$channel->where($condition)->order('iseffective,sort ')->page($p,$listRows)->select();
		foreach ($channels as &$item){
			//$item['createdateformat'] = gmdate("Y-m-d H:i:s",$item['createdate']);
			$item['iseffectiveformat'] = $item['iseffective'] =="0"?"有效":"无效";
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
	 * 售票渠道信息添加
	 */
	public function adddata()
	{
		$data=I('post.');
		unset($data['id']);
		$result = D('Channel')->iaddData($data);
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
	 * 售票渠道信息修改（ajax）
	 *
	 */
	public function editdata()
	{
		$data=I('post.');
		$map=array(
			'id'=>$data['id']
		);
		$result = D('Channel')->ieditData($map,$data);
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
	 * 售票渠道信息获取，一句数据id
	 */
	public function GetDetail($id = 1)
	{
		$msg ="";
		$state = 1;
		if(!empty($id))
		{
			$channel = D('Channel');
			$condition["id"] = $id;
			$data = $channel->where($condition)->select();
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
	 * 删除(假删除)
	 */
	public function delete($id = 0){

		if(!empty($id))
		{
			$map=array(
				'id'=>$id
			);
			$result=D('Channel')->ideleteData($map);
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
