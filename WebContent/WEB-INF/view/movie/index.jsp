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
			<h3 class="sub_title">현재 상영작</h3>
			<div class="bbs">
				<div class="gallery">
					<ul>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster1.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									주먹왕 랄프 : 인터넷속으로
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster2.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									말모이
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster3.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									내 안의 그놈
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster4.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									그린북
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster5.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									아쿠아맨
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="view.do?no=1">
							<dl>
								<dt class="img">
										<img src="/img/poster6.jpg" alt=""/>
								</dt>
								<dd class="date">평점 4.5</dd>
								<dd class="title">
									보헤미안 랩소디
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세"/>
									<input type="button" class="btn" value="예매"/>
								</dd>
							</dl>
							</a>
						</li>
					</ul>
				</div>
			
				<div class="pagenate clear">
					<li><a href='javascript:;' class='current'>1</a></li>
				</div>
			</div>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>