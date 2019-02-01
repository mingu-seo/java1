<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO param = (MemberVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#email").focus();
		return false;
	}
	if ($("#pw").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#pw").focus();
		return false;
	}
	if ($("#birth").val() == "") {
		alert("생년월일 입력해주세요.");
		$("#birth").focus();
		return false;
	}
	if ($("#hp").val() == "") {
		alert("휴대폰 번호를 입력해주세요.");
		$("#hp").focus();
		return false;
	}
	// 비밀번호 유효성체크
	if(!validPassword($("#pw"))) return false;
	
	$.ajax ({
		type:'POST',
		url:"/manage/member/emailcheck.do",
		data:$("#email").serialize(),
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#emailcheck").val("1");
				$("#frm").submit();
			} else {
				alert("존재하는 이메일입니다.");
				$("#emailcheck").val("0");
				return false;
			}
		}
	});
	if ($("#emailcheck").val() == "0") {
		return false;
	}
	/*
	$.post("/manage/admin/idcheck",$("[name=frm]").serialize(), function (data, status) {
		var val = data.trim();
		if (val == "0") {
			$("#idcheck").val("1");
			r = true;
		} else {
			alert("존재하는 아이디입니다.");
			r = false;
		}
		$("#idcheck").val(data.trim());
	}).fail(function() {   
		alert('아이디체크실패');
		r = false;
	});
	*/

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
					<h2>회원관리 - [등록]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>회원 기본 정보</h3>
							<form name="frm" id="frm" action="process.do" method="post" enctype="multipart/form-data">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
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
										<th scope="row"><label for="">*회원 이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="" title="회원 이름을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*이메일</label></th>
										<td>
											<input type="text" id="email" name="email" value="" title="회원 이메일을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td>
											<input type="password" id="pw" name="pw" value="" title="회원 비밀번호를 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*생년월일</label></th>
										<td>
											<input type="text" id="birth" name="birth" value="" title="생년월일을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*성별</label></th>
										<td>
											<select id="gender" name="gender" title="성별을 선택해주세요.">
												<option value="1">남성</option>
												<option value="2">여성</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*휴대폰 번호</label></th>
										<td>
											<input type="text" id="hp" name="hp" value="" title="휴대폰 번호를 입력해주세요. 숫자만 입력해주세요." />
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write.do"/>
							<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="idcheck" id="idcheck" value="0"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>등록</strong></a>
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