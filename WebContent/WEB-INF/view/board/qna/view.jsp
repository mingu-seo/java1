<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.reply3.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReplyVO3 param = (ReplyVO3)request.getAttribute("data");
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
			<h3 class="sub_title">질문내용</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt><%=param.getTitle()%> </dt>
							<dd class="date">작성일 : <%=param.getRegistdate()%> </dd>
						</dl>
					</div>
					<div class="cont"><%=param.getContents()%> </div>
				
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
