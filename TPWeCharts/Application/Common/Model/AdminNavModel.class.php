<?php
namespace Common\Model;
use Common\Model\BaseModel;
/**
 * 菜单操作model 
 */
class AdminNavModel extends BaseModel{

	/**
	 * 删除数据
	 * @param	array	$map where语句数组形式
	 * @return	boolean	操作是否成功
	 */
	public function deleteData($map){
		$ip = get_client_ip();
		$log = D("Log");
		$emsg = "删除失败！";
		//
		$count=$this
			->where(array('pid'=>$map['id']))
			->count();
		//要删除的数据
		$data = $this
			->where(array('pid'=>$map['id']))
			->select();
		if($count!=0){
			$log->addLog('DELETE','AdminNav',json_encode(array('ERROR::' => $emsg,'Data::'=>$data,'IP::'=>$ip,'Config::'=>$map)),'');
			return false;
		}
		$log->addLog('DELETE','AdminNav',json_encode($data),'');
		$this->where(array($map))->delete();
		return true;
	}

	/**
	 * 获取全部菜单
	 * @param  string $type tree获取树形结构 level获取层级结构
	 * @param  string $order 排序参数
	 * @param  int 页数$p 每页记录数$listRows 分页参数
	 * @param  int 页数$flag 是否分页控制符
	 * @return array       	结构数据
	 */
	public function getTreeData($type='tree',$order='',$p=1,$listRows=4,$flag=0){
		//
		if($flag == 1)
		{
			$condition = array();
			$condition["pid"] = "0";
			if(empty($order)){
				$idata=$this->where($condition)->page($p,$listRows)->select();
			}else{
				$idata=$this->where($condition)->order('order_number is null,'.$order)->page($p,$listRows)->select();
			}
			//查询符合条件的模块
			$cond = array();
			$str = "";
			$i =0;
			foreach($idata as &$item)
			{
				if($i == 0)
				{
					$str = $str.$item['id'];
				}else
				{
					$str = $str.','.$item['id'];
				}
				$i++;
			}
			$cond['id'] = array('in',$str);
			$cond['_logic'] = 'OR';
			$cond['pid'] = array('in',$str);
			// 判断是否需要排序
			if(empty($order)){
				$data=$this->where($cond)->select();
			}else{
				$data=$this->where($cond)->order('order_number is null,'.$order)->select();
			}
		}else
		{
			// 判断是否需要排序
			if(empty($order)){
				$data=$this->select();
			}else{
				$data=$this->order('order_number is null,'.$order)->select();
			}
		}
		// 获取树形或者结构数据
		if($type=='tree'){
			$data=\Org\Nx\Data::tree($data,'name','id','pid');
		}elseif($type="level"){
			$data=\Org\Nx\Data::channelLevel($data,0,'&nbsp;','id');
			// 显示有权限的菜单
			$auth=new \Think\Auth();
			foreach ($data as $k => $v) {
				if ($auth->check($v['mca'],$_SESSION['user']['id'])) {
					foreach ($v['_data'] as $m => $n) {
						if(!$auth->check($n['mca'],$_SESSION['user']['id'])){
							unset($data[$k]['_data'][$m]);
						}
					}
				}else{
					// 删除无权限的菜单
					unset($data[$k]);
				}
			}
		}
		// p($data);die;
		return $data;
	}

	/**
	 * 获取全部菜单数目
	 * @param  string $type tree获取树形结构 level获取层级结构
	 * @return array       	结构数据
	 */
	public function getTreeDataCount($type='tree',$order=''){
		// 判断是否需要排序
		$condition = array();
		$condition["pid"] = "0";
		if(empty($order)){
			$data=$this->where($condition)->count();
		}else{
			$data=$this->where($condition)->order('order_number is null,'.$order)->count();
		}
		
		return $data;
	}
}
