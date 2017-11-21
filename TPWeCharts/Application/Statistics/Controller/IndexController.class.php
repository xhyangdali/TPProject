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
		$setuid = new \Statistics\Controller\Imp();
		//$uid = $setuid->useruid();
		if(!$_SESSION['user_'] && ( !$_SESSION['user_']['id']  || $_SESSION['user_']['access'] != "0" ) ) {
			$setuid = new \Statistics\Controller\Imp();
			//$uid = $setuid->useruid();
		}
		$ip = get_client_ip();
		//查询条件
		$cookie_ = array(
			"_Search_start" => $_COOKIE['_Search_start'],
			"_Search_end" => $_COOKIE['_Search_end'],
			"_Search_start_next" =>  $_COOKIE['_Search_start_next'],
			"_Search_end_next" =>  $_COOKIE['_Search_end_next'],
			"_Search_flag" =>  $_COOKIE['_Search_flag']
		);
		$log = D("Log");
		$log->addLog('ACSESS','ContrastIndex',json_encode(array('Result::' => true,'Data::'=>$cookie_,'IP::'=>$ip)),'');

        $this->display();
	}

	/**
	 * 查询统计对比页面
	 */
	public function Contrast(){
		//$setuid = new \Statistics\Controller\Imp();
		//$uid = $setuid->useruid();
		if(!$_SESSION['user_'] && ( !$_SESSION['user_']['id']  || $_SESSION['user_']['access'] != "0" )  ) {
			$setuid = new \Statistics\Controller\Imp();
			//$uid = $setuid->useruid();
		}
		$ip = get_client_ip();
		//查询条件
		$cookie_ = array(
			"_Search_start" => $_COOKIE['_Search_start'],
			"_Search_end" => $_COOKIE['_Search_end'],
			"_Search_start_next" =>  $_COOKIE['_Search_start_next'],
			"_Search_end_next" =>  $_COOKIE['_Search_end_next'],
			"_Search_flag" =>  $_COOKIE['_Search_flag']
		);
		$log = D("Log");
		$log->addLog('ACSESS','Contrast',json_encode(array('Result::' => true,'Data::'=>$cookie_,'IP::'=>$ip)),'');
		$this->display();
	}
	/**
	 * 查询统计（搜索页面）
	 */
	public function Search(){
		//$setuid = new \Statistics\Controller\Imp();
		//$uid = $setuid->useruid();
		if(!$_SESSION['user_'] && ( !$_SESSION['user_']['id']  || $_SESSION['user_']['access'] != "0" ) ) {
			$setuid = new \Statistics\Controller\Imp();
			//$uid = $setuid->useruid();
		}
		$ip = get_client_ip();
		//查询条件
		$cookie_ = array(
			"_Search_start" => $_COOKIE['_Search_start'],
			"_Search_end" => $_COOKIE['_Search_end'],
			"_Search_start_next" =>  $_COOKIE['_Search_start_next'],
			"_Search_end_next" =>  $_COOKIE['_Search_end_next'],
			"_Search_flag" =>  $_COOKIE['_Search_flag']
		);
		$log = D("Log");
		$log->addLog('ACSESS','Search',json_encode(array('Result::' => true,'Data::'=>$cookie_,'IP::'=>$ip)),'');
		$this->display();
	}
	/**
	 * 查询统计（搜索查询）图表信息
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
			case 0://统计查询--无对比
				if(!empty($_Search_start))
				{
					if(empty($_Search_end))
					{
						$_Search_end = $_Search_start;
					}
				}		
				
				$cache_charts = 'charts'.$_Search_start.'VS'.$_Search_end;
				if(!S($cache_charts)){
					//电子卡占比统计
					$sql_ = "  CALL  ZB_ETICKET_CHARTS('{$_Search_start}','{$_Search_end}') ";
					$Model_ = M(""); // 实例化一个model对象 没有对应任何数据表
					$array_ZB = $Model_->query($sql_);
					$ZB_ck=0;
					$ZB_et=0;
					$ZB_ck_t=0;
					$ZB_et_t=0;
					if(count($array_ZB)>0){
						foreach($array_ZB as $v)
						{
							if($v["flag"] == "CK")
							{
								$ZB_ck_t = $v["t_num"];
								$ZB_ck = $v["m_num"];
							}else{
								$ZB_et_t = $v["t_num"];
								$ZB_et = $v["m_num"];
							}
						}
					}
					$ZB_m = $ZB_et/($ZB_ck+$ZB_et);
					$ZB_m = number_format($ZB_m,2,".","");
					$ZB_n = $ZB_et_t/($ZB_ck_t+$ZB_et_t);
					$ZB_n = number_format($ZB_n,2,".","");
					$ZB_result = array(
						"ZB_m" => $ZB_m,
						"ZB_n" => $ZB_n
					);
					//关区窗口售票数据查询
					$stationfix ="10%";//关区客运站标志过滤符号
					$channelfix ="10%";//渠道标志过滤符号 窗口
					$sql = "  CALL  GQ_CHARTS('{$stationfix}','{$channelfix}','{$_Search_start}','{$_Search_end}') ";
					$Model = M(""); // 实例化一个model对象 没有对应任何数据表
                    $array_GQCK = $Model->query($sql);
//					$cache_gqck = 'gqck'.$_Search_start.'VS'.$_Search_end;
//					if(!S($cache_gqck)){
//						$array_GQCK = $Model->query($sql);
//						S($cache_gqck,$array_GQCK,7200,'File');
//					}else
//					{
//						$array_GQCK = S($cache_gqck);
//					}
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
					//
//					$cache_xfck = 'xfck'.$_Search_start.'VS'.$_Search_end;
//					//$array_XFCK = array();
//					if(!S($cache_xfck)){
//                        $array_XFCK = $Model_1->query($sql_1);
//						S($cache_xfck,$array_XFCK,7200,'File');
//					}else
//					{
//						$array_XFCK = S($cache_xfck);
//					}
					$XFstation = array();//县分客运站
					$XFMmun= array();//县分客运站金额
					//
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
					//
                    $array_ET = $Model_2->query($sql_2);
//					$cache_et= 'et'.$_Search_start.'VS'.$_Search_end;
//					//$array_ET = array();
//					if(!S($cache_et)){
//						$array_ET = $Model_2->query($sql_2);
//						S($cache_et,$array_ET,7200,'File');
//					}else
//					{
//						$array_ET = S($cache_et);
//					}
					
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
									$m_ = $v_['m_num']/10000;
									$m_ = number_format($m_,2,".","");
									array_push($_tdata,$m_);//客票金额	
								}
							}
						}
						array_push($_i_data,"data",$_data);
						array_push($_i_tdata,"data",$_tdata);
						array_push($ex_data_ticket,$_i_data);
						array_push($ex_data_money,$_i_tdata);
					}
					$iresult = array(
							'state' => $state,
							'GQstation' =>$GQstation,//关区客运站
							'GQMmun' =>$GQMmun,//关区客运站金额
							'XFstation' =>$XFstation,//县分客运站
							'XFMmun' =>$XFMmun,//县分客运站金额
							'Echannel' =>$Echannel,//电子票渠道
							'Estation' =>$Estation,//电子票对比客运站
							'ex_data_ticket' => $ex_data_ticket,//客票数目
							'ex_data_money' => $ex_data_money,//客票金额
							'array_ET' =>$array_ET,
							'ZB_result' => $ZB_result /* 占比：电子客票与窗口票 */
						);
					S($cache_charts,$iresult,7200,'File');
				}else{
					$iresult = S($cache_charts);
				}
				
				break;
				default:	
					//
					$cache_charts_ = $_Search_flag.'_charts_'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
					if(!S($cache_charts_)){
						//关区窗口售票数据查询
						$stationfix ="10%";//关区客运站标志过滤符号
						$channelfix ="10%";//渠道标志过滤符号 窗口
						$sql = "  CALL TB_CHARTS('{$stationfix}','{$channelfix}','{$_Search_start}','{$_Search_end}'
						,'{$_Search_start_next}','{$_Search_end_next}') ";
						$Model = M(""); // 实例化一个model对象 没有对应任何数据表
                        $array_GQCK = $Model->query($sql);
