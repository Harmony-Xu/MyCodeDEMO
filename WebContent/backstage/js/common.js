	$(function() {
		counttime();
	});	
	//倒计时
	function counttime(){ 		
  			var a=new Date(); 	
  			var b=["yyyy年","MM月","dd日","hh时","mm分","ss秒"]	
  			$("#gettime").html(a.Format(b[0])+a.Format(b[1])+a.Format(b[2])+a.Format(b[3])+a.Format(b[4])+a.Format(b[5]));
  			setTimeout(counttime, 1000);    
        } 
	  Date.prototype.Format = function (fmt) { //author: meizz
	    var o = {
	        "M+": this.getMonth() + 1, //月份
	        "d+": this.getDate(), //日
	        "h+": this.getHours(), //小时
	        "m+": this.getMinutes(), //分
	        "s+": this.getSeconds(), //秒
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
	        "S": this.getMilliseconds() //毫秒
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	
	window.onload=function(){ 
		counttime();
} 
	