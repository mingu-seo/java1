<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%member.MemberVO memberInfo = (member.MemberVO)session.getAttribute("memberInfo"); //로그인 세션 가져오기 %>
<script type="text/javascript" src="/js/swiper.min.js"></script>
<script>

$(function() {
	$(".depth1 > li").mouseover(function(){
		$(this).find(".depth2").stop().slideDown(300);
	});
	$(".depth1 > li").mouseleave(function(){
		$(this).find(".depth2").stop().slideUp(300);
	});
	$("#login_click").click(function() {
		$(".login_info").toggle();
		$("#loginEmail").focus();
	});
	$(".login_info > .top_area > img").click(function() {
		$(".login_info").hide();
	});
	useremail_chk();
});

//로그인, 이메일 체크
function loginCheck(){
	if ( $("#loginEmail").val().length < 1 ) {
		alert("이메일을 입력해주세요.");
		$("#loginEmail").focus();
		return false;
	}
	if ( getObject("loginPw").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("loginPw").focus();
		return false;
	}
	var f = document.loginFrm;
	if (f.reg.checked==true) {
	   document.cookie = "cookie_useremail=" + f.loginEmail.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_useremail=" + f.loginEmail.value + ";path=/;expires="+now.getTime();
	}
	return true;
}

function useremail_chk() {
	var f=document.loginFrm;
	var useremail = CookieVal("cookie_useremail");
	
	if (useremail=="null"){	
		f.loginEmail.focus();
		f.loginEmail.value="";
	} else {
		f.loginPw.focus();
		f.loginEmail.value=useremail;
		f.reg.checked=true;
	}
}

function CookieVal(cookieName) {
	thisCookie = document.cookie.split("; ");
	for (var i = 0; i < thisCookie.length;i++) {
		if (cookieName == thisCookie[i].split("=")[0]) {
			return thisCookie[i].split("=")[1];
		}
	}
	return "null" ;
}	



</script>
	<div id="header">
        <div class="head_top">
            <div class="size">
                <div class="header_call">
                    <div class="txt">
                        <a href=""></a>
                    </div>
                </div>
                <h1 class="logo"><a href="/index.do"><img src="/img/logo.png"/></a></h1>
                <div class="util clear">
                <%if(memberInfo==null){ %>
                    <a href="#;" id="login_click">로그인</a>
                    <a href="/member/join.do">회원가입</a>
                <%}else{%>
                	<a href="/logout.do">로그아웃</a>
                    <a href="/mypage/index.do">마이페이지</a>
                <% } %>
                </div>
                <form action="/login.do" id="loginFrm" name="loginFrm" method="post" onsubmit="return loginCheck();">
                <div class="login_info">
                	<div class="top_area"><img src="/img/btn_del.gif"/></div>
                	<div class="title_area"><span>MOVIE 로그인</span></div>
                	<div class="middle_area">
                		<div class="input_area">
                			<input type="text" id="loginEmail" name="email" value="" placeholder="이메일"/>
                			<input type="password" id="loginPw" name="pw" value="" placeholder="비밀번호"/>
                		</div>
                		<div class="login_btn">
                			<input type="submit" value="로그인"/>
                		</div>
                	</div>
                	<div class="bottom_area">
                		<input type="checkbox" id="reg" name="reg"/><label for="reg">이메일 저장</label>
                	</div>
                </div>
                </form>
            </div>
        </div>
        <div class="head_bot">
            <div class="size">
                <div class="gnb">
                    <ul class="depth1 clear">
                        <li>
                            <a href="/movie/index.do" >MOVIE</a>
                            <ul class="depth2">
                                <li><a href="/movie/index.do" >현재 상영작</a></li>
                                <li><a href="" >개봉 예정작</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >TICKET</a>
                            <ul class="depth2">
							<%if(memberInfo==null){ %>
							<li><a href="login.do" >예매하기</a></li>
							<%}else{%>
							<li><a href="" >예매하기</a></li>	<!-- memberinfo 세션 존재시 가야할 페이지(미구현) -->
							<% } %>
                                <li><a href="" >상영 시간표</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/board/notice/index.do" >NOTICE</a>
                            <ul class="depth2">
                                <li><a href="/board/notice/index.do">공지사항</a></li>
                                <li><a href="/board/event/index.do" >이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="/board/faq/index.do" >고객센터</a>
                            <ul class="depth2">
                                <li><a href="/board/faq/index.do" >자주하는질문</a></li>
                                <li><a href="/board/qna/index.do" >Q&A</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