//						$cache_gqck = $_Search_flag.'_gqck'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
//						if(!S($cache_gqck)){
//							$array_GQCK = $Model->query($sql);
//							S($cache_gqck,$array_GQCK,7200,'File');
//						}else
//						{
//							$array_GQCK = S($cache_gqck);
//						}
						//关区窗口售票情况对比处理
						$GQStations = array();
						$GQ_Now_MData = array();
						$GQ_Next_MData = array();
						$GQ_Data = array();
						foreach($array_GQCK as $item)
						{
							$m_ = $item['m_num']/10000;
							$m_ = number_format($m_,2,".","");
							if($item['flag'] == "Now")
							{
								array_push($GQStations,$item['stationname']);
								array_push($GQ_Now_MData,$m_);
							}else{
								array_push($GQ_Next_MData,$m_);
							}
						}
						array_push($GQ_Data,array(
							'station' => $GQStations,
							'now' => $GQ_Now_MData,
							'next' => $GQ_Next_MData
						));
						//县份公司统计
						//县份公司窗口售票数据查询
						$stationfix_1 ="20%";//县份公司客运站标志过滤符号
						$channelfix_1 ="10%";//渠道标志过滤符号 窗口
						$sql_1 = "  CALL TB_CHARTS('{$stationfix_1}','{$channelfix_1}','{$_Search_start}','{$_Search_end}'
						,'{$_Search_start_next}','{$_Search_end_next}') ";
						$Model_1 = M(""); // 实例化一个model对象 没有对应任何数据表
						//
                        $array_XFCK = $Model_1->query($sql_1);
