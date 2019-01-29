<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="review.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="member.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
MemberVO memberInfo = (MemberVO)session.getAttribute("memberInfo");
%>
<ul>
<% if (totCount == 0) { %>
	<li class="first" colspan="8">등록된 글이 없습니다.</li>
<%
	} else {
		String targetUrl = "";
		String topClass = "";
		ReviewVO data;
		for (int i=0; i<list.size(); i++) {
		data = list.get(i);
%>
	<li>
		<div class="review_writer"><%=data.getMember_name() %></div>
		<div class="review_score"><%=CodeUtil.getScoreType(data.getScore())%></div>
		<div class="review_contents"><%=data.getContents() %></div>
		<div class="review_etc">
		    <div class="review_date"><%=data.getCre_date() %></div>
			<div class="review_btn">
			<% if (memberInfo != null && memberInfo.getNo() == Integer.parseInt(data.getMember_pk()))  {
			%>
				<input type="button" class="btn" value="삭제" onclick="goDelete(<%=data.getNo()%>);"/>
			<%} %>	 
			</div>
		</div>
	</li>
<%
	}
	 }
%>
</ul>