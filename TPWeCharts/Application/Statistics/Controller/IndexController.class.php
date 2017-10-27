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
				$CK_WArray = array();//各客运站售票金额统计
				$ET_WArray = array();//各客运站售票金额统
				$CK_WTotal = 0.0;
				foreach($array_GQCK as $item)
				{
					array_push($GQstation,$item['stationname']);
					$m_ = $item['m_num']/10000;
					$m_ = number_format($m_,2,".","");
					$CK_WTotal +=$m_;
					array_push($CK_WArray,array(
						'stationname' => $item["stationname"],
						'money' => $m_
					));
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
					$CK_WTotal +=$m_;
					array_push($CK_WArray,array(
						'stationname' => $item["stationname"],
						'money' => $m_
					));
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
					$_i_data = array();
					$_i_tdata = array();
					array_push($_i_data,"name", $item);
					array_push($_i_tdata,"name", $item);
					$_data = array();
					$_tdata = array();
					foreach($Estation as $_item)
					{
						foreach($array_ET as $v_)
						{
							if($v_['stationname'] == $_item && $v_['channelname'] == $item )
							{
								array_push($_data,$v_['t_num']);//客票数目
								array_push($_tdata,$v_['m_num']);//客票金额
								
							}
						}
					}
					array_push($_i_data,"data",$_data);
					array_push($_i_tdata,"data",$_tdata);
					array_push($ex_data_ticket,$_i_data);
					array_push($ex_data_money,$_i_tdata);
				}
				//$ex_data_ticket = json_encode($ex_data_ticket);
				//文字统计处理
				$words_data = array();//依据车站统计
				foreach($Estation as $item)
				{
					//
					$_i_data = array();
					array_push($_i_data,"stationname", $item);
					$_data = array();
					foreach($Echannel as $_item)
					{
						$tt = 0;
						$mm = 0.0;
						foreach($array_ET as $v_)
						{
							if($v_['channelname'] == $_item )
							{
								$tt += number_format($v_["t_num"]);
								$mm += number_format($v_["m_num"]);
							}
						}
						array_push($_i_data,$_item.'T',$tt);
						array_push($_i_data,$_item.'M',number_format($mm,2,'.',''));
					}
					array_push($words_data,$_i_data);
				}
				
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
			'CK_WArray' =>$CK_WArray,//各客运站数据统计
			'words_data' =>$words_data,//各客运站数据统电子
			'ex_data_ticket' => $ex_data_ticket,//客票数目
			'ex_data_money' => $ex_data_money,//客票金额
			'array_ET' =>$array_ET,
			'CK_WTotal' => $CK_WTotal,
		);
		$this->ajaxReturn($iresult);//返回操作结果
	}
	/**
	 * 查询统计（搜索查询） 文字统计信息
	 * 执行存储过程
	 * 返回结果集合
	 * 参数存于cookie中
	 */
	function GetResultWords()
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
				$CK_WArray = array();//各客运站售票金额统计
				$ET_WArray = array();//各客运站售票金额统
				$CK_WTotal = 0.0;
				foreach($array_GQCK as $item)
				{
					$m_ = $item['m_num']/10000;
					$m_ = number_format($m_,2,".","");
					$CK_WTotal +=$m_;
					array_push($CK_WArray,array(
						'stationname' => $item["stationname"],
						'money' => $m_
					));
				}
				//县分公司窗口售票数据查询
				$stationfix_1 ="20%";//关区客运站标志过滤符号
				$channelfix_1 ="10%";//渠道标志过滤符号 窗口
				$sql_1 = "  CALL  GQ_CHARTS('{$stationfix_1}','{$channelfix_1}','{$_Search_start}','{$_Search_end}') ";
				$Model_1 = M(""); // 实例化一个model对象 没有对应任何数据表
				$array_XFCK = $Model_1->query($sql_1);
				
				foreach($array_XFCK as $item)
				{
					$m_ = $item['m_num']/10000;
					$m_ = number_format($m_,2,".","");
					$CK_WTotal +=$m_;
					array_push($CK_WArray,array(
						'stationname' => $item["stationname"],
						'money' => $m_
					));
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
				
				//文字统计处理
				$words_data = array();//依据车站统计
				foreach($Estation as $item)
				{
					//
					$_i_data = array();
					array_push($_i_data,"stationname", $item);
					$_data = array();
					foreach($Echannel as $_item)
					{
						$tt = 0;
						$mm = 0.0;
						foreach($array_ET as $v_)
						{
							if($v_['channelname'] == $_item )
							{
								$tt += number_format($v_["t_num"]);
								$mm += number_format($v_["m_num"]);
							}
						}
						array_push($_i_data,$_item.'T',$tt);
						array_push($_i_data,$_item.'M',number_format($mm,2,'.',''));
					}
					array_push($words_data,$_i_data);
				}
				
				//
				break;
		}
		$iresult = array(
			'state' => $state,
			'CK_WArray' =>$CK_WArray,//各客运站数据统计
			'words_data' =>$words_data,//各客运站数据统电子
			'CK_WTotal' => $CK_WTotal,
		);
		$this->ajaxReturn($iresult);//返回操作结果
	}
}