//						$cache_xfck = $_Search_flag.'_xfck'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
//						if(!S($cache_xfck)){
//							$array_XFCK = $Model_1->query($sql_1);
//							S($cache_xfck,$array_XFCK,7200,'File');
//						}else
//						{
//							$array_XFCK = S($cache_xfck);
//						}
						
						//关区窗口售票情况对比处理
						$XFStations = array();
						$XF_Now_MData = array();
						$XF_Next_MData = array();
						$XF_Data = array();
						foreach($array_XFCK as $item)
						{
							$m_ = $item['m_num']/10000;
							$m_ = number_format($m_,2,".","");
							if($item['flag'] == "Now")
							{
								array_push($XFStations,$item['stationname']);
								array_push($XF_Now_MData,$m_);
							}else{
								array_push($XF_Next_MData,$m_);
							}
						}
						array_push($XF_Data,array(
							'station' => $XFStations,
							'now' => $XF_Now_MData,
							'next' => $XF_Next_MData
						));
						//
						//电子票统计查询询
						$stationfix_2 ="10%";//关区客运站标志过滤符号
						$stationfix_20 ="20%";//县份公司客运站标志过滤符号
						$channelfix_2 ="20%";//渠道标志过滤符号 电子票
						$sql_2 = "  CALL TB_ETICKET_CHARTS('{$stationfix_2}','{$stationfix_20}'
						,'{$channelfix_2}','{$_Search_start}','{$_Search_end}'
						,'{$_Search_start_next}','{$_Search_end_next}') ";
						$Model_2 = M(""); // 实例化一个model对象 没有对应任何数据表
						//
                        $array_ETTB = $Model_2->query($sql_2);
