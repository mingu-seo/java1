<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.reply3.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReplyVO3 param = (ReplyVO3)request.getAttribute("vo");
ArrayList<ReplyVO3> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
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
function goSearch() {
	$("#searchForm").submit();
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">Q&A</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<caption>게시판 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							<th>답변</th>
						</tr>
					</thead>
					<tbody>
					<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="8">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										ReplyVO3 data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
								%>
								
						<tr<%=data.getNo()%>>
							<td><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%> </td>
							<td <%=targetUrl%> class="txt_l">
											<% for (int j=0; j<data.getNested(); j++) { %>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<% } %>
											<% if (data.getNested() > 0) { %>
											<img src="/img/ico_re.png"/>
											<% } %>
											<a href="view.do?no=<%=data.getNo()%>"><%=data.getTitle()%></a>
										</td>
							<td class="writer">
							<% if (data.getAdmin_fk() > 0) { %>
								<%=data.getAdmin_writer() %>
							<% } else { %>
								<%=data.getMember_writer() %>
							<% } %>
							</td>
							<td class="date"><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
							<td class="hit" ><%=data.getReadno()%></td>
							<td class="last"><input type="button" value="답변" onclick="location.href='sreply.do?no=<%=list.get(i).getNo()%>';"/></td>
						</tr>
						
					<%}%>
					<%}%>
					</tbody>
				</table>
				<div class="btnSet"  style="text-align:right;">
					<a class="btn" href="swrite.do">질문작성 </a>
				</div>
				<div class="pagenate clear">
					<%=Page.userindexList(param.getReqPageNo(), totPage, request)%>
				</div>
			
				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="index.do">
						<span class="srchSelect">
							<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all" <%=Function.getSelected(param.getStype(), "all") %> >전체</option>
								<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>제목</option>
								<option value="contents"<%=Function.getSelected(param.getStype(), "contents") %> >내용</option>
							</select>
						</span>
						<span class="searchWord">
							<input type="text" id="sval" name="sval" value="<%=param.getSval()%>"  title="검색어 입력" onKeypress="">
							<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
						</span>
					</form>
					
				</div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
