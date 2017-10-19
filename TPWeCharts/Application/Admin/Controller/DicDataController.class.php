<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;
/**
 * 后台模块,字典管理
 */
class DicDataController extends AdminBaseController{
	/**
	 * 字典列表 
	 */
	public function index($p=1){
		// 
		$dic = D('DicData'); 
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
		$log->addLog('ACSESS','DicData',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
		$this->assign($assign);
		$this->display();
	}

	/**
	 * 添加
	 */
	public function add(){
		$data=I('post.');
		unset($data['id']);
		$result=D('DicData')->addData($data);
		if ($result) {
			$this->success('添加成功');//,U('Admin/DicData/index')
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
		$result=D('DicData')->editData($map,$data);
		if ($result) {
			$this->success('修改成功');//,U('Admin/DicData/index')
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
		$result=D('DicData')->deleteData($map);
		if($result){
			$this->success('删除成功');//,U('Admin/DicData/index')
		}else{
			$this->error('请先删除子菜单');
		}
	}

	/**
	 * 排序
	 */
	public function order(){
		$data=I('post.');
		$result=D('DicData')->orderData($data);
		if ($result) {
			$this->success('排序成功');//,U('Admin/DicData/index')
		}else{
			$this->error('排序失败');
		}
	}
	/**
	 * 依据Code获得字典选项
	 *key 字典编码
	 */
	public function GetDicJsonData($key =''){
		$dic = D('DicData');
		$pid = '0';
		$condition = array();
		$id = 0;
		if($key == '')
		{
			$condition['pid'] = $pid;
			$result = $dic->where($condition)->order('sortnum desc')->select();
		}else
		{
			$condition['dickey'] = $key;
			$condition['pid'] = $pid;
			$id = $dic->field('id')->where($condition)->select(); 
			$arr['pid']  = $id[0]['id'];
			$result = $dic->where($arr)->order('sortnum asc')->select();
		}
		$this->ajaxReturn($result);
	}
}