//						$cache_ettb = $_Search_flag.'_ettb'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
//						if(!S($cache_ettb)){
//							$array_ETTB = $Model_2->query($sql_2);
//							S($cache_ettb,$array_ETTB,7200,'File');
//						}else
//						{
//							$array_ETTB = S($cache_ettb);
//						}
						
						$ETStations = array();
						$ET_Now_MData = array();
						$ET_Next_MData = array();
						$ET_Now_TData = array();
						$ET_Next_TData = array();
						$ET_Data = array();
						foreach($array_ETTB as $item)
						{
							$m_ = $item['m_num']/10000;
							$m_ = number_format($m_,2,".","");
							if($item['flag'] == "Now")
							{
								array_push($ETStations,$item['stationname']);
								array_push($ET_Now_MData,$m_);
								array_push($ET_Now_TData,$item["t_num"]);
							}else{
								array_push($ET_Next_MData,$m_);
								array_push($ET_Next_TData,$item["t_num"]);
							}
						}
						array_push($ET_Data,array(
							'station' => $ETStations,
							'now_m' => $ET_Now_MData,
							'next_m' => $ET_Next_MData,
							'now_t' => $ET_Now_TData,
							'next_t' => $ET_Next_TData
						));
						$iresult = array(
									'state' => $state,
									'gq_data' => $GQ_Data, //关区数据
									'xf_data' => $XF_Data, //县份数据
									'et_data' => $ET_Data //电子票数据
							);
						S($cache_charts_,$iresult,7200,'File');
					}else{
						$iresult = S($cache_charts_);
					}
					
		}
		
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
				$cache_words = 'words'.$_Search_start.'VS'.$_Search_end;
				if(!S($cache_words)){
					//关区窗口售票数据查询
					$stationfix ="10%";//关区客运站标志过滤符号
					$channelfix ="10%";//渠道标志过滤符号 窗口
					$sql = "  CALL  GQ_CHARTS('{$stationfix}','{$channelfix}','{$_Search_start}','{$_Search_end}') ";
					$Model = M(""); // 实例化一个model对象 没有对应任何数据表
					//
                    $array_GQCK = $Model->query($sql);
//					$cache_gqck = 'words_gqck'.$_Search_start.'VS'.$_Search_end;
//					if(!S($cache_gqck)){
//						$array_GQCK = $Model->query($sql);
//						S($cache_gqck,$array_GQCK,7200,'File');
//					}else
//					{
//						$array_GQCK = S($cache_gqck);
//					}
					
					$CK_WArray = array();//各客运站售票金额统计
					$ET_WArray = array();//各客运站售票金额统
					$CK_WTotal = 0.0;
					$CK_WTicket = 0;
					foreach($array_GQCK as $item)
					{
						$m_ = $item['m_num']/10000;
						$m_ = number_format($m_,2,".","");
						$CK_WTotal +=$m_;
						$CK_WTicket += $item['t_num'];
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
					//
                    $array_XFCK = $Model_1->query($sql_1);
//					$cache_xfck = 'words_xfck'.$_Search_start.'VS'.$_Search_end;
//					if(!S($cache_xfck)){
//						$array_XFCK = $Model_1->query($sql_1);
//						S($cache_xfck,$array_XFCK,7200,'File');
//					}else
//					{
//						$array_XFCK = S($cache_xfck);
//					}
					
					foreach($array_XFCK as $item)
					{
						$m_ = $item['m_num']/10000;
						$m_ = number_format($m_,2,".","");
						$CK_WTotal +=$m_;
						$CK_WTicket += $item['t_num'];
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
					//
                    $array_ET = $Model_2->query($sql_2);
//					$cache_et = 'words_et'.$_Search_start.'VS'.$_Search_end;
//					if(!S($cache_et)){
//						$array_ET = $Model_2->query($sql_2);
//						S($cache_et,$array_ET,7200,'File');
//					}else
//					{
//						$array_ET = S($cache_et);
//					}
					
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
					//保险票
					$sql_3 = "  CALL  TJ_BX('{$_Search_start}','{$_Search_end}') ";
					$Model_3 = M(""); // 实例化一个model对象 没有对应任何数据表
					//
                    $array_BX = $Model_3->query($sql_3);
//					$cache_bx = 'words_bx'.$_Search_start.'VS'.$_Search_end;
//					if(!S($cache_bx)){
//						$array_BX = $Model_3->query($sql_3);
//						S($cache_bx,$array_BX,7200,'File');
//					}else
//					{
//						$array_BX = S($cache_bx);
//					}
					
					//文字统计处理
					$words_data = array();//依据车站统计
					$total_data = array();//全部统计数据
					$total_t = 0;//车票
					$total_m = 0;//金额
					$total_i = $array_BX[0]['i_num'] == null?0:$array_BX[0]['i_num'];//保险
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
								if($v_['channelname'] == $_item && $v_['stationname'] == $item )
								{
									$tt += $v_["t_num"];
									$mm += $v_["m_num"];
								}
							}
							$total_t += $tt;
							$total_m += $mm;
							array_push($_i_data,$_item.'：<var> ',$tt);
							array_push($_i_data,' </var> 张，共计： ',number_format($mm,2,'.',''));
						}
						array_push($words_data,$_i_data);
					}
					
						//总计数据：
						$total_data = array();
						$total_m = number_format($total_m,2,".",""); 
						array_push($total_data,array(
							'etotal_t' => $total_t,//电子票数
							'etotal_m' => $total_m,//电子票金额
							'total_i' => $total_i,//保险
							'total_ck_m' => $CK_WTotal,// 窗口总计数据 金额
							'total_ck_t' => $CK_WTicket //窗口票数
						));
						//
						$iresult = array(
							'state' => $state,
							'CK_WArray' =>$CK_WArray,//各客运站数据统计
							'words_data' =>$words_data,//各客运站数据统电子
							'total_data' => $total_data //总计数据
						);
						S($cache_words,$iresult,7200,'File');
					}else{
						$iresult = S($cache_words);
					}
				break;
				default:
					$cache_words_ = $_Search_flag.'_words_'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
					if(!S($cache_words_)){
						$stationfix ="%";//关区客运站标志过滤符号
						$channelfix ="10%";//渠道标志过滤符号 窗口
						$sql = "  CALL TB_CHARTS('{$stationfix}','{$channelfix}','{$_Search_start}','{$_Search_end}'
						,'{$_Search_start_next}','{$_Search_end_next}') ";
						$Model = M(""); // 实例化一个model对象 没有对应任何数据表
                        $array_GQCK = $Model->query($sql);
