<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.SiteProperty" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
MemberVO data = (MemberVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>

function goSave() {
	// 비밀번호 유효성체크
	if(!validPassword($("#pw"))) return false;
	
	$("#frm").submit();
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
					<h2>회원 정보관리 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>회원 기본 정보</h3>
							<form name="frm" id="frm" action="process.do" method="post" enctype="multipart/form-data">
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
										<th scope="row"><label for="">*이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="<%=data.getName()%>" title="회원 이름을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*성별</label></th>
										<td>
											<select id="gender" name="gender" title="성별을 선택해주세요.">
												<option value="1" <%if(data.getGender()==1){out.print("selected");}%>>남성</option>
												<option value="2" <%if(data.getGender()==2){out.print("selected");}%>>여성</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*이메일</label></th>
										<td>
											<input type="text" id="email" name="email" value="<%=Function.checkNull(data.getEmail())%>" disabled title="변경할 이메일을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td>
											<input type="password" id="pw" name="pw" value="<%=data.getPw()%>" title="회원 비밀번호를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*휴대폰번호</label></th>
										<td>
											<input type="text" id="hp" name="hp" value="<%=data.getHp()%>" title="변경할 휴대폰 번호를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">포인트</label></th>
										<td>
											<input type="text" id="point" name="point" value="<%=data.getPoint()%>" title="포인트를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th>프로필</th>
											<td>
												<% if (data.getFilename() != null && !"".equals(data.getFilename())) { %>
												<p>
													<img src="<%=SiteProperty.MEMBER_UPLOAD_PATH%><%=data.getFilename()%>"  width="100px" height="150px"></img>
													<input type="checkbox" id="filename_chk" name="filename_chk" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
													<label for="file_name_chk">기존파일삭제</label>
												</p>
												<%}%>
													<input type="file" name="filename_tmp" id="filename_tmp" title="첨부파일"/>
											</td>
										</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit.do">
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="no" id="no" value="<%=param.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>저장</strong></a>
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