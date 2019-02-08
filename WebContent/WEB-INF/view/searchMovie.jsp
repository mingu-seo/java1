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
<title>예매</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">영화 검색</h3>
			<div class="bbs"> 
				<div class="ticket">
					<ul>
					<%  for (int i=0; i<10; i++) { %>
						<li>
							<a href="javascript:showDialogue(24);">
							<dl>
								<dt class="img">
									<img src="/upload/movie/movie_1548052910690.jpg" alt=""/>
								</dt>
								<dd class="title">
								아쿠아맨
									<img src="/img/12.png" width="30">
								</dd>
								<dd class="txt_l">
								감독 : 제임스 완
								</dd>
								<dd class="txt_l">
								장르 : 액션,판타지
								</dd>
								<dd class="contents">
								땅의 아들이자 바다의 왕, 심해의 수호자인슈퍼히어로 아쿠아맨의 탄생을 ...
								</dd>
							</dl>
							</a>
						</li>
					<% } %>
					</ul>
				</div>
			</div>

		</div>
		
	</div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>