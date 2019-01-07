<%@ page contentType="text/html; charset=utf-8" %>
<%
String code = (String)request.getAttribute("code");
String message = (String)request.getAttribute("message");
String url = (String)request.getAttribute("url");
String target = (String)request.getAttribute("target");
%>

<% if ("alertMessageBack".equals(code)) { %>
<script>
	alert("<%=message%>");
	history.back();
</script>
<% } else if ("alertMessageUrl".equals(code)) { %>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
</script>
<% } else if ("alertMessageUrlClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	location.href="<%=url%>";
	window.close();
</script>
<% } else if ("alertMessageTargetUrlClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	<%=target%>.location.href='<%=url%>';
	window.close();	
</script>
<% } else if ("alertMessageTargetReloadClose".equals(code)) { %>
<script>
	alert("<%=message%>");
	<%=target%>.location.href='<%=url%>';
	window.reload();
</script>
<% } %>