<?php
namespace Statistics\Controller;
use Common\Controller\StatisticsBaseController;
use Think\Controller;
use Think\Model;
/**
 * 查询统计 首页Controller
 */
class IndexController extends StatisticsBaseController{
	/**
	 * 查询统计页面
	 */
	public function Index(){
		$assign=array(
			'msg' => 'OK'
		);
		$this->assign($assign);
        $this->display();
	}

	/**
	 * 查询统计对比页面
	 */
	public function Contrast(){
		$this->display();
	}
	/**
	 * 查询统计（搜索页面）
	 */
	public function Search(){
		$this->display();
	}

	/**
	 * 查询统计（搜索查询）
	 * 执行存储过程
	 * 返回结果集合
	 * 参数存于cookie中
	 */
	function GetResult()
	{
		$data=I('post.');
		$_Search_start = $data['_Search_start'];
		$_Search_end = $data['_Search_end'];
		$_Search_start_next = $data['_Search_start_next'];
		$_Search_end_next = $data['_Search_end_next'];
		$_Search_flag = $data['_Search_flag'];
		$state = 0;
		switch($_Search_flag)
		{
			case 0://统计查询
				if(!empty($_Search_start))
				{
					if(empty($_Search_end))
					{
						$_Search_end = $_Search_start;
					}
				}
				//关区窗口售票数据查询
				$stationfix ="10%";//关区客运站标志过滤符号
				$channelfix ="10%";//渠道标志过滤符号 窗口
				$sql = "  CALL  GQ_CHARTS('{$stationfix}','{$channelfix}','{$_Search_start}','{$_Search_end}') ";
				$Model = M(""); // 实例化一个model对象 没有对应任何数据表
				$array_GQCK = $Model->query($sql);
				$GQstation = array();//关区客运站
				$GQMmun= array();//关区客运站金额
				foreach($array_GQCK as $item)
				{
					array_push($GQstation,$item['stationname']);
					$m_ = $item['m_num']/10000;
					$m_ = number_format($m_,2,".","");
					array_push($GQMmun,$m_);
				}
				//县分公司窗口售票数据查询
				$stationfix_1 ="20%";//关区客运站标志过滤符号
				$channelfix_1 ="10%";//渠道标志过滤符号 窗口
				$sql_1 = "  CALL  GQ_CHARTS('{$stationfix_1}','{$channelfix_1}','{$_Search_start}','{$_Search_end}') ";
				$Model_1 = M(""); // 实例化一个model对象 没有对应任何数据表
				$array_XFCK = $Model_1->query($sql_1);
				$XFstation = array();//县分客运站
				$XFMmun= array();//县分客运站金额
				foreach($array_XFCK as $item)
				{
					array_push($XFstation,$item['stationname']);
					$m_ = $item['m_num']/10000;
					$m_ = number_format($m_,2,".","");
					array_push($XFMmun,$m_);
				}
				//电子客票数据处理
				$stationfix_2_a ="10%";//关区 客运站标志过滤符号
				$stationfix_2_b ="20%";//县分 客运站标志过滤符号
				$channelfix_2 ="20%";//渠道标志过滤符号 电子票
				$sql_2 = "  CALL  GQXF_ETICKET_CHARTS('{$stationfix_2_a}','{$stationfix_2_b}','{$channelfix_2}','{$_Search_start}','{$_Search_end}') ";
				$Model_2 = M(""); // 实例化一个model对象 没有对应任何数据表
				$array_ET = $Model_2->query($sql_2);
				$Estation = array();//统计的客运站
				$Echannel = array();//统计的渠道
				foreach($array_ET as $item)
				{
					array_push($Estation,$item['stationname']);
					array_push($Echannel,$item['channelname']);
				}

				$Echannel = array_unique($Echannel);
				$Estation = array_flip($Estation);
				$Estation = array_keys($Estation);
				//图表X周数据
				$ex_data_ticket = array();//客票数目
				$ex_data_money = array();//客票金额
				foreach($Echannel as $item)
				{
					//
					array_push($ex_data_ticket,array("name" => $item));
					$_data = array();

					foreach($Estation as $_item)
					{
						foreach($array_ET as $v_)
						{
							if($v_['stationname'] == $_item && $v_['channelname'] == $item )
							{
								array_push($_data,$v_['t_num']);//客票数目
							}
						}
					}
					array_push($ex_data_ticket,"data",$_data);
				}
				//$ex_data_ticket = json_encode($ex_data_ticket);
				//
				break;
		}
		$iresult = array(
			'state' => $state,
			'GQstation' =>$GQstation,//关区客运站
			'GQMmun' =>$GQMmun,//关区客运站金额
			'XFstation' =>$XFstation,//县分客运站
			'XFMmun' =>$XFMmun,//县分客运站金额
			'Echannel' =>$Echannel,//电子票渠道
			'Estation' =>$Estation,//电子票对比客运站
			'TEST' =>$Echannel,//电子票渠道
			'ex_data_ticket' => $ex_data_ticket,//客票数目
			'array_ET' =>$array_ET
		);
		$this->ajaxReturn($iresult);//返回操作结果
	}
}

