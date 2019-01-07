<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="test.*" %>
<%@ page import="java.util.*" %>
<%
ArrayList<TestVO> list = (ArrayList)request.getAttribute("testList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
TEST <%=request.getAttribute("test") %> <br/>

<%
for (int i=0; i<list.size(); i++) {
%>
<%=list.get(i).getNo() %>&nbsp;<%=list.get(i).getName()%>&nbsp;<%=list.get(i).getEmail()%>
<%
}
%> 
</body>
</html>