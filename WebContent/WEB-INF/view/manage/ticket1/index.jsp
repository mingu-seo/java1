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
		
	function goSearch() {
		$("#searchForm").submit();
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
						<div id="bread">
						<form name="searchForm" id="searchForm" action="index.do" method="get">
							<span style="float:right">
							<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색"/><br/>	
							</span>
							
							<table width="100%" border="1" cellspacing="0" cellpadding="0">
								<colgroup>
									<col class="w2" />
									<col class="w4" />
									<col class="w2" />
									<col class="w4" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" >상영일/예매일/예매취소일</th>
										<td>
											<select name="dateType">
												<option value="all">전체 </option> 
												<option value="screen_date">상영일 </option> 
												<option value="res_date" > 예매일</option>
												<option value="cancel_date">예매취소일</option>
											</select>
											<input type="date" name="sdate" value="<%=param.getSdate()%>"/>~
											<input type="date" name="edate" value="<%=param.getEdate()%>"/>
										</td>
										<th><label for=""></label>예매상태</th>
										<td>
											<select name="sres_state" onchange="$('#searchForm').submit();">
												<option value="0" <%=Function.getSelected(param.getSres_state(), 0) %>>전체</option>
												<option value="1" <%=Function.getSelected(param.getSres_state(), 1)%>>예매완료</option>
												<option value="2" <%=Function.getSelected(param.getSres_state(), 2)%>>예매취소</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>결제상태</th>
										<td>
											<select name="spay_state" onchange="$('#searchForm').submit();">
												<option value="0" <%=Function.getSelected(param.getSpay_state(), 0) %>>전체</option>
												<option value="1" <%=Function.getSelected(param.getSpay_state(), 1)%>>결제완료</option>
												<option value="2" <%=Function.getSelected(param.getSpay_state(), 2)%>>결제미완료</option>
											</select>
										</td>
										<th>결제수단</th>
										<td>
											<select name="spay" onchange="$('#searchForm').submit();">
												<option value="0" <%=Function.getSelected(param.getSpay(), 0) %>>전체</option>
												<option value="1" <%=Function.getSelected(param.getSpay(), 1)%>>무통장입금</option>
												<option value="2" <%=Function.getSelected(param.getSpay(), 2)%>>카드결제</option>
											</select>
										</td>
									</tr>
									<tr>
									<th>회원명/영화제목</th>
										<td>
											<select name="stype" title="검색을 선택해주세요">
												<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
												<option value="member_name" <%=Function.getSelected(param.getStype(), "member_name") %>>회원명</option>
												<option value="movie_title" <%=Function.getSelected(param.getStype(), "movie_title") %>>영화제목</option>
											</select>
											<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
										</td>
										
									</tr>
									
								</tbody>
							</table>
						
						</form>
						</div>
						<div id="blist">
							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w3" />
									<col class="w5" />
									<col class="w7" />
									<col class="w5" />
									<col class="w7" />
									<col class="w7" />
									<col class="w10" />
									<col class="w10" />
									<col class="w3" />
									<col class="w3" />
									<col class="w3" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">회원명</th>
										<th scope="col">영화 제목</th>
										<th scope="col">포멧</th>
										<th scope="col">상영일</th>
										<th scope="col">상영시간</th>
										<th scope="col">예매일</th>
										<th scope="col">예매취소일</th>
										<th scope="col">예매 상태</th>
										<th scope="col">결제수단</th>
										<th scope="col">결제상태</th>
									</tr>
								</thead>
								<tbody>
								<% if (TicketList.size() == 0) { %>
									<tr>
										<td class="first" colspan="12">등록된 예매내역이 없습니다.</td>
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
										<td <%=targetUrl%>><%=data.getMember_name()%></td>
										<td <%=targetUrl%>><%=data.getMovie_title()%></td>
										<td <%=targetUrl%>>
										<%if(data.getFormat()==1){out.print("2D");%>
										<%}else if(data.getFormat()==2){out.print("3D");%>
										<%}else if(data.getFormat()==3){out.print("4D");%>
										<%}else if(data.getFormat()==4){out.print("IMAX");}%>
										</td>
										<td <%=targetUrl%>><%=data.getScreen_date()%></td>
										<td <%=targetUrl%>><%=data.getScreen_time()%></td>
										<td <%=targetUrl%>><%=data.getRes_date()%></td>
										<td <%=targetUrl%>><%=data.getCancel_date()%></td>
										<td <%=targetUrl%>><%=data.getRes_state()%></td>
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
									<a class="wbtn" href="write.do"><strong>예매등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
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