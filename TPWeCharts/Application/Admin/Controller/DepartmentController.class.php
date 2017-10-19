<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;
/**
 * 后台模块,部门管理
 */
class DepartmentController extends AdminBaseController{
	/** 
	 * 部门列表 
	 */
	public function index($p=1){
		// 
		$dic = D('Department'); 
		$totalRows = $dic->getTreeDataCount("tree",'sortnum,id');
		$totalPages = 1;
		$listRows = 4;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$data=$dic->getTreeData('tree','sortnum,id',$p,$listRows);
		foreach ($data as &$dicx){
			$dicx['isuse'] = $dicx['isuse'];
			$dicx['org_name'] = $dicx['org_name'] ==""?"顶级机构":$dicx['org_name'];
			$dicx['isusename'] = $dicx['isuse']=="1"?"有效":"无效";
		}
		$page =new Think\Page();
		$page->firstRow = 1;//
		$page->listRows = $listRows;
		$page->totalRows = $totalRows;
		$page->totalPages = $totalPages;
		$page->rollPage = 5;
		$pagehtml = $page->show();
		$assign=array(
			'data'=>$data,
			'pagehtml' => $pagehtml 
			);
		//访问日志
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','Department',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		$this->assign($assign);
		$this->display();
	}

	/**
	 * 添加
	 */
	public function add(){
		$data=I('post.');
		unset($data['id']);
		$result=D('Department')->addData($data);
		if ($result) {
			$this->success('添加成功');//,U('Admin/Department/index')
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
		$result=D('Department')->editData($map,$data);
		if ($result) {
			$this->success('修改成功');//,U('Admin/Department/index')
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
		$result=D('Department')->deleteData($map);
		if($result){
			$this->success('删除成功');//,U('Admin/Department/index')
		}else{
			$this->error('请先删除子菜单');
		}
	}

	/**
	 * 排序
	 */
	public function order(){
		$data=I('post.');
		$result=D('Department')->orderData($data);
		if ($result) {
			$this->success('排序成功');//,U('Admin/Department/index')
		}else{
			$this->error('排序失败');
		}
	}
	/**
	 * 依据pid查询部门信息
	 */
	public function GetDeptJsonData($pid ='0',$org_id = '0'){
		$condition = array();
		
		if($org_id != '0')//机构+部门判断
		{
			$condition["org_id"] = $org_id;
		}else
		{
			if($pid == "all")
			{
			
			}else if($pid !=  '0')
			{
				$condition["pid"] = $pid;
				$condition['_logic'] = 'OR';
				$condition["id"] = $pid;
			}
			else{
				$condition["pid"] = $pid;
			}
		}
		$condition["isuse"] = 1;
		$result=D('Department')->where($condition)->order('sortnum asc')->select();
		$this->ajaxReturn($result);
	}
}
