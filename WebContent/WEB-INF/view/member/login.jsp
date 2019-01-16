<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>로그인</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<script>

//로그인, 이메일 체크
function loginCheck1(){
	if ( getObject("email1").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("email1").focus();
		return false;
	}
	if ( getObject("pw1").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("pw1").focus();
		return false;
	}
	var f = document.board1;
	if (f.reg1.checked==true) {
	   document.cookie = "cookie_userid=" + f.email1.value + ";path=/;expires=Sat, 31 Dec 2050 23:59:59 GMT;";
	} else {
	   var now = new Date();	
	   document.cookie = "cookie_userid=" + f.email1.value + ";path=/;expires="+now.getTime();
	}
	return true;
}

function useremail_chk1() {
	var f=document.board1;
	var useremail = CookieVal("cookie_userid");
	
	if (useremail=="null"){	
		f.email1.focus();
		f.email1.value="";
	} else {
		f.pw1.focus();
		f.email1.value=useremail;
		f.reg1.checked=true;
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
<body onload="getObject('email1').focus();useremail_chk1();">
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
	<form action="/login.do" method="post" id="board1" name="board1" onsubmit="return loginCheck1();"><!-- header에서 id="board"이미 사용중이라서 board2로 함 -->
    <div class="sub">
		<div class="size">
			<h3 class="sub_title">로그인</h3>
			
			<div class="member">
				<div class="box">
					<fieldset class="login_form">
						<ul>
							<li><input type="text" id="email1" name="email" placeholder="이메일"></li>
							<li><input type="password" id="pw1" name="pw" placeholder="비밀번호"></li>
							<li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
						</ul>
						<div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
					</fieldset>
					<div class="btnSet clear">
						<div>
							<a href="join.do" class="btn">회원가입</a> 
							<a href="idsearch.do" class="btn">이메일/비밀번호 찾기</a>
						</div>
					</div>
				</div>
			</div>

		</div>
    </div>
	</form>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>
