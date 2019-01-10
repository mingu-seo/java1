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
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">로그인</h3>

			<div class="member">
				<div class="box">
					<p>아이디(이메일) 비밀번호를 입력해 주세요.
					</p>
					<fieldset class="login_form">
						<ul>
							<li><input type="text" name="id" id="id" placeholder="아이디(이메일)"></li>
							<li><input type="password" name="password" id="password" placeholder="비밀번호"></li>
							<li><label><input type="checkbox" name="reg" id="reg"/> 아이디저장</label></li>
						</ul>
						<div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
					</fieldset>
					<div class="btnSet clear">
						<div>
							<a href="write.php" class="btn">회원가입</a> 
							<a href="idsearch.php" class="btn">아이디/비밀번호찾기</a>
						</div>
					</div>
				</div>
			</div>

		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
