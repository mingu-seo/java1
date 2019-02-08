<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ticket1.*" %>
<%@ page import="util.*" %>
<%@ page import="property.SiteProperty" %>
<%ArrayList<Ticket1VO> list = (ArrayList)request.getAttribute("list"); %>
<!DOCTYPE html>
<html lang="ko">
<script>
function goCancel(tno) {
	var cancel = confirm ('취소하시겠습니까?');
	if (cancel){
		document.location.href = "/ticket/cancel.do?no="+tno;
		alert("취소가 완료되었습니다.");
	} else {
		return false;
	}
}

</script>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes"> 
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>MOVIE</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">예매확인</h3>
			<div class="mypage_tab">
				<ul>
					<li><a href="">예매확인/취소</a></li>
					<li><a href="/member/point.do">포인트</a></li>
					<li><a href="/member/edit.do">내 정보</a></li>
				</ul>
			</div>
			<div class="mypage_tab_bottom"></div>
			<div class="bbs">
				<div class="postSection">
					<ul class="postList clear">
						<li>
						<%if(list.size()==0||list==null)out.print("예매내역이 존재하지 않습니다.");%>
						<%for(int i=0; i<list.size(); i++){%>
							<%Ticket1VO data = list.get(i);%> 
							<div class="postObj">
								<div class="reserveNum">
									예매번호&ensp;-&ensp;<%=data.getRes_num()%>
								</div>
								<div class="imgs">
									<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getMovie_poster()%>"/>
								</div>
								<div class="txt">
									<div class="title"><%=data.getMovie_title() %>&nbsp;
									<%if(data.getFormat()==1)out.print("2D"); %>
									<%if(data.getFormat()==2)out.print("3D"); %>
									<%if(data.getFormat()==3)out.print("4D"); %>
									<%if(data.getFormat()==4)out.print("IMAX"); %>
									</div>
									<div class="detail">
										<table>
											<tr>
												<th>관람극장</th>
												<td>GIGABOX 일산점</td>
												<th>관림일시</th>
												<td><%=data.getScreen_date() %>&emsp;
												<%if(data.getScreen_time()==1){
												out.print("09:00");	
												}else if(data.getScreen_time()==2){
													out.print("12:00");	
												}else if(data.getScreen_time()==3){
													out.print("15:00");	
												}else if(data.getScreen_time()==4){
													out.print("18:00");	
												}else if(data.getScreen_time()==5){
													out.print("21:00");	
												}	
												%>
												</td>
											</tr>
											<tr>
												<th>매수</th>
												<td><%=data.getTk_count() %></td>
												<th>예매일자</th>
												<td><%=DateUtil.getDateTimeFormat(data.getRes_date()) %></td>
											</tr>
											<tr>
												<th>총 결제금액</th>
												<td><%=data.getPrice()%>원</td>
												<th>예매 상태</th>
												<td>
												
												<%if(data.getRes_state()==1){ 
													out.print("예매완료");
												}else if(data.getRes_state()==2){ 
													out.print("예매취소");
												}%>
												</td>
											</tr>
										</table>
									</div>
									<%if(data.getRes_state()==1 && DateUtil.getDiff(data.getScreen_date(), DateUtil.getToday())>=1){ %>
									<div class="btn_area"><a href="#" class="btn" onclick="goCancel(<%=data.getNo()%>)">예매취소</a></div>
									<% }%>
								</div>
							</div>
							<%} %>
						</li>
					</ul>
				</div>
				
				<div class="pagenate clear">
					<ul class='paging'>
						<li><a href='javascript:;' class='current'>1</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
<script>
<% if ("success".equals(request.getParameter("reserve"))) { %>
$(function() {
	showReserveDialogue();
})
<% } %>

function showReserveDialogue() {
	var maskHeight = $(document).height(); 
	var maskWidth = $(window).width();

	$('#mask').css({'width':maskWidth,'height':maskHeight}); 
	$('#mask').fadeTo("fast",0.8);

	var t_dialog = $("#reserve_dialogue");
	t_dialog.css({
		'position': 'fixed',
		'left': '50%',
		'top': '50%'
		});
	t_dialog.css({
		'margin-left': -t_dialog.outerWidth() / 2 + 'px',
		'margin-top': -t_dialog.outerHeight() / 2 + 'px'
	});
	t_dialog.show();
}

function hideDialogue() {
	$("#reserve_dialogue").hide();
	$("#mask").hide();
}
</script>
<div id="reserve_dialogue" class="dialogue_wr popupContent">
	<div class="dialogue_top" style="text-align:center;">
		<span class="title">영화 예매 완료</span>
		<p class="close" id="dialogue_close" onclick="hideDialogue();"></p>
	</div>
	<div class="box">
		<div class="dialogueList">
			<div class="wr_box">
				어쩌고 저쩌고
			</div>
			<!-- //wr_box -->
		</div>
	</div>
</div>     
</body>
</html>