//						$cache_gqck = $_Search_flag.'_words_gqck'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
//						if(!S($cache_gqck)){
//							$array_GQCK = $Model->query($sql);
//							S($cache_gqck,$array_GQCK,7200,'File');
//						}else
//						{
//							$array_GQCK = S($cache_gqck);
//						}
						
						$TBWArray = array();
						$TBWArray_next = array();
						$CK_WTotal = 0.0;
						$CK_WTicket = 0;
						$CK_WTotal_ = 0.0;
						$CK_WTicket_ = 0;
						//关区窗口售票情况对比处理
						foreach($array_GQCK as $item)
						{
							$m_ = $item['m_num']/10000;
							$m_ = number_format($m_,2,".","");

							if($item['flag'] == "Now")
							{
								$CK_WTotal +=$m_;
								$CK_WTicket +=$item["t_num"];
								array_push($TBWArray,array(
									'stationname' => $item["stationname"],
									'num' => $m_,
									'code' => $item["stationcode"]
								));
							}else
							{
								$CK_WTotal_ +=$m_;
								$CK_WTicket_ +=$item["t_num"];
								array_push($TBWArray_next,array(
									'stationname' => $item["stationname"],
									'num' => $m_,
									'code' => $item["stationcode"]
								));
							}
						}
						//表格数据
						$TB_Data = array();
						foreach($TBWArray as $item)
						{
							foreach($TBWArray_next as $item_next)
							{
								if($item["code"] == $item_next["code"] )
								{
									if($item["num"] > $item_next["num"])
									{
										$tbnum = $item["num"]- $item_next["num"];
										$tb_ = '+';
									}else
									{
										$tbnum = $item_next["num"]- $item["num"];
										$tb_ = '-';
									}
									$tb_zf = 100*($tbnum/$item["num"]);
									$tb_zf = number_format($tb_zf,2,'.','');
									$tbnum = number_format($tbnum,2,'.','');
									$tb_text = $tb_."".$tbnum."|".$tb_."".$tb_zf."%";
									array_push($TB_Data,array(
										"stationname" => $item["stationname"],//名称
										"m_num" => $item["num"],//金额
										"n_num" => $item_next["num"],//金额
										"tb_text" => $tb_text
									));
								}
							}
						}
						//第二时段统计
						//
						//电子客票数据处理
						$stationfix_2_a ="10%";//关区 客运站标志过滤符号
						$stationfix_2_b ="20%";//县分 客运站标志过滤符号
						$channelfix_2 ="20%";//渠道标志过滤符号 电子票
						$sql_2 = "  CALL  QDTB_ETICKET_CHARTS('{$stationfix_2_a}','{$stationfix_2_b}','{$channelfix_2}','{$_Search_start}','{$_Search_end}','{$_Search_start_next}','{$_Search_end_next}') ";
						$Model_2 = M(""); // 实例化一个model对象 没有对应任何数据表
						//
                        $array_ET = $Model_2->query($sql_2);
