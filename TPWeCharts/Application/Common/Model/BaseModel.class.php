<?php
namespace Common\Model;
use Think\Model;
/**
 * 基础model
 */
class BaseModel extends Model{

    /**
     * 添加数据
     * @param  array $data  添加的数据
     * @return int          新增的数据id
     */
    public function addData($data){
        // 去除键值首尾的空格
        foreach ($data as $k => $v) {
            $data[$k]=trim($v);
        }
		//写操作日志
		$ip = get_client_ip();
		$log = D("Log");
        $id=$this->add($data);
		$log->addLog('ADD',$this->name,json_encode(array('Result::' => $id,'Data::'=>$data,'IP::'=>$ip)),'');
        return $id;
    }

    /**
     * 添加数据
     * @param  array $data  添加的数据
     * @return int          新增的数据id
     */
    public function iaddData($data){
        // 去除键值首尾的空格
        foreach ($data as $k => $v) {
            $data[$k]=trim($v);
        }
        //添加人，日期处理
        $data["isdel"] = 0;//删除标记
        $data["createuserid"] = $_SESSION['user']['id'];
        $data["createdate"] = gmdate("Y-m-d H:i:s",time() + 8 * 3600);
        //写操作日志
        $ip = get_client_ip();
        $log = D("Log");
        $id=$this->add($data);
        $log->addLog('ADD',$this->name,json_encode(array('Result::' => $id,'Data::'=>$data,'IP::'=>$ip)),'');
        return $id;
    }

    /**
     * 修改数据
     * @param   array   $map    where语句数组形式
     * @param   array   $data   数据
     * @return  boolean         操作是否成功
     */
    public function editData($map,$data){
        // 去除键值首位空格
        foreach ($data as $k => $v) {
            $data[$k]=trim($v);
        }
		//写操作日志
		$ip = get_client_ip();
		$log = D("Log");
		$old = $this->where($map)->select();
        $result=$this->where($map)->save($data);
		$log->addLog('MODIFY',$this->name,json_encode(array('Result::' => $result,'Data::'=>$data,'IP::'=>$ip)),json_encode($old));
        return $result;
    }
    /**
     * 修改数据
     * @param   array   $map    where语句数组形式
     * @param   array   $data   数据
     * @return  boolean         操作是否成功
     */
    public function ieditData($map,$data){
        // 去除键值首位空格
        foreach ($data as $k => $v) {
            $data[$k]=trim($v);
        }
        //修改人
        $data["updateuserid"] = $_SESSION['user']['id'];
        $data["updatedate"] = gmdate("Y-m-d H:i:s",time() + 8 * 3600);
        //写操作日志
        $ip = get_client_ip();
        $log = D("Log");
        $old = $this->where($map)->select();
        $result=$this->where($map)->save($data);
        $log->addLog('MODIFY',$this->name,json_encode(array('Result::' => $result,'Data::'=>$data,'IP::'=>$ip)),json_encode($old));
        return $result;
    }
    /**
     * 删除数据(假删除)
     * @param   array   $map    where语句数组形式
     * @return  boolean         操作是否成功
     */
    public function ideleteData($map){
        if (empty($map)) {
            die('where为空的危险操作');
        }

        $data = $this->where($map)->select();
        //删除人信息
        $data["isdel"] = 1;//删除标记
        $data["deluserid"] = $_SESSION['user']['id'];
        $data["deldate"] = gmdate("Y-m-d H:i:s",time() + 8 * 3600);
        //
        $result=$this->where($map)->save($data);
        //$result=$this->where($map)->delete();
        //写操作日志
        $ip = get_client_ip();
        $log = D("Log");
        $log->addLog('DELETE',$this->name,json_encode(array('Result::' => $result,'Data::'=>$data,'IP::'=>$ip)),'');
        return $result;
    }
    /**
     * 删除数据
     * @param   array   $map    where语句数组形式
     * @return  boolean         操作是否成功
     */
    public function deleteData($map){
        if (empty($map)) {
            die('where为空的危险操作');
        }
		//
		$data = $this->where($map)->select();
		//写操作日志
		$ip = get_client_ip();
		$log = D("Log");
        $result=$this->where($map)->delete();
		$log->addLog('DELETE',$this->name,json_encode(array('Result::' => $result,'Data::'=>$data,'IP::'=>$ip)),'');
        return $result;
    }

    /**
     * 数据排序
     * @param  array $data   数据源
     * @param  string $id    主键
     * @param  string $order 排序字段   
     * @return boolean       操作是否成功
     */
    public function orderData($data,$id='id',$order='order_number'){
        foreach ($data as $k => $v) {
            $v=empty($v) ? null : $v;
            $this->where(array($id=>$k))->save(array($order=>$v));
        }
        return true;
    }

    /**
     * 获取全部数据
     * @param  string $type  tree获取树形结构 level获取层级结构
     * @param  string $order 排序方式   
     * @return array         结构数据
     */
    public function getTreeData($type='tree',$order='',$name='name',$child='id',$parent='pid'){
        // 判断是否需要排序
        if(empty($order)){
            $data=$this->select();
        }else{
            $data=$this->order($order.' is null,'.$order)->select();
        }
        // 获取树形或者结构数据
        if($type=='tree'){
            $data=\Org\Nx\Data::tree($data,$name,$child,$parent);
        }elseif($type="level"){
            $data=\Org\Nx\Data::channelLevel($data,0,'&nbsp;',$child);
        }
        return $data;
    }

    /**
     * 获取分页数据
     * @param  subject  $model  model对象
     * @param  array    $map    where条件
     * @param  string   $order  排序规则
     * @param  integer  $limit  每页数量
     * @param  integer  $field  $field
     * @return array            分页数据
     */
    public function getPage($model,$map,$order='',$limit=10,$field=''){
        $count=$model
            ->where($map)
            ->count();
        $page=new_page($count,$limit);
        // 获取分页数据
        if (empty($field)) {
            $list=$model
                ->where($map)
                ->order($order)
                ->limit($page->firstRow.','.$page->listRows)
                ->select();         
        }else{
            $list=$model
                ->field($field)
                ->where($map)
                ->order($order)
                ->limit($page->firstRow.','.$page->listRows)
                ->select();         
        }
        $data=array(
            'data'=>$list,
            'page'=>$page->show()
            );
        return $data;
    }





}
