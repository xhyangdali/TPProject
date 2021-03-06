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
        $weburl = $_SERVER["REQUEST_SCHEME"].'://'.$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
        $redirect = $weburl;// . '/index/imp/useruid';
        $redirect_url = urlencode($redirect);
        //传递的完整地址
        $url = 'http://imp.dlkcp.com/UserCenter/WechatAuth?ret=' . $redirect_url . '';
        //跳转
        $this->redirect($url);
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
            $data['UserUid'] = $arrayinfo['UserUid'];
            $data['NickName'] = base64_encode($arrayinfo['NickName']); //处理昵称编码问题
            $data['MobilePhone'] = $arrayinfo['MobilePhone'];
            $data['AvatarUrl'] = $arrayinfo['AvatarUrl'];
            $data['APoint'] = $arrayinfo['APoint'];
            $data['CPoint'] = $arrayinfo['CPoint'];
            $data['EPoint'] = $arrayinfo['EPoint'];
            $data['Type'] = $arrayinfo['Type'];
            $data['TimeCreated'] = $arrayinfo['TimeCreated'];
            //将获取到的USER信息写入到数据库
            $userdb = \think\Db::name('oauthuser')->where('UserUid', $uid)->find();
            //判断是新增还是更新(新用户老用户)
            if (empty($userdb)) {
                //新增用户
                $adddb = \think\Db::name('oauthuser')->insert($data);
                if ($adddb != '1') {
                    \think\Log::record('IMP用户信息数据库新增失败', 'error');
                }
            } else {
                //更新用户信息
                $savedb = \think\Db::name('oauthuser')->where('UserUid', $uid)->update($data);
            }
            //把UID存入到session里面使用
            $session = Session::set('useruid', $arrayinfo['UserUid']);
            $indexurl = Session::get('indexurl');
            $this->redirect($indexurl);
        } else {
            $this->error('非法登录!');
            \think\Log::record('获取用户accesskey时accesskey长度不对', 'error');
        }
    }

}