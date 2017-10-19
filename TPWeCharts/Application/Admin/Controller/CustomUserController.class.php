<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;

/**
 * 后台系统会员管理
 */
class CustomUserController extends AdminBaseController{
	/**
	 * 会员列表
	 */
	public function index($p = 1,$keywords = '' ,$memberclass0 = '' ){
		//访问日志
		$ip = get_client_ip();
		$log = D("Log"); 
		$log->addLog('ACSESS','CustomUser',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		//列表
		$dic = D("DicData");
		$user = D("CustomUser");
		$m = $dic->field("id")->where(" pid=0 AND dickey='MemberClass' ")->select();
		foreach($m as &$item)
		{
			$pid = $item['id'];
		}
		$pc = array();
		$pc["pid"] = $pid;
		$class = $dic->where($pc)->select();
		
		//查询
		$condition=array();
		if($keywords != ''){
			$condition["name"] =array('like','%'.$keywords.'%');
			$condition['_logic'] = 'OR';
			$condition["phonenum"] =array('like','%'.$keywords.'%');

		}
		//
		if($memberclass0 != ''){
			$condition["memberclass"] =$memberclass0;
		}
		
		$totalRows = $user->where($condition)->order('id asc')->count();
		$totalPages = 1;
		$listRows = 20;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$users=$user->where($condition)->order('id asc')->page($p,$listRows)->select(); 	
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$assign=array(
			'data' => $users,
			'pagehtml' => $pagehtml,
			'class' => $class
			);
		$this->assign($assign);
		$this->display();
	}
	
	/**
	 * 添加
	 */
	public function add(){
		$data=I('post.');
		unset($data['id']);
		$result=D('CustomUser')->addData($data);
		if ($result) {
			$this->success('添加成功',U('Admin/CustomUser/index'));
		}else{
			$this->error('添加失败');
		}
	}

	/**
	 * 修改
	 */
	public function edit(){
		$data=I('post.');
		$map=array(
			'id'=>$data['id']
			);
		$result=D('CustomUser')->editData($map,$data);
		if ($result) {
			$this->success('修改成功',U('Admin/CustomUser/index'));
		}else{
			$this->error('修改失败');
		}
	}

	/**
	 * 删除
	 */
	public function delete(){
		$id=I('get.id');
		$map=array(
			'id'=>$id
			);
		$result=D('CustomUser')->deleteData($map);
		if($result){
			$this->success('删除成功',U('Admin/CustomUser/index'));
		}else{
			$this->error('删除失败');
		}
	}
	//依据父级id获得子节点信息
	public function GetdicItems($pid)
	{
		$dic = D("DicData");
		$m = $dic->field("id")->where(" pid=0 AND dickey='MemberClass' ")->select();
		foreach($m as &$item)
		{
			$pid = $item['id'];
		}
		$pc = array();
		$pc["pid"] = $pid;
		$class = $dic->where($pc)->select();
		$this->ajaxReturn($class);
	}
}
