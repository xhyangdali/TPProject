<?php
namespace Admin\Controller;
use Common\Controller\AdminBaseController;
use Think;
/**
 * 便签
 */
class PostsController extends AdminBaseController{
    /**
     * 便签列表
     */
    public function index($p = 1,$keywords = '' ,$start_date = '' ,$end_date = ''){
		//访问日志
		$ip = get_client_ip();
		$log = D("Log");
		$log->addLog('ACSESS','Articles',json_encode(array('Result::' => true,'Data::'=>'','IP::'=>$ip)),'');
        $notes = D("Notes");
        $condition=array();
        $condition["isdel"] = 0;
        $where = array();
        if($keywords != ''){
            $where["title"] =array('like','%'.$keywords.'%');
            $where['_logic'] = 'or';
            $where["description"] =array('like','%'.$keywords.'%');
            $condition["_complex"] = $where;
        }
        //
        if(!empty($start_date) &&  $start_date!=''){
            $condition["createdate"] =array('egt',$start_date);
        }
        if(!empty($end_date) &&  $end_date!=''){
            $condition["createdate"] =array('elt',$end_date);
        }
        //
        $totalRows = $notes->where($condition)->order('createdate desc')->count();
        $totalPages = 1;
        $listRows = C('PAGE_NUM');
        if($totalRows>$listRows)
        {
            $totalPages = $totalRows/$listRows;
        }
        $channels=$notes->where($condition)->order('createdate desc')->page($p,$listRows)->select();
        //
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
     * 便签信息信息添加
     */
    function adddata()
    {
        $data=I('post.');
        unset($data['id']);
        $result = D('Notes')->add($data);
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
        $this->ajaxReturn($iresult);//返回操作结果
    }
}