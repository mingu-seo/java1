<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="ticket1.*" %>
<%@ page import="movie.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
Ticket1VO param = (Ticket1VO)request.getAttribute("vo");
ArrayList<Ticket1VO> TicketList = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript" src="/js/function_jquery.js"></script>

<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			document.frm.submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}
</script>
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
					<h2>예매관리 - [목록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w3" />
									<col class="w5" />
									<col class="w5" />
									<col class="w7" />
									<col class="w3" />
									<col class="" />
									<col class="" />
									<col class="w7" />
									<col class="" />
									<col class="" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">영화</th>
										<th scope="col">영화포멧</th>
										<th scope="col">예매일</th>
										<th scope="col">예매취소일</th>
										<th scope="col">예매 상태</th>
										<th scope="col">상영일</th>
										<th scope="col">상영시간</th>
										<th scope="col">결제수단</th>
										<th scope="col">결제상태</th>
									</tr>
								</thead>
								<tbody>
								<% if (TicketList.size() == 0) { %>
									<tr>
										<td class="first" colspan="10">등록된 예매내역이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										for (int i=0; i<TicketList.size(); i++) {
											Ticket1VO data = TicketList.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read.do", param, data.getNo())+"'\"";
								%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<td <%=targetUrl%>><%=data.getNo()%></td>
										<td <%=targetUrl%>><%=data.getMovie_pk()%></td>
										<td <%=targetUrl%>><%=data.getFormat()%></td>
										<td <%=targetUrl%>><%=data.getRes_date()%></td>
										<td <%=targetUrl%>><%=data.getCancle_date()%></td>
										<td <%=targetUrl%>><%=data.getRes_state()%></td>
										<td <%=targetUrl%>><%=data.getScreen_date()%></td>
										<td <%=targetUrl%>><%=data.getScreen_time()%></td>
										<td <%=targetUrl%>><%=data.getPay()%></td>
										<td <%=targetUrl%>><%=data.getPay_state()%></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
							<input type="hidden" name="cmd" id="cmd" value="groupDelete.do"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>회원등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							<form name="searchForm" id="searchForm" action="index.do" method="post">
								<div class="search">
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="name" <%=Function.getSelected(param.getStype(), "name") %>>이름</option>
										<option value="email" <%=Function.getSelected(param.getStype(), "name") %>>이메일</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />
								</div>
							</form>
							<!-- //search --> 
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