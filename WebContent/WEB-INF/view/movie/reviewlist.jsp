<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="review.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<ul>
    <% if (totCount == 0) { %>
		<li>등록된 리뷰가 없습니다.</li>
	<%
		 } else {
			ReviewVO data;
			for (int i=0; i<list.size(); i++) {
				data = list.get(i);
	%>
							
								<li>
									<div class="review_writer"><%=data.getMember_name() %></div>
									<div class="review_score"><%=data.getScore()%></div>
									<div class="review_contents"><%=data.getContents() %></div>
									<div class="review_etc">
										<div class="cre_date">리뷰작성일 : <%=data.getCre_date() %></div>
										<div class="review_btn">
											<input type="button" class="btn" value="삭제"/>
										</div>
									</div>
								</li>
							
	<%
			}
		 }
	%>
</ul>
