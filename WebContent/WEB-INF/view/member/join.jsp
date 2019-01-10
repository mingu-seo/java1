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
}
</script>
<title>회원가입</title>
</head>
<body>
<h1>회원가입하고 갈래?</h1>

<div id="container">
			<div id="content">
				<div class="con_tit">
					
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							
							<form name="frm" id="frm" action="process.do" method="post">
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
							<input type="hidden" name="cmd" value="write"/>
							<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="emailcheck" id="emailcheck" value="0"/>
							</form>
							<div class="btn">
								<div class="btnRight">
									<a class="btns" href="#" onclick="goSave();"><strong>등록</strong></a>
								</div>
							</div>

</body>
</html>