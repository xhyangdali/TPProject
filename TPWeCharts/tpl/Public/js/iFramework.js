/*
*
*系统JS框架，包涵系统所需的函数方法
*
*/

/*
*依据参数名称获得url参数值
*/
function GetQueryString(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }else
	{    
		return "";
	}
}