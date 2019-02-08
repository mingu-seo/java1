<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="ticket1.*" %>
<%@ page import="movie.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.SiteProperty" %>
<%
Ticket1VO param = (Ticket1VO)request.getAttribute("vo");
Ticket1VO data = (Ticket1VO)request.getAttribute("data");
MovieVo mparam = (MovieVo) request.getAttribute("mdata");
ArrayList<MovieVo> list = (ArrayList)request.getAttribute("scrDate");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>

function goSave() {
	
	$("#frm").submit();
}

$(function(){
	$("#tk_count").change(function() {
		cal();
	});
	$("#format").change(function(){
		cal();
	});
})



function cal() {
	var tkcount = $("#tk_count").val();
	var format = $("#format").val();
	
	var formatPrice = 0;
	if (format == "1") {
		formatPrice = 10000;
	} else if (format == "2") {
		formatPrice = 12000;
	} else if (format == "3") {
		formatPrice = 14000;
	} else if (format == "4") {
		formatPrice = 16000;
	}
	
	var totalPrice = formatPrice * tkcount;
	$(".totalPrice").html(numberWithCommas(totalPrice)+"원");
	$("#price").val(totalPrice);
	
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
					<h2>예매관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>예매 정보</h3>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="회언 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
									<col width="35%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">회원명</th>
										<td>
											<%=data.getMember_name()%>
										</td>
									</tr>
									<tr>
										<th scope="row">영화제목</th>
										<td>
											<%=data.getMovie_title()%>
										</td>
									</tr>
									<tr>
										<th scope="row">포멧</th>
										<td>
											<select id="format" name="format">
											<%
											String format = mparam.getFormat();
											
											String[] formatArr = format.split(",");
												
											
											for(int i=0; i<formatArr.length; i++){
												out.println("<option value='"+(i+1)+"' "+Function.getSelected(formatArr[i], CodeUtil.getFormatName(data.getFormat()))+"> "+formatArr[i]+"</option>");
											}
											%>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row">상영일</th>
										<td>
											<select id="screen_date" name="screen_date">
											<%
											for (int i =0; i<list.size(); i++) {
											%>
												<option value="<%=list.get(i).getToday()%>" <%=Function.getSelected(list.get(i).getToday(), data.getScreen_date()) %>><%=list.get(i).getToday()%></option>
											<%
											}
											%>
											</select>
										</td>
									</tr>
									<tr>
										<th>상영시간</th>
										<td>
											<select id="screen_time" name="screen_time">
												<option value="1" <%if(data.getScreen_time()==1){out.print("selected");} %>>09:00</option>
												<option value="2" <%if(data.getScreen_time()==2){out.print("selected");} %>>12:00</option>
												<option value="3" <%if(data.getScreen_time()==3){out.print("selected");} %>>15:00</option>
												<option value="4" <%if(data.getScreen_time()==4){out.print("selected");} %>>18:00</option>
												<option value="5" <%if(data.getScreen_time()==5){out.print("selected");} %>>21:00</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>결제상태</th>
										<td>
											<select id="pay_state" name="pay_state">
												<option value="1" <%if(data.getPay_state()==1){out.print("selected");} %>>결제완료</option>
												<option value="2" <%if(data.getPay_state()==2){out.print("selected");} %>>결제 미완료</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>예매상태</th>
										<td>
											<select id="res_state" name="res_state">
												<option value="1" <%if(data.getRes_state()==1){out.print("selected");} %>>예매 완료</option>
												<option value="2" <%if(data.getRes_state()==2){out.print("selected");} %>>예매 취소</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>티켓수</th>
										<td>
											<select id="tk_count" name="tk_count">
												<option value="1" <%if(data.getTk_count()==1){out.print("selected");} %>>1</option>
												<option value="2" <%if(data.getTk_count()==2){out.print("selected");} %>>2</option>
												<option value="3" <%if(data.getTk_count()==3){out.print("selected");} %>>3</option>
												<option value="4" <%if(data.getTk_count()==4){out.print("selected");} %>>4</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>금액</th>
										<td>
											<span class="totalPrice"><%=data.getPrice()%> 원</span>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit.do">
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=param.getNo()%>"/>
							<input type="hidden" name="price" id="price" value="<%=data.getPrice()%>"/>
							<input type="hidden" name="title" id="title" value="<%=data.getMovie_title()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>수정</strong></a>
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