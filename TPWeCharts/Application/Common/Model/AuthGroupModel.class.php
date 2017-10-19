<?php
namespace Common\Model;
use Common\Model\BaseModel;
/**
 * 权限规则model
 */
class AuthGroupModel extends BaseModel{

	/**
	 * 传递主键id删除数据
	 * @param  array   $map  主键id
	 * @return boolean       操作是否成功
	 */
	public function deleteData($map){
		$ip = get_client_ip();
		$log = D("Log");
		$data = $this->where($map)->select();
		$isok = $this->where($map)->delete();
		$group_map=array(
			'group_id'=>$map['id']
			);
		// 删除关联表中的组数据
		$list = D('AuthGroupAccess')->where($group_map)->select();
		$result = D('AuthGroupAccess')->deleteData($group_map);
		//写日志
		$log->addLog('DELETE','AuthGroup',json_encode(array('Result::' => $isok,'Data::'=>$data,'IP::'=>$ip,'Config::'=>$map)),'');
		$log->addLog('DELETE','AuthGroupAccess',json_encode(array('Result::' => $result,'Data::'=>$list,'IP::'=>$ip,'Config::'=>$group_map)),'');
		return $result;
	}



}
