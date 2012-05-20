/**
 * スーパークラス
 */
var Tcliper = function(){
	this.init.apply(this);
};

Tcliper.prototype = {
	//コンストラクタ
	init: function(){

	},

	//XMLHttpRequest
	xhr: function(url, param, opt, callback){
		var self = this;
		//Ajax開始
		$.ajax({
			type: opt.type,
			dataType: opt.dataType,
			data: param,
			cache: true,
			url: url,
			success: function(response){
				self.response = response;
				eval("self." + callback + "();");
			},
			error: function(){
				alert("xhr error!");
			}
		});
	}
};

/**
 * 継承用関数
 */
function extend(super, sub){
    for (var prop in sub.prototype) {
        if (typeof(super.prototype[prop]) == "undefined") {
            super.prototype[prop] = sub.prototype[prop];
        }
    }
}
