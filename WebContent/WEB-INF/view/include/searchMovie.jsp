<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
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
			<h3 class="sub_title">영화 검색</h3>
			<div class="bbs"> 
				<div class="ticket">
					<ul>
					<% MovieVo data; 
					for (int i=0; i<list.size(); i++) { 
							data=list.get(i);
							%>
						<li>
							<a href="/movie/detail.do?no=<%=data.getNo()%>">
							<dl>
								<dt class="img">
										<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getPoster()%>" alt=""/>
								</dt>
								<dd class="title">
								<%=data.getTitle() %>
								<%if(data.getRating()==19) {%>
									<img src="/img/19.png" width="30"> 
									<%}else if(data.getRating()==15) {  %>
									<img src="/img/15.png" width="30">
									<%}else if(data.getRating()==12) {  %>
									<img src="/img/12.png" width="30">
									<%}else { %>
									<img src="/img/all.png" width="30"> <%} %>
								</dd>
								<dd class="txt_l">
								감독 : <%=data.getDirector() %>
								</dd>
								<dd class="txt_l">
								장르 :  <%=data.getGenre() %>
								</dd>
								<dd class="contents">
								<%=Function.strCut(data.getContents(), "", 70, 0, true, true)%>
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