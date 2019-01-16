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
<title>회원탈퇴</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<script>

//로그인, 이메일, 휴대폰 번호 체크
function secessionCheck(){
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
	if ( getObject("hp").value.length < 1 ) {
		alert("비밀번호를 입력해주세요.");
		getObject("hp").focus();
		return false;
	}
}
</script>
<body onload="getObject('email1').focus();">
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
	<form action="secessionState.do" method="post" onsubmit="return secessionCheck();">
    <div class="sub">
		<div class="size">
			<h3 class="sub_title">회원탈퇴</h3>
			
			<div class="member">
				<div class="box">
					<fieldset class="login_form">
						<ul>
							<li><input type="text" id="email1" name="email" placeholder="이메일"></li>
							<li><input type="password" id="pw1" name="pw" placeholder="비밀번호"></li>
							<li><input type="text" id="hp" name="hp" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" placeholder="휴대폰 번호"></li>
						</ul>
						<div class="login_btn"><input type="submit" value="탈퇴" alt="탈퇴" /></div>
					</fieldset>
					<div class="btnSet clear">
						<div>
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
