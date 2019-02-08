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
<script>
function goDelete(v) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "sprocess.do?no="+v+"&cmd=delete";
	}
}
</script>
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
							<dd class="date">작성자 : <% if (param.getAdmin_fk() > 0) { %>
													<%=param.getAdmin_writer() %>
													<% } else { %>
													<%=param.getMember_writer() %>
													<% } %> </dd>
						</dl>
					</div>
					<div class="cont"><%=param.getContents()%> </div>
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do?" class="btn">목록으로</a></div>
						<div class="fl_l"><a href="sreply.do?no=<%=param.getNo() %>" class="btn">답변하기</a></div>
					<% if (memberInfo != null && memberInfo.getNo() == param.getMember_fk())  {
					%>
					<div class="fl_r"><input type="button" class="btn" value="삭제" onclick="goDelete(<%=param.getNo()%>);"/></div>
					<%} %>	 
					</div>
			
				</div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
