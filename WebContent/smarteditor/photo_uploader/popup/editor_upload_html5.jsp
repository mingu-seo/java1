<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
int maxupload = 50*1024*1024;
//MultipartRequest multi = new MultipartRequest(request, request.getRealPath("/upload/editor/"), maxupload, "utf-8",  new DefaultFileRenamePolicy());
%>
<%

/*
Enumeration fileNameParams = multi.getFileNames();
String file_name = "";
while (fileNameParams.hasMoreElements()) {
	String fileName = (String)fileNameParams.nextElement();
	file_name = multi.getFilesystemName(fileName);	// 실제이름
	String org_value = multi.getOriginalFileName(fileName);
}
*/
%>
&bNewLine=true&sFileName=8.jpg&sFileURL=/upload/editor/8.jpg