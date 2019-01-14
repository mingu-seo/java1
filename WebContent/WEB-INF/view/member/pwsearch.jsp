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
<title>MOVIE</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<script>

//로그인, 이메일 체크
function loginCheck(){
	if ( getObject("email").value.length < 1 ) {
		alert("이메일을 입력해주세요.");
		getObject("email").focus();
		return false;
	}
	if ( getObject("pw").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("pw").focus();
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
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
	<form action="/login.do" method="post">
    <div class="sub">
		<div class="size">
			<h3 class="sub_title">비밀번호 찾기</h3>
			
			<div class="member">
				<div class="box">
					<p>이름과 휴대폰 번호를 입력해 주세요.
					</p>
					<fieldset class="login_form">
						<ul>
							<li><input type="text" name="email" id="email" placeholder="이메일"></li>
							<li><input type="password" name="hp" id="hp" placeholder="휴대폰번호"></li>
						</ul>
						<div class="login_btn"><input type="submit" value="비밀번호찾기" alt="비밀번호찾기" /></div>
					</fieldset>
					<div class="btnSet clear">
						<div>
							<a href="idsearch.do" class="btn">아이디 찾기</a> 
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
