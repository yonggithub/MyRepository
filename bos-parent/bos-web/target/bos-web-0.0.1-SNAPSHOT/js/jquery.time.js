(function($){
	$.fn.test1=function(){
		this.html("1999年");
	};
	$.fn.extend({
		runtime : function(){
			// 2016年11月01日 星期二 10:10:10
			/*创建日期对象*/
			var d = new Date;
			var arr = new Array();
			arr.push( d.getFullYear()+"年" );
			arr.push(d.getMonth()+1 + "月");
			arr.push($.calc(d.getDate())+ "日");
			arr.push("&nbsp;"+ $.weeks[d.getDay()] +"&nbsp")
			
			arr.push( $.calc(d.getHours()) + "时");
			arr.push( $.calc(d.getMinutes()) + "分");
			arr.push($.calc(d.getSeconds()) + "秒");
			
			
			this.html(arr);
			var obj = this;
			window.setTimeout(function(){
				obj.runtime();
			},1000)
			
		}
	});
	
	/** 为jQuery批量添加静态的方法 */
	$.extend({
		weeks : ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
		calc : function(num){
			return num <= 9 ? "0" + num : num;
		}
	});
})(jQuery);