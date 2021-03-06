<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.event.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
EventVO param = (EventVO)request.getAttribute("vo");
ArrayList<EventVO> list = (ArrayList)request.getAttribute("list");
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
			<h3 class="sub_title">이벤트</h3>

			<div class="bbs">
				<table class="list">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<caption>이벤트 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="80px" />
						<col width="100px" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>작성일</th>
							<th>조회수</th>
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
										EventVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("view.do", param, param.getNo())+"'\"";
								%>
								
						<tr style='cursor:pointer;' onclick="location.href='view.do?no=<%=data.getNo()%>'">
							<td><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%> </td>
							<td class="txt_l"> <%=data.getEvent_name()%></td>
							<td class="name"> 관리자</td>
							<td class="date"><%=DateUtil.getDateFormat(data.getSta_date())%></td>
							<td class="date"><%=DateUtil.getDateFormat(data.getEnd_date())%></td>
							<td class="date"><%=DateUtil.getDateFormat(data.getCre_date())%></td>
							<td class="hit" ><%=data.getReadno()%></td>
						</tr>
						
					<%}%>
					<%}%>
					</tbody>
					
				</table>
			
				<div class="pagenate clear">
						<%=Page.userindexList(param.getReqPageNo(), totPage, request)%>
				</div>
				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="index.do">
						<span class="srchSelect">
							<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all" <%=Function.getSelected(param.getStype(), "all") %> >전체</option>
								<option value="event_name" <%=Function.getSelected(param.getStype(), "event_name") %>>이벤트명</option>
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
