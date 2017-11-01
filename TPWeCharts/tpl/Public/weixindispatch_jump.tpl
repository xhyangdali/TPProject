<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>页面正在跳转</title>
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <link rel="stylesheet" href="__PUBLIC_CSS__/weui.css">
    <link rel="stylesheet" href="__PUBLIC_CSS__/jquery-weui.css">
    <link rel="stylesheet" href="__PUBLIC_CSS__/style.css">
</head>
<body>
<div class="weui-msg" style="display: none;">
    <div class="weui-msg__icon-area"><i class="weui-icon-warn weui-icon_msg"></i></div>
    <div class="weui-msg__text-area">
        <h2 class="weui-msg__title">{$message}{$error}</h2>
        <p class="weui-msg__desc"></p>
        <p class="weui-msg__title">页面将在<b id="wait">2</b>秒后<a id="href" href="#">关闭微信浏览器</a></p>
        <p class="weui-msg__desc">如需提前退出，请点击确定。</p>
    </div>
    <div class="weui-msg__opr-area">
        <p class="weui-btn-area">
            <a id="ok" href="javascript:;" class="weui-btn weui-btn_primary">确定</a>
        </p>
    </div>
    <div class="weui-msg__extra-area">
        <!-- footer copyright start -->
        <div class="weui-footer">
            <p class="weui-footer__links">
                <a href="javascript:void(0);" class="weui-footer__link">反馈</a>
                <a id="goToTop" href="javascript:void(0);" class="weui-footer__link">回顶部</a>
            </p>
            <p class="weui-footer__text">Copyright &copy; 2008-2016 大理交通运输集团</p>
        </div>
        <!-- footer copyright end -->
    </div>
</div>

<script src="__PUBLIC_JS__/jquery.min.js"></script>
<script src="__PUBLIC_JS__/jquery-weui.min.js"></script>
<script type="text/javascript">

    (function(){
        $("#ok").click(function(){
            WeixinJSBridge.call('closeWindow');
        });
        var wait = document.getElementById('wait'),href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                location.href = href;
                clearInterval(interval);
                WeixinJSBridge.call('closeWindow');
            };
        }, 1000);
    })();
</script>
</body>
</html>