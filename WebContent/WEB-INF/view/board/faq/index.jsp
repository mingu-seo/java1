<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.faq.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
FaqVO param = (FaqVO)request.getAttribute("vo");
ArrayList<FaqVO> list = (ArrayList)request.getAttribute("list");
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
function showTr(id) {
	$("#"+id).toggle();
}
</script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">자주하는질문</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<caption>질문 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="100px" />
						<col width="*" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>종류</th>
							<th>질문</th>
						</tr>
					</thead>
					<tbody>
					<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="8">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										FaqVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
								%>
								
						<tr style='cursor:pointer;' onclick="showTr('tr<%=i%>');">
							<td><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%> </td>
							<td><%=CodeUtil.getQtype(data.getType())%></td>
							<td class="txt_l"><%=data.getQuestion() %></td>
						</tr>
						<tr id="tr<%=i%>" style="display:none;">
							<td colspan="2"></td>
							<td class="txt_l"><%=data.getAnswer() %></td>
						</tr>
					<%}%>
					<%}%>
					</tbody>
				</table>
			
				<div class="pagenate clear">
					<ul class='paging'>
						<li><a href='javascript:;' class='current'><%=Page.indexList(param.getReqPageNo(), totPage, request)%></a></li>
				
					</ul>
				</div>
				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="index.do">
						<span class="srchSelect">
							<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all" <%=Function.getSelected(param.getStype(), "all") %> >전체</option>
								<option value="question" <%=Function.getSelected(param.getStype(), "question") %>>질문</option>
								<option value="answer" <%=Function.getSelected(param.getStype(), "answer") %>>답변</option>
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
