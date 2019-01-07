<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="util.*" %>
<%
// 로그인 버튼 클릭 시 현재 페이지 유지
String urlMaintain		= request.getRequestURI();
String paramMaintain	= Function.getReqParameter(request.getQueryString(), "");		// 전달 받은 파라메터
String strReferer = Function.checkNull(request.getHeader("referer"));

if ("POST".equals(request.getMethod())) {
	urlMaintain = urlMaintain.substring(0, urlMaintain.lastIndexOf("/"));
}
%>
<div id="com2" style="width:0px; height:0px; position:absolute; left:0px; top:0px; z-index:1;"> 
<form name="urlMaintain" id="urlMaintain" action="/member/login" method="post">
		<input type="hidden" name="url" id="login_url" value="<%=urlMaintain%>">
		<input type="hidden" name="param" id="login_param" value="<%=paramMaintain%>">
</form>
</div>

