<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<%@ page import="ticket1.*" %>   
<%
ArrayList<Ticket1VO> date = (ArrayList)request.getAttribute("date");
ArrayList<MovieVo> list = (ArrayList)request.getAttribute("list");
MovieVo movie = (MovieVo) request.getAttribute("vo");
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
				<div class="dateArea <%=data.getToday().equals(movie.getTkdate()) ? "active":""%>" onclick="location.href='index.do?tkdate=<%=data.getToday()%>'">
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
				<div>
				<form name="orderForm" id="orderForm" action="index.do"  method="post">
					<div class="search">
						<select name="ordertype" onchange="$('#orderForm').submit();">
							<option value="title" <%=Function.getSelected(movie.getOrdertype(), "title") %>>제목순</option>
							<option value="releasedate" <%=Function.getSelected(movie.getOrdertype(), "releasedate") %>>개봉일순</option>
							<option value="enddate" <%=Function.getSelected(movie.getOrdertype(), "enddate") %>>상영종료일순</option>
						</select>
					</div>
				</form>
				</div>
					<ul>
					<% MovieVo moviedata;
							for(int i=0; i<list.size(); i++) {
								moviedata = list.get(i);
					%>
						<li>
							<a href="javascript:showDialogue(<%=moviedata.getNo()%>);">
							<dl>
								<dt class="img">
										<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=moviedata.getPoster()%>" alt=""/>
								</dt>
								<dd class="title">
								<%=moviedata.getTitle() %>
									<%if(moviedata.getRating()==19) {%>
									<img src="/img/19.png" width="30"> 
									<%}else if(moviedata.getRating()==15) {  %>
									<img src="/img/15.png" width="30">
									<%}else if(moviedata.getRating()==12) {  %>
									<img src="/img/12.png" width="30">
									<%}else { %>
									<img src="/img/all.png" width="30"> <%} %>
								</dd>
								<dd class="txt_l">
								감독 : <%=moviedata.getDirector() %>
								</dd>
								<dd class="txt_l">
								장르 : <%=moviedata.getGenre() %>
								</dd>
								<dd class="contents">
								<%=Function.strCut(moviedata.getContents(), "", 70, 0, true, true)%>
								</dd>
							</dl>
							</a>
						</li>
						<%} %>
					</ul>
				</div>
			</div>

		</div>
		
	</div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>