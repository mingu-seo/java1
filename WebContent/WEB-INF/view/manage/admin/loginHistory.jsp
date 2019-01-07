<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.admin.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
AdminVO param = (AdminVO)request.getAttribute("vo");
ArrayList<AdminVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
</head>
<body> 
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>관리자 접속기록 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자접속기록 목록입니다.">
								<colgroup>
									<col class="w10" />
									<col class="" />
									<col class="w20" />
									<col class="w20" />
									<col class="w20" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first">번호</th>
										<th scope="col">아이디</th> 
										<th scope="col">이름</th> 
										<th scope="col">아이피</th> 
										<th scope="col">접속일</th> 
									</tr>
								</thead>
								<tbody>
								<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="5">등록된 자료가 없습니다.</td>
									</tr>
								<%
									} else { 
										for (int i=0; i<list.size(); i++) {
								%>
									<tr>
										<td class="first"><%=totCount-((param.getReqPageNo()-1)*param.getPageRows())-i%></td>
										<td><%=list.get(i).getId()%></td>
										<td><%=list.get(i).getName()%></td>
										<td><%=Function.checkNull(list.get(i).getIp())%></td>
										<td class="last"><%=DateUtil.getDateTimeFormat(list.get(i).getLogindate())%></td>
									</tr>
								<%
										}
									}
								%>
								</tbody>
							</table>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="loginHistory.do" method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="id" <%=Function.getSelected(param.getStype(), "id") %>>아이디</option>
										<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>이름</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
						</div>
						<!-- //blist -->
					</div>
					<!-- //bbs --> 
					<!-- 내용 : e -->
				</div>
				<!--//con -->
			</div>
			<!--//content -->
		</div>
		<!--//container --> 
		<!-- E N D :: containerArea-->
	</div>
	<!--//canvas -->
</div>
<!--//wrap -->

</body>
</html>