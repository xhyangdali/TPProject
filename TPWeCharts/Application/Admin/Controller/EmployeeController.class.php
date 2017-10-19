<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;
/**
 * 后台模块,员工管理
 */
class EmployeeController extends AdminBaseController{
	/**
	 * 员工列表 
	 */
	public function index($p=1){
		// 
		$dic = D('Employee'); 
		$condition = array();
		if($_SESSION['user']['username'] != C('ADMIN_USER_NAME'))
		{//数据过滤（超级管理
			$condition['a.org_id'] = $_SESSION['user']['org_id'];
		} 
		$totalRows = $dic->alias('a')
		->where($condition)->order('sortnum desc')->count();
		$totalPages = 1;
		$listRows = 20;
		if($totalRows>$listRows)
		{
			$totalPages = $totalRows/$listRows;
		}
		$data=$dic->alias('a')
		->where($condition)
		->field('a.*,b.org_name,c.dept_name')
		->alias('a')->join(' LEFT JOIN orgnazation b ON b.id= a.org_id')
		->join(' LEFT JOIN department c ON c.id= a.dept_id')
		->order('org_id,dept_id,sortnum desc')->page($p,$listRows)->select();
		foreach ($data as &$dicx){
			$dicx['isuse'] = $dicx['isuse'];
			$dicx['org_name'] = $dicx['org_name'] ==""?"顶级机构":$dicx['org_name'];
			$dicx['dept_name'] = $dicx['dept_name'] ==""?"默认部门":$dicx['dept_name'];
			//$dicx['dept_name'] = $dicx['dept_name'] ==""?"默认部门":$dicx['dept_name'];
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
		$log->addLog('ACSESS','Employee',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		$this->assign($assign);
		$this->display();
	}

	/**
	 * 添加
	 */
	public function add(){
		$data=I('post.');
		unset($data['id']);
		$result=D('Employee')->addData($data);
		if ($result) {
			$this->success('添加成功');//,U('Admin/Employee/index')
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
		$result=D('Employee')->editData($map,$data);
		if ($result) {
			$this->success('修改成功');//,U('Admin/Employee/index')
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
		$result=D('Employee')->deleteData($map);
		if($result){
			$this->success('删除成功');//,U('Admin/Employee/index')
		}else{
			$this->error('请先删除子菜单');
		}
	}

	/**
	 * 排序
	 */
	public function order(){
		$data=I('post.');
		$result=D('Employee')->orderData($data);
		if ($result) {
			$this->success('排序成功');//,U('Admin/Position/index')
		}else{
			$this->error('排序失败');
		}
	}
}