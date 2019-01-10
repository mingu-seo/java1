<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="member.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
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
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
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
					<h2>회원관리 - [상세]</h2>
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
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">이름</label></th>
										<td><%=data.getName()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">생년월일</label></th>
										<td><%=data.getBirth()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">성별</label></th>
										<td>
										<%
										if(data.getGender()==1){
											out.print("남성");
										}else if(data.getGender()==2){
											out.print("여성");
										}
										%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td><%=data.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">휴대폰 번호</label></th>
										<td><%=data.getHp()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">포인트</label></th>
										<td><%=data.getPoint()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">가입일</label></th>
										<td><%=data.getCredate()%></td>
									</tr>
									<tr>
										<th scope="row"><label for="">암호변경일</label></th>
										<td><%=data.getModdate()%></td>
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