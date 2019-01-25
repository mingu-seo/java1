<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO data = (MemberVO)request.getAttribute("data");
%>
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
function goSave() {
	
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}
	if ($("#hp").val() == "") {
		alert("휴대폰 번호를 입력해주세요.");
		$("#hp").focus();
		return false;
	}
	
}
</script>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
	<form action="searchpw.do" name="board" method="post">
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
							<li><input type="text" name="hp" id="hp" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" placeholder="휴대폰번호"></li>
						</ul>
						<div class="login_btn">
						<input type="submit" value="비밀번호찾기" onclick="goSave();" alt="비밀번호찾기" />
						</div>
					</fieldset>
					<div class="btnSet clear">
						<div>
							<a href="emailsearch.do" class="btn" >아이디 찾기</a> 
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
