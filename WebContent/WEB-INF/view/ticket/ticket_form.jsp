<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<%@ page import="ticket1.*" %>
<%@ include file="/kcp/cfg/site_conf_inc.jsp" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
MovieVo data = (MovieVo) request.getAttribute("data");
ArrayList<Ticket1VO> movieDate = (ArrayList)request.getAttribute("movieDate");
member.MemberVO memberInfo = (member.MemberVO)session.getAttribute("memberInfo"); //로그인 세션 가져오기
%>




<div class="dialogue_top">
		<span class="title">영화 예매</span>
		<p class="close" id="dialogue_close" onclick="hideDialogue();"></p>
	</div>
	<div class="box">
		<div class="dialogueList">
			<div class="wr_box">
			<form name="popupFrm" id="popupFrm" method="post" action="/ticket/book.do">
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
							<%if(data.getRating()==19) {%>
							<img src="/img/19.png" width="30"> 
							<%}else if(data.getRating()==15) {  %>
							<img src="/img/15.png" width="30">
							<%}else if(data.getRating()==12) {  %>
							<img src="/img/12.png" width="30">
							<%}else { %>
							<img src="/img/all.png" width="30"> <%} %>
							</div>
							<div class="info_detail">
							<strong>장르</strong>&nbsp; <%=data.getGenre()%>
							</div>
						</td>
					</tr>
					<tr>
						<th>일자</th>
						<td>
							<select name="screen_date">
						<% Ticket1VO date;
							for(int i=0; i<movieDate.size();i++) {
								date = movieDate.get(i);
								%>
								<option value="<%=date.getToday()%>"><%=date.getToday()%></option>
						<%	} %>
							</select>
						</td>
					</tr>
					<tr>
						<th>시간</th>
						<td>
							<select name="screen_time" id="">
								<option value="1">09:00</option>
								<option value="2">12:00</option>
								<option value="3">15:00</option>
								<option value="4">18:00</option>
								<option value="5">21:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>인원</th>
						<td>
							<select name="tk_count" id="tk_count">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>포맷</th>
						<td>
							<input type="radio" name="format" value="1" checked><label>2D</label>
							<input type="radio" name="format" value="2"><label>3D</label>
							<input type="radio" name="format" value="3"><label>4D</label>
							<input type="radio" name="format" value="4"><label>IMAX</label>
						</td>
					</tr>
					<tr>
						<th>보유포인트</th>
						<td>
<<<<<<< HEAD

							<input type="text" name="point" id="mypoint"  value="<%=memberInfo.getPoint()%>" onkeyup="isOnlyNumber(this);"/> 점

							
							<input type="button" class="btn" value="확인">


=======
							<input type="text" name="mypoint" id="mypoint"  value="<%=memberInfo.getPoint() %>" readonly/> 점
>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git

<<<<<<< HEAD
							

=======
>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git
						</td>
					</tr>
					<tr>
						<th>사용포인트</th>
						<td>
							<input type="text" name="usePoint" id="usePoint"  value="0" onkeyup="isOnlyNumber(this); cal();"/> 점
							
						</td>
					</tr>
					<tr>
						<th>결제수단</th>
						<td>
							<input type="radio" name="pay" value="1" checked><label>무통장입금</label>
							<input type="radio" name="pay" value="2"><label>신용카드(미완성-pg사용예정)</label>
						</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td>
							<span class="totalPrice" > 원</span>
						</td>
					</tr>
					</tbody>
				</table>
			<input type="hidden" name="movie_title" id="movie_title" value="<%=data.getTitle()%>"/>
			<input type="hidden" name="price" id="price" value=""/>
			<input type="hidden" name="member_pk" id="member_pk" value="<%=memberInfo.getNo()%>" />
			<input type="hidden" name="movie_pk" id="movie_pk" value="<%=data.getNo() %>"/>
			<input type="hidden" name="title" value="<%=data.getTitle()%>"/>
			<input type="hidden" name="pay_state"  value="2"/>
			
			<!-- KCP 폼 -->
			<input type="hidden" name="pay_method" value="100000000000"/>
			<input type="hidden" name="ordr_idxx" value=""/>
			<input type="hidden" name="good_name" id="good_name" value=""/>
			<input type="hidden" name="good_mny" id="good_mny" value=""/>
			<input type="hidden" name="buyr_name" id="buyr_name" value="<%=memberInfo.getName()%>"/>
			<input type="hidden" name="buyr_mail" id="buyr_mail" value="<%=memberInfo.getEmail()%>"/>
			<input type="hidden" name="buyr_tel1" id="buyr_tel1" value="<%=memberInfo.getHp()%>"/>
			<input type="hidden" name="buyr_tel2" id="buyr_tel2" value="<%=memberInfo.getHp()%>"/>
			<input type="hidden" name="req_tx"          value="pay" />
		    <input type="hidden" name="site_cd"         value="<%= g_conf_site_cd   %>" />
		    <input type="hidden" name="site_name"       value="<%= g_conf_site_name %>" />
		    <input type="hidden" name="quotaopt"        value="12"/>
		    <input type="hidden" name="currency"        value="WON"/>
		    <input type="hidden" name="module_type"     value="<%= module_type %>"/>
		    <input type="hidden" name="res_cd"          value=""/>
		    <input type="hidden" name="res_msg"         value=""/>
		    <input type="hidden" name="enc_info"        value=""/>
		    <input type="hidden" name="enc_data"        value=""/>
		    <input type="hidden" name="ret_pay_method"  value=""/>
		    <input type="hidden" name="tran_cd"         value=""/>
		    <input type="hidden" name="use_pay_method"  value=""/>
			<input type="hidden" name="ordr_chk"        value=""/>
		    <input type="hidden" name="cash_yn"         value=""/>
		    <input type="hidden" name="cash_tr_code"    value=""/>
		    <input type="hidden" name="cash_id_info"    value=""/>
			<input type="hidden" name="good_expr" value="0">
			<!-- KCP 폼 -->
			</form>	
			</div>
			<!-- //wr_box -->
			<div class="btnSet">
				<a href="javascript:;" class="btn" onclick="jsf__pay();">예매</a>
			</div>
			<!-- //btnSet -->
		</div>
	</div>