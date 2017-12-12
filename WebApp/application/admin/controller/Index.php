<?php

//------------------------
// 管理后台首页
//-------------------------

namespace app\admin\controller;

use app\admin\Controller;
use think\Loader;
use think\Session;
use think\Db;

class Index extends Controller
{

    public function index()
    {
        // 读取数据库模块列表生成菜单项
        $nodes = Loader::model('AdminNode', 'logic')->getMenu();

        // 节点转为树
        $tree_node = list_to_tree($nodes);

        // 显示菜单项
        $menu = [];
        $groups_id = [];
        foreach ($tree_node as $module) {
            if ($module['pid'] == 0 && strtoupper($module['name']) == strtoupper($this->request->module())) {
                if (isset($module['_child'])) {
                    foreach ($module['_child'] as $controller) {
                        $group_id = $controller['group_id'];
                        array_push($groups_id, $group_id);
                        $menu[$group_id][] = $controller;
                    }
                }
            }
        }

        // 获取授权节点分组信息
        $groups_id = array_unique($groups_id);
        if (!$groups_id) {
            //exception("没有权限");
        }
        $groups = Db::name("AdminGroup")->where(['id' => ['in', $groups_id], 'status' => "1"])->order("sort asc,id asc")->field('id,name,icon')->select();

        $this->view->assign('groups', $groups);
        $this->view->assign('menu', $menu);

        return $this->view->fetch();
    }

    /**
     * 欢迎页
     * @return mixed
     */
    public function welcome()
    {
        // 查询 ip 地址和登录地点
        if (Session::get('last_login_time')) {
            $last_login_ip = Session::get('last_login_ip');
            $last_login_loc = \Ip::find($last_login_ip);

            $this->view->assign("last_login_ip", $last_login_ip);
            $this->view->assign("last_login_loc", implode(" ", $last_login_loc));
        }
        $current_login_ip = $this->request->ip();
        $current_login_loc = \Ip::find($current_login_ip);
        $diskfree = intval(diskfreespace( "." )/(1024 * 1024 * 1024 ) ).'GB';
        $server_ip = gethostbyname($_SERVER ["SERVER_NAME"]);
        $port = $_SERVER["SERVER_PORT"];
        $PC_Name = $_SERVER['SERVER_NAME'];//服务器用户名
        $software = $_SERVER["SERVER_SOFTWARE"];
        $serverinfo =  php_uname();
        $time_l = get_cfg_var("max_execution_time")."秒 ";
        $max_mem = get_cfg_var ("memory_limit")?get_cfg_var("memory_limit"):"无";
        $lang = $_SERVER['HTTP_ACCEPT_LANGUAGE'];//服务器语言
        $bj_time = gmdate("Y-m-d H:i:s",time() + 8 * 3600);
        //
        $this->view->assign("bj_time", $bj_time);
        $this->view->assign("lang", $lang);
        $this->view->assign("time_l", $time_l);
        $this->view->assign("max_mem", $max_mem);
        $this->view->assign("serverinfo", $serverinfo);
        $this->view->assign("software", $software);
        $this->view->assign("PC_Name", $PC_Name);
        $this->view->assign("port", $port);
        $this->view->assign("server_ip", $server_ip);
        $this->view->assign("diskfree", $diskfree);
        $this->view->assign("current_login_ip", $current_login_ip);
        $this->view->assign("current_login_loc", implode(" ", $current_login_loc));

        // 查询个人信息
        $info = Db::name("AdminUser")->where("id", UID)->find();
        $this->view->assign("info", $info);

        return $this->view->fetch();
    }
}