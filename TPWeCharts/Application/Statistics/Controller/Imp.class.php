<?php

/*
 * 框架系统 Thinkphp 5
 * 程序制作 冯晋
 * 联系邮箱 feng9732@qq.com
 * 程序更新时间 2017-1-13
 * IMP相关接口数据获取
 */

namespace Statistics\Controller;
use Common\Controller\StatisticsBaseController;
use Think\Controller;
use Think\Model;
use think\Session;

/**
 * 微信公众号，用户信息获取
 */
class Imp extends StatisticsBaseController{

    //获取SESSIONKEY的方法
    public function sessionkey() {
        //获取sessionkey
        //相关参数设置
        $appId = 'E8668A1E46A1406790F4FE2CBA2A1034';
        $nonce = '2112328';
        $time = time();
        $signature = 'E097EA8061F143F4B4DCD1CF5FCB5758';
        //获取sessionkey
        $redirect = 'http://openapi.dlkcp.com/39D8B5EA-73E4-4906-A70E-3579B3F86BCD/api/Auth?appId=' . $appId . '&nonce=' . $nonce . '&timeStamp=' . $time . '&signature=' . $signature . '';
        $info = file_get_contents($redirect, true);
        //解析JSON数据,并且转换为数组
        $a = (Array) json_decode($info);
        //（2）赋值sessionkey
        $sessionkey = $a['SessionKey'];
        return $sessionkey;
    }

    //获取accesskey的方法
    public function accesskey() {
        //获取acc
        //跳转。相关页面获取
        //读取配置WEBURL
        $weburl = C('WEIXINDOMAIN');
        $redirect = $weburl.'Statistics/Index/Index';//
        $redirect_url = urlencode($redirect);
        //传递的完整地址
        $url = 'http://imp.dlkcp.com/UserCenter/WechatAuth?ret='. $redirect_url. '';
        //跳转
        header("Location:{$url}");
        //$this->redirect($url);
    }

    //获取信息，获取USERID,用户具体信息
    public function useruid() {
        //获取accesskey
        //$accesskey = \think\Request::instance()->get('accesskey');
        $accesskey = $_GET['accesskey'];
        //获取sessionkey
        $sessionkey = $this->sessionkey();
        //accesskey为空才执行
        if (empty($accesskey)) {
            $accesskey = $this->accesskey();
        }
        //判断acckey是否合法
        $numkey = strlen($accesskey);
        if ($numkey == 32) {
            //正常，获取UID
            $url = 'http://imp.dlkcp.com/API/UserCenter/AuthResult?accesskey=' . $accesskey . '';
            //执行页面
            $useruid = file_get_contents($url, true);
            //解析JSON数据,并且转换为数组
            $a = (Array) json_decode($useruid);
            //相关参数
            $openid = $a['OpenId'];
            $uid = $a['UserUid'];
            //获取用户具体信息，并且新增或更新用户数据信息
            //提交到openapi，QueryString
            $url = 'http://openapi.dlkcp.com/39D8B5EA-73E4-4906-A70E-3579B3F86BCD/api/User/' . $uid . '?IMP_Akey=' . $sessionkey . '';
            //初始化curl
            $ainfo = file_get_contents($url, true);
            $arrayinfo = (Array) json_decode($ainfo);
            //相关参数赋值，写入数据库
            $data['useruid'] = $arrayinfo['UserUid'];
            $data['nickname'] = base64_encode($arrayinfo['NickName']); //处理昵称编码问题
            $data['mobilephone'] = $arrayinfo['MobilePhone'];
            $data['avatarurl'] = $arrayinfo['AvatarUrl'];
            $data['APoint'] = $arrayinfo['APoint'];
            $data['CPoint'] = $arrayinfo['CPoint'];
            $data['EPoint'] = $arrayinfo['EPoint'];
            $data['Type'] = $arrayinfo['Type'];
            $data['description'] = "来自公众平台";
            $data['TimeCreated'] = $arrayinfo['TimeCreated'];
            $now_time = date("Y-m-d H:i:s");
            $data['createdate'] = $now_time;
            $data['createuserid'] = $openid;//
            $data['iseffective'] = 1;//禁止状态
            $data['isdel'] = 0;//删除标记
            //将获取到的USER信息写入到数据库
            $list = D("WhiteList");
            $condition = array(
                "useruid" => $uid,
                "isdel" => 0,
                "iseffective" => 0
            );
            $clist = $list->where($condition)->select();
            //
            $access = $clist?"0":"1";
            $ip = get_client_ip();
            $log = D("Log");
            //把UID存入到session里面使用
            $session_data=array(
                'id'=>$arrayinfo['UserUid'],//用户信息
                'name'=>$arrayinfo['NickName'],//模块管理
                'access' => $access
            );
            $_SESSION['user_'] = $session_data;
            if($clist)
            {
                //已经激活，可以访问
                //访问日志
                $savedb = $list->where('UserUid', $uid)->ieditData($data);
                $log->addLog('ACSESS','ContrastIndex',json_encode(array('Result::' => true,'Data::'=>$clist,'IP::'=>$ip)),'');
            }else{
                //未添加
                $condition_ = array(
                    "useruid" => $data['useruid'],
                    "isdel" => 0
                );
                $count_ = $list->where($condition_)->select();
                //\think\Log::record('获取用户accesskey时accesskey长度不对',$count_);
                if(!$count_)
                {
                    //新增访问用户到用户列表
                    unset($data['id']);
                    $result = $list->add($data);
                    $log->addLog('ADD','ContrastIndex',json_encode(array('Result::' => $result,'Data::'=>$data,'IP::'=>$ip)),'');
                }else{
                    //更新用户信息
                    $savedb = $list->where('UserUid', $uid)->ieditData($data);
                }
                if($access != "0") {
                    $this->error('对不起，您没有访问权限!');
                }
            }
        } else {
            $this->error('非法登录!');
            \think\Log::record('获取用户accesskey时accesskey长度不对', 'error');
        }
    }

}