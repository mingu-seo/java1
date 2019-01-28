<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>

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
			<h3 class="sub_title">예매</h3>
			<div class="dateList">
				<div class="dateArea">
					<span class="month">1</span>
					<span class="date">/23</span>
				</div>
				<div class="dateArea">
					<span class="date">24</span>
				</div>
				<div class="dateArea">
					<span class="date">25</span>
				</div>
				<div class="dateArea">
					<span class="date sat">26</span>
				</div>
				<div class="dateArea">
					<span class="date sun">27</span>
				</div>
				<div class="dateArea">
					<span class="date">28</span>
				</div>
				<div class="dateArea">
					<span class="date">29</span>
				</div>
				<div class="dateArea">
					<span class="date">30</span>
				</div>
				<div class="dateArea">
					<span class="date">31</span>
				</div>
				<div class="dateArea">
					<span class="month">2</span>
					<span class="date">/01</span>
				</div>
				<div class="dateArea">
					<span class="date sat">02</span>
				</div>
				<div class="dateArea">
					<span class="date sun">03</span>
				</div>
				<div class="dateArea">
					<span class="date">04</span>
				</div>
				<div class="dateArea">
					<span class="date">05</span>
				</div>
			</div>
			<div class="bbs">
				<div class="ticket">
					<ul>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster1.jpg" alt=""/>
								</dt>
								<dd class="title">
									랄프2 : 인터넷 속으로
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
							<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster2.jpg" alt=""/>
								</dt>
								<dd class="title">
									말모이
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster3.jpg" alt=""/>
								</dt>
								<dd class="title">
									내안의 그놈
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster1.jpg" alt=""/>
								</dt>
								<dd class="title">
									랄프2 : 인터넷 속으로
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
							<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster2.jpg" alt=""/>
								</dt>
								<dd class="title">
									말모이
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster3.jpg" alt=""/>
								</dt>
								<dd class="title">
									내안의 그놈
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster1.jpg" alt=""/>
								</dt>
								<dd class="title">
									랄프2 : 인터넷 속으로
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
							<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster2.jpg" alt=""/>
								</dt>
								<dd class="title">
									말모이
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
								</dd>
							</dl>
							</a>
						</li>
						<li>
							<a href="javascript:showDialogue();">
							<dl>
								<dt class="img">
										<img src="/img/poster3.jpg" alt=""/>
								</dt>
								<dd class="title">
									내안의 그놈
								</dd>
								<dd class="contents">
									어쩌고 저쩌고, 이러전 저런 기타 등등.....
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