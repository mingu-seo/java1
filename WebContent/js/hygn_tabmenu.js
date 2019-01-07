function hygn_tabmenu(obj,index_01){
	if(obj.children("li").size() > index_01){
		//var src_txt = obj.children("li").eq(index_01).find("a > img").attr("src");
		obj.children("li").eq(index_01).addClass("selected");
	};

	var current = index_01;
	var prev = null;
	obj.children("li").hover(function(e){
		if($(this).index() != index_01){
			//var src_txt = $(this).children("a").children("img").attr("src");
			$(this).addClass("selected");
		};
	},function(e){
		if($(this).index() != index_01){
			//var src_txt = $(this).children("a").children("img").attr("src");
			$(this).removeClass("selected");
		};
	});
};