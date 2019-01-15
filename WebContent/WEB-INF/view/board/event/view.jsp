<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.event.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
EventVO param = (EventVO)request.getAttribute("data");
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
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <div class="sub">
		<div class="size">
			<h3 class="sub_title">이벤트</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt><%=param.getEvent_name()%> </dt>
							
							<dd class="date">시작일 : <%=param.getSta_date()%> </dd>
							<dd class="date">종료일 : <%=param.getEnd_date()%> </dd>
							<dd class="date">작성일 : <%=param.getCre_date()%> </dd>
						</dl>
					</div>
					<div class="cont"><%=param.getContents()%> </div>
					<dl class="file">
						<dt>첨부파일 </dt>
						<dd><% if (param.getFilename() == null || "".equals(param.getFilename())) { %>
						<% } else { %>
						<a href="<%=Function.downloadUrl(SiteProperty.NOTICE_UPLOAD_PATH, java.net.URLEncoder.encode(param.getFilename_org(), "UTF-8"), param.getFilename()) %>" 
						target="_blank"><%= Function.checkNull(param.getFilename_org()) %> [<%= Function.getFileSize(param.getFilesize())%>] </a></dd>
					</dl>
							<% } %>	
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do?" class="btn">목록으로</a></div>
					</div>
			
				</div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
