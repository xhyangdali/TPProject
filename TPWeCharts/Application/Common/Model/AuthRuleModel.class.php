<?php
namespace Common\Model;
use Common\Model\BaseModel;
/**
 * 权限规则model
 */
class AuthRuleModel extends BaseModel{

	/**
	 * 删除数据
	 * @param	array	$map	where语句数组形式
	 * @return	boolean			操作是否成功
	 */
	public function deleteData($map){
		$ip = get_client_ip();
		$log = D("Log");
		$group_map = $this->where(array('pid'=>$map['id']))->select();
		$count=$this
			->where(array('pid'=>$map['id']))
			->count();
		if($count!=0){
			//写日志
			$log->addLog('DELETE','AuthRule',json_encode(array('Result::' => false,'Data::'=>$group_map,'IP::'=>$ip,'Config::'=>$map)),'');
			return false;
		}
		$result=$this->where($map)->delete();
		//写日志
		$log->addLog('DELETE','AuthRule',json_encode(array('Result::' => $result,'Data::'=>$group_map,'IP::'=>$ip,'Config::'=>$map)),'');
		return $result;
	}
	/**
     * 获取全部数据
     * @param  string $type  tree获取树形结构 level获取层级结构
     * @param  string $order 排序方式  
	 * @param  string $name  显示处理字段 
	 * @param  string $child  子节点 
	 * @param  string $parent  父节点 
     * @return array         结构数据
     */
    public function getTreeData($type='tree',$order='',$name='name',$child='id',$parent='pid',$p=1,$listRows=4,$flag=0){
        	if($flag ==1)
			{
				$condition = array();
				$condition["pid"] = "0";
				if(empty($order)){
					$idata=$this->where($condition)->page($p,$listRows)->select();
				}else{
					$idata=$this->where($condition)->order($order.' is null,'.$order)->page($p,$listRows)->select();
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
						$str .= $this->GetChild($item['id'],$order);
					}else
					{
						$str = $str.','.$item['id'];
						$str .= $this->GetChild($item['id'],$order);
					}
					$i++;
				}
				$cond['id'] = array('in',$str);
				//$cond['_logic'] = 'OR';
				//$cond['pid'] = array('in',$str);
				// 判断是否需要排序
				if(empty($order)){
					$data=$this->where($cond)->select();
				}else{
					$data=$this->where($cond)->order($order.' is null,'.$order)->select();
				}
			}else
			{
				// 判断是否需要排序
				if(empty($order)){
					$data=$this->select();
				}else{
					$data=$this->order($order.' is null,'.$order)->select();
				}
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
	 * 获取权限子节点
	 * @param  string $id $order  节点编码 排序键
	 * @return array       	数据
	 */
	private function GetChild($id,$order)
	{
		$condition = array();
		if($id <=0 )
		{
			return "";
		}
		$condition["pid"] = $id;
		if(empty($order)){
			$idata=$this->where($condition)->select();
			$icount = $this->where($condition)->count();
		}else{
			$idata = $this->where($condition)->order($order.' is null,'.$order)->select();
			$icount = $this->where($condition)->order($order.' is null,'.$order)->select();
		}
		$str = ",";
		$i =0;
		if($icount > 0)
		{
			foreach($idata as &$item)
			{
				if($i == 0)
				{
					if($item['pid'] != "0"){
						$str = $str.$item['id'];
						$str .= $this->GetChild($item['id'],$order);
					}
				}else
				{
					if($item['pid'] != "0"){
						$str = $str.','.$item['id'];
						$str .= $this->GetChild($item['id'],$order);
					}
				}
				$i++;
			}
		}
		return $str;		
	}
	/**
	 * 获取权限数目
	 * @param  string $type  tree获取树形结构 level获取层级结构
     * @param  string $order 排序方式  
	 * @param  string $name  显示处理字段 
	 * @param  string $child  子节点 
	 * @param  string $parent  父节点 构
	 * @return array       	条目
	 */
	public function getTreeDataCount($type='tree',$order='',$name='name',$child='id',$parent='pid'){
		// 判断是否需要排序
		$condition = array();
		$condition["pid"] = "0";
		if(empty($order)){
			$data=$this->where($condition)->count();
		}else{
			$data=$this->where($condition)->order($order.' is null,'.$order)->count();
		}
		
		return $data;
	}
	
}
