<?php


namespace mailer\tp32;

use Think\Think;

/**
 * Class Mailer
 * @package mailer\tp32
 */
class Mailer extends \mailer\lib\Mailer
{
    /**
     * 载入一个模板作为邮件内容
     *
     * @param string $template
     * @param array  $param
     * @param array  $config
     *
     * @return Mailer
     */
    public function view($template, $param = [], $config = [])
    {
        $view = Think::instance('Think\View');
        if ($param) {
            foreach ($param as $key => $value) {
                // 处理变量中包含有对元数据嵌入的变量
                $this->embedImage($key, $value, $param);
                $view->assign($key, $value);
            }
        }
        $content = $view->fetch($template);

        return $this->html($content);
    }
}
