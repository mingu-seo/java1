function hygn_setting(){
	$(".blinder").css({"display":"none","opacity":"0","background":"#fff"});

	// 메인비쥬얼 제이쿼리
	var mv_cur = 0;
	var mv_prev = null;
	var img_ea = $(".main_visual .imgs > li").size()-1;
	function blinder_set(){
		$(".main_visual .blinder").css({"display":"none"});
		barney_dalay = setInterval(barney_auto,3000);
	};
	$(".indis > ul > li > a").on("click",function(e){
		if($(this).parent().index() != mv_cur){
			$(".main_visual .blinder").css({"display":"block"});
			clearInterval(barney_dalay);
			mv_prev = mv_cur;
			mv_cur = $(this).parent().index();
			$(".main_visual .indis > ul > li > a > img").attr({"src":"/img/hygn_mv_indi_off.png","alt":"off"});
			$(this).find("img").attr({"src":"/img/hygn_mv_indi_on.png","alt":"on"});
			var prev_li = $(".main_visual .imgs > li").eq(mv_prev);
			var current_li = $(".main_visual .imgs > li").eq(mv_cur);
			TweenMax.fromTo(prev_li,0.8,{"left":"0"},{"left":"-100%","ease":"Expo.easeInOut"});
			TweenMax.fromTo(current_li,0.8,{"left":"100%"},{"left":"0","ease":"Expo.easeInOut","onComplete":blinder_set});
		};
	});

	function barney_auto(){
		$(".main_visual .blinder").css({"display":"block"});
		clearInterval(barney_dalay);
		mv_prev = mv_cur;
		mv_cur++;
		if(mv_cur > img_ea){
			mv_cur = 0;
			mv_prev = img_ea;
		};
		$(".main_visual .indis > ul > li > a > img").attr({"src":"/img/hygn_mv_indi_off.png","alt":"off"});
		$(".main_visual .indis > ul > li").eq(mv_cur).find(" > a > img").attr({"src":"/img/hygn_mv_indi_on.png","alt":"on"});
		var prev_li = $(".main_visual .imgs > li").eq(mv_prev);
		var current_li = $(".main_visual .imgs > li").eq(mv_cur);
		TweenMax.fromTo(prev_li,0.8,{"left":"0"},{"left":"-100%","ease":"Expo.easeInOut"});
		TweenMax.fromTo(current_li,0.8,{"left":"100%"},{"left":"0","ease":"Expo.easeInOut","onComplete":blinder_set});
	};
	var barney_dalay = setInterval(barney_auto,3000);


	
};