//						$cache_et = $_Search_flag.'_words_et'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
//						if(!S($cache_et)){
//							$array_ET = $Model_2->query($sql_2);
//							S($cache_et,$array_ET,7200,'File');
//						}else
//						{
//							$array_ET = S($cache_et);
//						}
						//
						$Echannel = array();
						$Estation = array();
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
						$words_data_ = array();//依据车站统计后段
						$total_t = 0;//车票
						$total_t_ = 0;//车票 后段
						$total_m = 0;//金额
						$total_m_ = 0;//金额 后段
						//
						foreach($Estation as $item)
						{
							//
							$_i_data = array();
							array_push($_i_data,"stationname", $item);
							$_i_data_ = array();
							array_push($_i_data_,"stationname", $item);
							foreach($Echannel as $_item)
							{
								$tt = 0;$tt_=0;
								$mm = 0.0;$mm_=0.0;
								foreach($array_ET as $v_)
								{
									if($v_['flag'] == "Now") {
										if ($v_['channelname'] == $_item && $v_['stationname'] == $item) {
											$tt += $v_["t_num"];
											$mm += $v_["m_num"];
										}
									}else{
										if ($v_['channelname'] == $_item && $v_['stationname'] == $item) {
											$tt_ += $v_["t_num"];
											$mm_ += $v_["m_num"];
										}
									}
								}
								$total_t += $tt;
								$total_m += $mm;
								//后段
								$total_t_ += $tt_;
								$total_m_ += $mm_;
								array_push($_i_data,$_item.'： <var> ',$tt);
								array_push($_i_data,' </var> 张，共计： ',number_format($mm,2,'.',''));
								//后段
								array_push($_i_data_,$_item.'：<var> ',$tt_);
								array_push($_i_data_,' </var> 张，共计： ',number_format($mm_,2,'.',''));
							}
							array_push($words_data,$_i_data);
							array_push($words_data_,$_i_data_);
						}
						//保险票
						$sql_3 = "  CALL  TBTJ_BX('{$_Search_start}','{$_Search_end}','{$_Search_start_next}','{$_Search_end_next}') ";
						$Model_3 = M(""); // 实例化一个model对象 没有对应任何数据表
						$cache_bx = $_Search_flag.'_words_bx_'.$_Search_start.'T'.$_Search_end.'Cp'.$_Search_start_next.'T'.$_Search_end_next;
                        //
                        $array_BX = $Model_3->query($sql_3);
//						if(!S($cache_bx)){
//							$array_BX = $Model_3->query($sql_3);
//							S($cache_bx,$array_BX,7200,'File');
//						}else
//						{
//							$array_BX = S($cache_bx);
//						}
						//
						$total_i = 0;
						$total_i_ =0;
						foreach($array_BX as $item)
						{
							if($item["flag"] == "Now")
							{
								$total_i = $item["i_num"];
							}else{
								$total_i_ = $item["i_num"];
							}
						}
						//总计数据：
						$total_data = array();
						$total_data_ = array();
						$total_m = number_format($total_m,2,".",""); 
						$total_m_ = number_format($total_m_,2,".",""); 
						array_push($total_data,array(
							'etotal_t' => $total_t,//电子票数
							'etotal_m' => $total_m,//电子票金额
							'total_i' => $total_i,//保险
							'total_ck_m' => $CK_WTotal,// 窗口总计数据 金额
							'total_ck_t' => $CK_WTicket //窗口票数
						));
						//
						array_push($total_data_,array(
							'etotal_t' => $total_t_,//电子票数
							'etotal_m' => $total_m_,//电子票金额
							'total_i' => $total_i_,//保险
							'total_ck_m' => $CK_WTotal_,// 窗口总计数据 金额
							'total_ck_t' => $CK_WTicket_ //窗口票数
						));
						//
						$iresult = array(
							'state' => $state,
							'TB_Data' =>$TB_Data,//
							'words_data' =>$words_data,
							'words_data_' =>$words_data_,
							'total_data' =>$total_data,
							'total_data_' =>$total_data_
						);
						S($cache_words_,$iresult,7200,'File');
					}else{
						$iresult = S($cache_words_);
					}
		}
		
		$this->ajaxReturn($iresult);//返回操作结果
	}
}

