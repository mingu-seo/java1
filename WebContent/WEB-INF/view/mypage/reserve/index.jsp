<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ticket1.*" %>
<%@ page import="util.*" %>
<%@ page import="property.SiteProperty" %>
<%ArrayList<Ticket1VO> list = (ArrayList)request.getAttribute("list"); %>
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
						<%for(int i=0; i<list.size(); i++){ %>
							<div class="postObj">
								<div class="reserveNum">
									예매번호&ensp;-&ensp;<%=list.get(i).getRes_num()%>
								</div>
								<div class="imgs">
									<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=list.get(i).getMovie_poster()%>"/>
								</div>
								<div class="txt">
									<div class="title"><%=list.get(i).getMovie_title() %></div>
									<div class="detail">
										<table>
											<tr>
												<th>관람극장</th>
												<td>GIGABOX 일산점</td>
												<th>관림일시</th>
												<td><%=list.get(i).getScreen_date() %>&emsp;
												<%if(list.get(i).getScreen_time()==1){
												out.print("09:00");	
												}else if(list.get(i).getScreen_time()==2){
													out.print("12:00");	
												}else if(list.get(i).getScreen_time()==3){
													out.print("15:00");	
												}else if(list.get(i).getScreen_time()==4){
													out.print("18:00");	
												}else if(list.get(i).getScreen_time()==5){
													out.print("21:00");	
												}	
												%>
												</td>
											</tr>
											<tr>
												<th>매수</th>
												<td><%=list.get(i).getTk_count() %></td>
												<th>예매일자</th>
												<td><%=DateUtil.getDateTimeFormat(list.get(i).getRes_date()) %></td>
											</tr>
											<tr>
												<th>총 결제금액</th>
												<td><%=Function.getNumberFormat(Integer.parseInt(list.get(i).getPrice())) %>원</td>
												<th>예매 상태</th>
												<td>
												<%if(list.get(i).getRes_state()==1){ 
													out.print("예매완료");
												}else if(list.get(i).getRes_state()==2){ 
													out.print("예매취소");
												}%>
												</td>
											</tr>
										</table>
									</div>
									<%if(list.get(i).getRes_state()!=2){ %>
									<div class="btn_area"><a href="javascript:;" class="btn" onclick="">예매취소</a></div>
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
     
</body>
</html>