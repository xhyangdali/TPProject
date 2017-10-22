<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统销售流水信息管理
 */
class SalesFlowController extends AdminBaseController{
	/**
	 * 销售流水信息列表
	 */
	public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log");
		$SalesFlow = D("SalesFlow");
		$log->addLog('Log','SalesFlow',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//查询
		$condition=array();
		$condition["isdel"] = 0;
		if($keywords != ''){
			$condition["name"] =array('like','%'.$keywords.'%');
		}
		if($start_date !='' && $end_date !=''){
			$condition["createdate[<>]"] =array($start_date,$end_date);
		}
		
		$totalRows = $SalesFlow->where($condition)->order('createdate desc')->count();
		$totalPages = 1;
		$listRows = C('PAGE_NUM');
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		//$channels=$SalesFlow->where($condition)->order('createdate desc')->page($p,$listRows)->select();
		$condition_ = array();
		$condition_["a.isdel"] = 0;
		$channels=$SalesFlow->where($condition_)
			->field('a.*,b.name as channel,c.name station ')
			->alias('a')->join(' LEFT JOIN Channel b ON b.code= a.channelcode')
			->join(' LEFT JOIN Station c ON c.code= a.stationcode')
			->order('createdate desc')->page($p,$listRows)->select();
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
	 * 销售流水信息信息添加
	 */
	function adddata()
	{
		$data=I('post.');
		unset($data['id']);
		if(!empty($data['channelcode']) && !empty($data['stationcode'])
			&& !empty($data['groupnum'])
			&& !empty($data['ticketnum'])&& !empty($data['moneynum'])) {//字段校验
			$result = D('SalesFlow')->iaddData($data);
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
		}else
		{
			$msg = '添加失败（验证不通过！）';
			$iresult = array(
				'state' => -1,
				'msg' => $msg
			);
		}
		$this->ajaxReturn($iresult);//返回操作结果
	}
	/**
	 * 销售流水信息信息修改（ajax）
	 *
	 */
	function editdata()
	{
		$data=I('post.');
		$map=array(
			'id'=>$data['id']
		);
		$result = D('SalesFlow')->ieditData($map,$data);
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
	 * 销售流水信息道信息获取，一句数据id
	 */
	function GetDetail($id = 1)
	{
		$msg ="";
		$state = 1;
		if(!empty($id))
		{
			$SalesFlow = D('SalesFlow');
			$condition["id"] = $id;
			$data = $SalesFlow->where($condition)->select();
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
	 * 依据分组编码查询销售流水信息（每日只于许录入一条记录）
	 */
	public function findInfoByNum()
	{
		//
		$data=I('post.');
		$d = D("SalesFlow");
		$msg ="";
		$state = 0;
		if(!empty($data['groupnum'])&&!empty($data['channelcode'])&&!empty($data['stationcode'])) {
			$condition = array(
				'groupnum' => $data['groupnum'],
				'channelcode' => $data['channelcode'],
				'stationcode' => $data['stationcode'],
				'isdel' => 0
			);
			//
			$dat = $d->where($condition)->select();
			$count = $d->where($condition)->count();
			if($count == 1)
			{
				$state = 0;
				$msg ="有数据！";
			}else{
				$state = 1;
				$msg ="查询不到数据！";
			}
		}else
		{
			$state = -1;
			$dat = array();
			$msg ="数据获取失败(参数不正确)！";
		}
		$result =array(
			'state' => $state,
			'msg' => $msg,
			'data' => $dat
		);
		$this->ajaxReturn($result);//返回操作结果
	}
	/**
	 * 删除(假删除)销售流水信息
	 */
	public function delete($id = 0){

		if(!empty($id))
		{
			$map=array(
				'id'=>$id
			);
			$result=D('SalesFlow')->ideleteData($map);
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
	 * 一次性请求售票流水的初始化数据
	 * xhy
	 */
	public function initItems()
	{
		//获得所需数据
		$dic = D('DicData');
		$channel = D('Channel');
		$station = D('Station');
		//units
		$Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
		$units = $Model->query("
 					SELECT * FROM dic_data WHERE pid
 					IN( SELECT id FROM dic_data WHERE dickey ='MONEYUNIT' )
 		");
		//渠道信息
		$cargs = array(
			'isdel' => 0,
			'iseffective' => 0
		);
		$channels = $channel->where($cargs)->select();
		//客运站
		$sargs = array(
			'isdel' => 0,
			'iseffective' => 0
		);
		$stations = $station->where($sargs)->select();
		if($units&&$channels&&$stations) {
			$result = array(
				'state' => 0,
				'units' => $units,
				'channels' => $channels,
				'stations' => $stations
			);
		}else
		{
			$result = array(
				'state' => -1,
				'msg' => '请求数据失败！'
			);
		}
		$this->ajaxReturn($result);//返回操作结果
	}
}
