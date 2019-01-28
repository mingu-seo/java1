<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
MovieVo data = (MovieVo) request.getAttribute("data");
%>
<div class="dialogue_top">
		<span class="title">영화 예매</span>
		<p class="close" id="dialogue_close" onclick="hideDialogue();"></p>
	</div>
	<div class="box">
		<div class="dialogueList">
			<div class="wr_box">
			<form name="popupFrm" id="popupFrm">
				<table>
					<colgroup>
						<col width="20%">
						<col width="*">
					</colgroup>
					<tbody>
					<tr>
						<td>
							<img class="poster_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getPoster()%>"/>
						</td>
						<td>
							<div class="title">
							<%=data.getTitle() %>
							</div>
							<div class="contents">
							어쩌고 저쩌고, 이러전 저런 기타 등등.....
							</div>
						</td>
					</tr>
					<tr>
						<th>일자</th>
						<td>
							<select name="">
								<option value="2018-02-01">2018-02-01</option>
								<option value="2018-02-02">2018-02-02</option>
								<option value="2018-02-03">2018-02-03</option>
								<option value="2018-02-04">2018-02-04</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>시간</th>
						<td>
							<select name="" id="">
								<option value="">10:30</option>
								<option value="">11:00</option>
								<option value="">11:30</option>
								<option value="">12:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>인원</th>
						<td>
							<select name="" id="">
								<option value="">1</option>
								<option value="">2</option>
								<option value="">3</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>포맷</th>
						<td>
							<input type="radio" value=""><label>2D</label>
							<input type="radio" value=""><label>IMAX</label>
							<input type="radio" value=""><label>3D</label>
							<input type="radio" value=""><label>4D</label>
						</td>
					</tr>
					<tr>
						<th>보유포인트</th>
						<td>
							<input type="text" name="" id=""  value=""/> 점
							<input type="button" class="btn" value="확인">
						</td>
					</tr>
					<tr>
						<th>사용포인트</th>
						<td>
							<input type="text" name="" id=""  value=""/> 점
							<input type="button" class="btn" value="사용">
						</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>
							<input type="radio" value=""><label>무통장입금</label>
							<input type="radio" value=""><label>신용카드</label>
						</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>
							<span class="totalPrice">20,000원</span>
						</td>
					</tr>
					</tbody>
				</table>
			</form>	
			</div>
			<!-- //wr_box -->
			<div class="btnSet">
				<a href="javascript:;" class="btn" onclick="goUpdate();">예매</a>
			</div>
			<!-- //btnSet -->
		</div>
	</div>