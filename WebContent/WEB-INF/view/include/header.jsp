<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%member.MemberVO memberInfo = (member.MemberVO)session.getAttribute("memberInfo"); %>
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
	});

	$(".login_info > .top_area > img").click(function() {
		$(".login_info").hide();
	});

	var swiper = new Swiper('.swiper-container', {
		loop: true,
		autoplay: {
		    delay: 5000,
		  },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
       	},
	});
});

//로그인, 이메일 체크
function loginCheck(){
	if ( getObject("loginEmail").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("loginEmail").focus();
		return false;
	}
	if ( getObject("LoginPw").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("LoginPw").focus();
		return false;
	}
	var f = document.board;
	if (f.reg.checked==true) {
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.id.value + ";path=/;expires="+now.getTime();
	}
	return true;
}

function useremail_chk() {
	var f=document.board;
	var useridname = CookieVal("cookie_userid");
	
	if (useridname=="null"){	
		f.id.focus();
		f.id.value="";
	} else {
		f.password.focus();
		f.id.value=useridname;
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
                <h1 class="logo"><a href="/"><img src="/img/logo.png"/></a></h1>
                <div class="util clear">
                <%if(memberInfo==null){ %>
                    <a href="#;" id="login_click">로그인</a>
                    <a href="/member/join.do">회원가입</a>
                <%}else{%>
                	<a href="/logout.do">로그아웃</a>
                    <a href="">마이페이지</a>
                <% } %>
                </div>
                <form action="/login.do" method="post" onsubmit="return loginCheck();">
                <div class="login_info">
                	<div class="top_area"><img src="/img/btn_del.gif"/></div>
                	<div class="title_area"><span>MOVIE 로그인</span></div>
                	<div class="middle_area">
                		<div class="input_area">
                			<input type="text" id="loginEmail" name="email" value="" placeholder="이메일"/>
                			<input type="password" id="LoginPw" name="pw" value="" placeholder="비밀번호"/>
                		</div>
                		<div class="login_btn">
                			<input type="submit" value="로그인"/>
                		</div>
                	</div>
                	<div class="bottom_area">
                		<input type="checkbox" id="saveEmail" name="saveEmail"/>이메일 저장
                	</div>
                	<!-- //joinList -->
					<input type="hidden" name="url" id="url" value="<%//=url%>"/>
					<input type="hidden" name="param" id="param" value="<%//=param%>"/>
					<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
                </div>
                </form>
            </div>
        </div>
        <div class="head_bot">
            <div class="size">
                <div class="gnb">
                    <ul class="depth1 clear">
                        <li>
                            <a href="" >MOVIE</a>
                            <ul class="depth2">
                                <li><a href="movie/list" >현재 상영작</a></li>
                                <li><a href="" >개봉 예정작</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >TICKET</a>
                            <ul class="depth2">
                                <li><a href="" >예매하기</a></li>
                                <li><a href="" >상영 시간표</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >NOTICE</a>
                            <ul class="depth2">
                                <li><a href="" >공지사항</a></li>
                                <li><a href="" >이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >STORE</a>
                            <ul class="depth2">
                                <li><a href="" >상품권</a></li>
                                <li><a href="" >스낵</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
