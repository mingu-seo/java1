<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ticket1.*" %>
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
					<li><a href="">포인트</a></li>
					<li><a href="/member/edit.do">내 정보</a></li>
				</ul>
			</div>
			<div class="mypage_tab_bottom"></div>
			<div class="bbs">
				<div class="postSection">
					<ul class="postList clear">
						<li>
							<div class="postObj">
								<%for(int i=0; i<list.size(); i++){ %>
								<div class="reserveNum">
									예매번호 0013-1111-2222-3333
								</div>
								<div class="imgs">
									<img src="/img/poster1.jpg"/>
								</div>
								<div class="txt">
									<div class="title"><%=list.get(i).getMovie_title() %></div>
									<div class="detail">
										<table>
											<tr>
												<th>관람극장</th>
												<td>MOVIE 일산</td>
												<th>관림일시</th>
												<td><%=list.get(i).getScreen_date() %></td>
											</tr>
											<tr>
												<th>관림인원</th>
												<td>PRIME석 일반1</td>
												<th>매수</th>
												<td><%=list.get(i).getTk_count() %></td>
											</tr>
											<tr>
												<th>예매일자</th>
												<td><%=list.get(i).getRes_date() %></td>
												<th>총 결제금액</th>
												<td><%=list.get(i).getPrice() %></td>
											</tr>
										</table>
									</div>
									<div class="btn_area"><a href="javascript:;" class="btn" onclick="">예매취소</a></div>
								</div>
								<%} %>
							</div>
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