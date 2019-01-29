<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<%@ page import="ticket1.*" %>
<%
ArrayList<Ticket1VO> date = (ArrayList)request.getAttribute("date");
ArrayList<MovieVo> list = (ArrayList)request.getAttribute("list");
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
<title>예매</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">예매</h3>
			<div class="dateList">
			<% Ticket1VO data;
				for(int i=0; i<date.size();i++) {
					data = date.get(i);
			%> 
				<div class="dateArea" >
					<span class="month">
					<% if (i==0 || data.getToday().substring(8,10).equals("01")) { %>
						<% if (data.getToday().substring(5,6).equals("0")) { %>
						<%=data.getToday().substring(6,7) %>
						<%} else {%>
						<%=data.getToday().substring(5,7)%>
						<% } %>/
					<%} %>
					</span>
					<span class="date <%if(data.getYoil()==7){ %>sat<%} else if (data.getYoil()==1){%> sun<%}%>">
					<% if (data.getToday().substring(8,9).equals("0")) {%>
						<%=data.getToday().substring(9,10) %>
						<% }else{ %>
						<%=data.getToday().substring(8,10) %>
						<%} %>
					</span>
				</div>
			<%} %>
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