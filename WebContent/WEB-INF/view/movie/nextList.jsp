<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
ArrayList<MovieVo> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes"> 
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>개봉 예정작</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">개봉 예정작</h3>
			<div class="bbs">
				<div class="gallery">
					<ul>
						<% MovieVo data;
							for(int i=0; i<list.size();i++) {
								data = list.get(i);
								%>
						<li>
							<a>
							<dl>
								<dt class="img">
										<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getPoster()%>"  onclick="location.href='detail.do?no=<%=data.getNo()%>';" alt=""/>
								</dt>
								<dd class="date"></dd>
								<dd class="title">
									<%=data.getTitle()%>
								</dd>
								<dd class="btnArea">
									<input type="button" class="btn" value="상세" onclick="location.href='detail.do?no=<%=data.getNo()%>'"/>
									<%if(DateUtil.getDiff(data.getReleaseDate(), DateUtil.getToday())<=14){%><input type="button" class="btn" value="예매" onclick="showDialogue('<%=data.getNo()%>');"/>
									<%} %>
								</dd>
							</dl>
							</a>  
						</li>
							<%} %>
					</ul>
				</div>
			
				<div class="pagenate clear">
					<%=Page.userindexList(param.getReqPageNo(), totPage, request)%>
				</div>
			</div>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>