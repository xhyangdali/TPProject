<?php


namespace mailer\lib\log;

use mailer\lib\Config;

class File
{
    const DEBUG = 'debug';
    const INFO = 'info';

    /**
     * 写入日志
     *
     * @param $content
     * @param string $level
     */
    public static function write($content, $level = self::DEBUG)
    {
        $now = date(' c ');
        $path = Config::get('log_path', __DIR__ . '/../../../../log');
        $destination = $path . '/mailer-' . date('Y-m-d') . '.log';
        // 自动创建日志目录
        if (!is_dir($path)) {
            mkdir($path, 0777, true);
        }
        $content = '[ ' . $level . ' ] ' . $content;
        error_log("[{$now}] " . $_SERVER['REMOTE_ADDR'] . ' ' . $_SERVER['REQUEST_URI'] . "\r\n{$content}\r\n", 3, $destination);
    }
}
