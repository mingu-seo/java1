<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="ticket1.*" %>
<%@ page import="util.*" %>
<%@ page import="property.SiteProperty" %>
<%

ArrayList<PointVo> pv = (ArrayList)request.getAttribute("list");
int point = (Integer)request.getAttribute("point");
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
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    <div class="sub">
		<div class="size">
		
			<h3 class="sub_title">포인트 (사용 가능 : <%=Function.getNumberFormat(point)%>)</h3>
			
			<div class="mypage_tab">
				<ul>
					<li><a href="/mypage/index.do">예매확인/취소</a></li>
					<li><a href="/member/point.do">포인트</a></li>
					<li><a href="/member/edit.do">내 정보</a></li>
				</ul>
			</div>
			<div class="mypage_tab_bottom"></div>
			<div class="bbs">
			
				<table class="list">
				
					<colgroup>
						<col width="50px" />
						<col width="50px" />
						
						<col width="50px" />
					</colgroup>
					<thead>
						<tr>
							<th>구매 구분</th>
							<th>적립일</th>
							<th>포인트</th>
						</tr>
					</thead>
					<tbody>
					
					<%if(pv.size()==0 || pv==null) {%>
						<tr>
						<td class="first" colspan="8"> 포인트 적립/사용 내역이 없습니다. </td>
						</tr>
					<% } else {
						for(int i=0; i<pv.size(); i++){ 
						%>
								
						<tr>
						<td><%=pv.get(i).getMemo() %></td>
						<td> <%=DateUtil.getDateFormat(pv.get(i).getPointRegistDate()) %> </td>
						<td> <%=Function.getNumberFormat(pv.get(i).getUsePoint()) %> </td>
						</tr>
					<%}%>
					<%}%>
					</tbody>
				</table>
				
					
				</div>
			</div>
		</div>
    
    
    
    
		
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>