<%@page import="movie.MovieVo"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
java.util.ArrayList<MovieVo> list = (java.util.ArrayList<MovieVo>)request.getAttribute("list");
Integer totcount = (Integer)request.getAttribute("totCount");
%>
{"movie":
	[
		<% for (int i=0; i<list.size(); i++) { %>
		{
			"no" : "<%=list.get(i).getNo()%>",
			"title" : "<%=java.net.URLEncoder.encode(list.get(i).getTitle(), "UTF-8")%>",
			"image" : "http://nanna.withsky.co.kr:8080/upload/movie/<%=list.get(i).getPoster()%>",
			"date" : "<%=list.get(i).getReleaseDate()%>"
		}<% if (i<list.size()-1) out.print(",");%><br/>
		<% } %>
	],
"totCount":"<%=totcount %>"
}