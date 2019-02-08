<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="ticket1.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.SiteProperty" %>
<%
Ticket1VO param = (Ticket1VO)request.getAttribute("vo");
Ticket1VO data = (Ticket1VO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript">
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process.do?no=<%=data.getNo()%>&cmd=delete.do";
		} else {
			return false;
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
					<h2>예매관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="5%" />
									<col width="15%" />
									<col width="5%" />
									<col width="20%" />
									<col width="25%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
								</colgroup>
								<tbody>
									<tr>
										<th>회원명</th>
										<td><%=data.getMember_name()%></td>
									</tr>
									<tr>
										<th>예매번호</th>
										<td><%=data.getRes_num()%></td>
									</tr>
									<tr>
										<th scope="row">영화 제목</th>
										<td><%=data.getMovie_title()%></td>
									</tr>
									<tr>
										<th scope="row">포멧</th>
										<td>
										<%
										if(data.getFormat()==1){
											out.print("2D");
										}else if(data.getFormat()==2){
											out.print("3D");
										}else if(data.getFormat()==3){
											out.print("4D");
										}else{
											out.print("IMAX");
										}
										%>
										</td>
									</tr>
									<tr>
										<th scope="row">상영일</th>
										<td><%=data.getScreen_date()%></td>
									</tr>
									<tr>
										<th scope="row">상영시간</th>
										<td>
										<%if(data.getScreen_time()==1){
											out.print("09:00");
										}else if(data.getScreen_time()==2){
											out.print("12:00");
										}else if(data.getScreen_time()==3){
											out.print("15:00");
										}else if(data.getScreen_time()==4){
											out.print("18:00");
										}else{
											out.print("21:00");
										}
										%>
										</td>
									</tr>
									<tr>
										<th scope="row">결제상태</th>
										<td>
										<%if(data.getPay_state()==1){
											out.print("결제완료");
										}else{
											out.print("결제 미완료");
										}
										%>
										</td>
									</tr>
									<tr>
										<th>예매일</th>
										<td><%=data.getRes_date()%></td>
									</tr>
									<tr>
										<th scope="row">예매상태</th>
										<td>
										<%if(data.getRes_state()==1){
											out.print("예매완료");
										}else{
											out.print("예매취소");
										}
										%>
										</td>
									</tr>
									<tr>
										<th scope="row">예매취소일</th>
										<td>
										<%if(data.getCancel_date()!=null){
											out.print(data.getCancel_date());
										}
										%>
										</td>
									</tr>
									<tr>
										<th>티켓수</th>
										<td><%=data.getTk_count()%></td>
									</tr>
									<tr>
										<th>금액</th>
										<td><%=Function.getNumberFormat(data.getPrice())%>원</td>
									</tr>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="<%=param.getTargetURLParam("edit.do", param, data.getNo())%>"><strong>수정</strong></a>
									<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
								</div>
							</div>
							<!--//btn-->
						</div>
						<!-- //bread -->
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