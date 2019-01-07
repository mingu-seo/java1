// 메뉴 초기화
$(function() {
	
	// 메뉴 수
	var menuElements = $(".menu_1depth").get();					// 대메뉴
	var menuElements_sub = $(".menu_2depth").get();			// 중메뉴
	var menuElements_subList = $(".menu_3depth").get();			// 중메뉴(li 리스트)
	var row = menuElements.length;										// 대메뉴 갯수
	var rowSubList = menuElements_subList.length;
	
	if (getCookie("depth1") != "" && getCookie("depth2") != "") {
		menu_change($(menuElements[getCookie("depth1")]), $(menuElements_sub[getCookie("depth2")]));
	}
	
	for(var i=0; i<row; i++) {
		$(menuElements[i]).bind("click",{obj:i},menuClicked);	// 대메뉴 클릭시
	}
	for(var i=0; i<row; i++) {
		$(menuElements_sub[i]).bind("click",{obj:i},menuClickedSub);	// 중메뉴 클릭시
	}
	for(var i=0; i<rowSubList; i++) {
		$(menuElements_subList[i]).bind("click",{obj:i},menuClickedSubList);	// 중메뉴(li 리스트) 클릭시
	}
	
	// 전체펼침
	$("#open_all").click(function() {
		open_all();
		return false;
	});
	
	// 전체닫힘
	$("#close_all").click(function() {
		close_all();
		return false;
	});		
	
	// 메뉴하나 펼침, 서브메뉴 노출
	function open_all() {
		for(var i=0; i<row; i++) {
			$(menuElements[i]).addClass("on");
			$(menuElements_sub[i]).css("display","");
		}
	}
	
	// 메뉴하나 닫힘, 서브메뉴 사라짐
	function close_all() {
		for(var i=0; i<row; i++) {
			$(menuElements[i]).removeClass();
			$(menuElements_sub[i]).css("display","none");
		}				
	}
	
	// 메뉴 클릭시 호출함수
	function menu_change(depth1, depth2) {
		for(var i=0; i<row; i++) {
			$(menuElements[i]).removeClass();
			$(menuElements_sub[i]).css("display","none");
		}
		depth1.addClass("on");
		depth2.css("display","");
	}
	
	// 대메뉴 클릭함수
	function menuClicked(e) {		
		menu_change($(menuElements[e.data.obj]), $(menuElements_sub[e.data.obj]));		
	}
	// 서브메뉴 클릭함수
	function menuClickedSub(e) {		
		setCookie("depth1", e.data.obj);
		setCookie("depth2", e.data.obj);
	}
	// 서브메뉴 클릭함수
	function menuClickedSubList(e) {		
		setCookie("depth3", e.data.obj);
	}
	
	// 선택된 서브메뉴리스트에 스타일 적용
	if (getCookie("depth3") != "") {
		$(menuElements_subList[getCookie("depth3")]).addClass("on");
	} else {
		// 선택된 서브메뉴리스트의 쿠키가 없을 시 전체메뉴 닫힘
		close_all();
	}
});

