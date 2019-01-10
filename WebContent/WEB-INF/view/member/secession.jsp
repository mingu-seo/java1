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
		
	//이메일 체크
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
	
	//비밀번호 체크
	$.ajax ({
		type:'POST',
		url:"/manage/member/pwcheck.do",
		data:$("#pw").serialize(),
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#pwcheck").val("1");
				$("#frm").submit();
			} else {
				alert("존재하는 비밀번호입니다.");
				$("#pwcheck").val("0");
				return false;
			}
		}
	});
	if ($("#pwcheck").val() == "0") {
		return false;
	}
}
</script>
<title>회원가입</title>
</head>
<body>
	<input type="text" id="email" name="email" title="이메일을 입력해주세요."></input>
	<input type="password" id="pw" name="pw" title="비밀번호를 입력해주세요."></input>
</body>
</html>