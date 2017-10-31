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
		//$Model = new M("");
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
     * 销售流水信息列表(整合业务)
     */
    public function indexlist($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
        //访问日志
        $ip = get_client_ip();
        $log = D("Log");
        $SalesFlow = D("SalesFlow");
        $log->addLog('Log','SalesFlow',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
        //查询
        $wherestr ="  ";//搜索条件
        if($keywords != ''){
            $wherestr .= " AND s.name LIKE '%$keywords%' ";
        }
        if($start_date !='' ){
            $wherestr .= " AND sf.flowdate>=$start_date  ";
        }
        if( $end_date !=''){
            $wherestr .= " AND  sf.flowdate<=$end_date ";
        }

        $sql = "
        SELECT
		count(
            DISTINCT sf.groupnum /* 分组编码 */
            ,s.`name` /* 客运站名称 */
            ,sf.stationcode /* 客运站编码 */
            ,sf.flowdate /* 录入日期 */
            ) AS icount
        FROM
            sales_flow AS sf
        LEFT JOIN
            station AS s ON sf.stationcode=s.`code`
        WHERE
            sf.isdel=0 AND s.isdel=0 AND s.iseffective=0
        ";//查询记录数目
        $sql .=$wherestr;
        $Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
        $counts = $Model->query($sql);
        $totalRows = $counts[0]['icount'];
        $totalPages = 1;
        $listRows = C('PAGE_NUM');
        if($totalRows>$listRows)
        {
            $totalPages = $totalRows/$listRows;
        }
        //$channels=$SalesFlow->where($condition)->order('createdate desc')->page($p,$listRows)->select();
        $condition_ = array();
        $condition_["a.isdel"] = 0;
        $condition_["c.isdel"] = 0;
        $condition_["c.iseffective"] = 0;
        $channels=$SalesFlow->where($condition_)
            ->distinct(true)
            ->field('a.groupnum,a.stationcode,c.name station,a.flowdate ')
            ->alias('a')
            ->join(' LEFT JOIN Station c ON c.code= a.stationcode')
            ->order('a.groupnum desc ')->page($p,$listRows)->select();
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
	 * 销售流水信息信息添加（视图）
	 */
	 public function iadd()
	 {
	 	$channel = D('Channel');
		//
		$cargs = array(
			'iseffective' => 0,
			'isdel' => 0
		);
		$channels = $channel->where($cargs)->order('sort')->select();
		//
		$assign=array(
			'channels' => $channels
			);
		$this->assign($assign);
	 	$this->display();
	 }
    /**
     * 销售流水信息信息编辑（视图）
     */
    public function iedit()
    {
        $channel = D('Channel');
        //
        $cargs = array(
            'iseffective' => 0,
            'isdel' => 0
        );
        $channels = $channel->where($cargs)->order('sort')->select();
        //
        $assign=array(
            'channels' => $channels
        );
        $this->assign($assign);
        $this->display();
    }
    /**
     * 销售流水信息信息详细（视图）
     */
    public function idetail()
    {
        $channel = D('Channel');
        //
        $cargs = array(
            'iseffective' => 0,
            'isdel' => 0
        );
        $channels = $channel->where($cargs)->order('sort')->select();
        //
        $assign=array(
            'channels' => $channels
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
	 * 销售流水信息信息添加(多条数据一起)
	 */
	public function addlistdata()
	{
		$data = $_POST['list'];
		$d_json = json_decode($data,TRUE);
		if(!empty($d_json)) {//字段校验
			$listCount =count($d_json);//数组长度
			$addCount =0;//添加完成数目
			$tb = D('SalesFlow');
			$tb->startTrans();//开启事务
			foreach($d_json as $item)
			{
				if($item['id'] == '')
				{//add
					unset($item['id']);
					$re = $tb->iaddData($item);
				}
				else
				{//update
					$map=array(
						'id'=>$item['id']
					);
					$re = $tb->ieditData($map,$item);
				}
				if($re){
					$addCount ++;
				}
			}
			if ($listCount == $addCount) {
				$tb->commit();//事务提交
				$msg = '保存成功';//,U('Admin/DicData/index')
				$iresult = array(
					'state' => 0,
					'msg' => $msg
				);
			}else{
				$tb->rollback();//回滚
				$msg = '保存失败'.$addCount;
				$iresult = array(
					'state' => 1,
					'msg' => $msg
				);
			}
		}else
		{
			$msg = '添加失败（验证不通过！）-'.count($data);
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
	public function editdata()
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
	public function GetDetail($id = 1)
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
	 * 依据分组编码查询销售流水信息（每日只于许录入一批记录）
	 */
	public function findInfoByNum_()
	{
		//
		$data=I('post.');
		$d = D("SalesFlow");
		$msg ="";
		$state = 0;
		if(!empty($data['groupnum'])&&!empty($data['stationcode'])) {
			$condition = array(
				'groupnum' => $data['groupnum'],
				'stationcode' => $data['stationcode'],
				'isdel' => 0
			);
			//
			$dat = $d->where($condition)->select();
			$count = $d->where($condition)->count();
			if($count > 1)
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
     * 删除(假删除)销售流水信息
     */
    public function idelete($id = 0){
        $data=I('post.');
        if(!empty($data['groupnum']) && !empty($data['stationcode']))
        {
            $dt = D('SalesFlow');
            $dt->startTrans();//开启事务
            $map=array(
                'groupnum'=>$data['groupnum'],
                'stationcode'=>$data['stationcode']
            );
            $list = $dt->where($map)->select();
            $delcout = 0;
            $icout = count($list);
            foreach($list as $item)
            {
                $imap=array(
                    'id'=>$item['id']
                );
                $re = $dt->ideleteData($imap);
                if($re)
                {
                    $delcout++;
                }
            }
            if($delcout == $icout){
                $state = 0;
                $msg ="成功！";
                $dt->commit();
            }else{
                $state = -1;
                $msg ="失败！";
                $dt->rollback();
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
		$stations = $station->where($sargs)->order("sort")->select();
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
	/**
	 * 依据参数获得进度相关数据
	 * xhy
	 */
	public function GetProcess()
	{
		//获得所需数据
		$data=I('post.');
		if(!empty($data['groupnum']))
		{
			$gnum = $data['groupnum'];
			$sql = "SELECT s.* FROM station AS s WHERE s.`code` NOT IN(
					SELECT DISTINCT sf.stationcode AS 'code' FROM sales_flow AS sf WHERE sf.groupnum=$gnum  AND sf.isdel=0
					)
					AND s.iseffective=0 AND s.isdel=0 ORDER BY s.sort
			";
			$Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
			$stations = $Model->query($sql);
			if($stations)
			{
				$result = array(
				'state' => 0,
				'msg' => '有未完成进度！',
				'data' => $stations
				);
			}else
			{
				$result = array(
				'state' => 2,
				'msg' => '添加完成！',
				'data' => $stations
				);
			}
		}else
		{
			$result = array(
				'state' => -1,
				'msg' => '请求数据失败(参数不正确)！'.$data['groupnum'],
				'data' => array()
			);
		}
		$this->ajaxReturn($result);//返回操作结果
	}
	/*
	 *依据车站获得所需要的渠道详细列表
	 *xhy
	 * */
	public function GetChannelsByParams()
	{
		$data=I('post.');
		$channels = array();
		$state = 0;
		$msg ="成功！";
		if(!empty($data["StationCode"]))	{
			$channel = D('Channel');
			$IDS_ = implode(',',$data["StationCode"]);

			$cargs = array(
				'in' => $IDS_,
				'iseffective' => 0,
				'isdel' => 0
			);
			$channels = $channel->where($cargs)->order('sort')->select();
		}else{
			$state = 1;
			$msg ="失败！";
		}
		//
		$result = array(
			'state' => $state,
			'msg' => $msg,
			'data' => $channels
		);
		$this->ajaxReturn($result);//返回操作结果
	}
}
