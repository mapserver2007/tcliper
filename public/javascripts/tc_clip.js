(function(){

	var Clip = function(){};

	Clip.prototype = {
		//コメントの編集画面を表示
		inline_edit: function(id){
			//フォームの開閉
			var elem_form = $("#clip_info_comment_edit_" + id);
			if(elem_form.css("display") == "none"){
				elem_form.css({"display": "block"});
			}
			else if(elem_form.css("display") == "block"){
				elem_form.css({"display": "none"});
			}
			//コメント領域の開閉
			var elem_comment = $("#clip_info_comment_" + id);
			if(elem_comment.css("display") == "none"){
				elem_comment.css({"display": "block"});
			}
			else if(elem_comment.css("display") == "block"){
				elem_comment.css({"display": "none"});
			}
		},

		//コメントの編集を実行
		exec_edit: function(loc, id){
			var url = loc;
			var param = {
				id: id,
				comment: $("#clip_info_comment_edit_ta_" + id).val(),
				authenticity_token: $("#authenticity_token").val()
			};
			var opt = {
				type: "post",
				dataType: "json"
			};
			var callback = "callback_edit";

			//ローディングを表示
			$("#clip_editing_" + id).css({"display": "inline"});

			this.xhr(url, param, opt, callback);
		},

		//コメント編集結果
		callback_edit: function(){
			if(this.response.status == "success"){
				var id = this.response.id;
				var comment = this.response.comment;

				//ローディングを消す
				$("#clip_editing_" + id).css({"display": "none"});

				//コメントを更新
				$("#clip_info_comment_" + id).html(comment);

				//フォームを消してコメントを表示
				$("#clip_info_comment_" + id).css({"display": "block"});
				$("#clip_info_comment_edit_" + id).css({"display": "none"});

				this.response = "";
			}
			else{
				alert("Comment edit failed!");
			}

		}

	};

	extend(Tcliper, Clip);

})();