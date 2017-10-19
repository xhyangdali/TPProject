<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统地区
 */
class ProvinceCityAreaController extends AdminBaseController{
	/**
	 * 地区列表
	 */
	public function index($p = 1,$keywords = '' ,$Province = '' ,$City = '',$County= ''){
		//访问日志
		$ip = get_client_ip(); 
		$log = D("Log"); 
		$log->addLog('ACSESS','ProvinceCityArea',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//列表
		$Area = D("ProvinceCityArea");
		$province = $Area->where("pid = 0 ")->select();
		//查询
		$condition=array();
		if($keywords != ''){
			$condition["name"] =array('like','%'.$keywords.'%');
		}
		//
		if($Province != ''){
			$condition["pid"] =array('like','%'.$Province.'%');
		}
		//
		if($City != ''){
			$condition["pid"] =array('like','%'.$City.'%');
		}
		//
		if($County != ''){
			$condition["pid"] =array('like','%'.$County.'%');
		}
		$totalRows = $Area->where($condition)->order('id asc')->count();
		$totalPages = 1;
		$listRows = 20;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$areas=$Area->where($condition)->order('id asc')->page($p,$listRows)->select(); 
			
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$assign=array(
			'data' => $areas,
			'pagehtml' => $pagehtml,
			'province' => $province
			);
		$this->assign($assign);
		$this->display();
	}
	
	//依据父级id获得子节点信息
	public function GetAreaChildItems($pid=0 )
	{
		$Area = D("ProvinceCityArea");
		$condition=array();
		if(!empty($pid))
		{
			$condition["pid"] = $pid;
		}else
		{
			$condition["pid"] = $pid;
		}
		$list = $Area->where($condition)->select();
		$this->ajaxReturn($list);
	}
}
