<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<script>
function checkEmail(){
	if($("#newEmail").val()==""){
		alert("이메일을 입력해주세요.");
	}else if($("#newEmail").val()!=""){
		$.ajax ({
			type:'POST',
			url:"/manage/member/emailcheck.do",
			data:$("#newEmail").serialize(),
			async:false,
			success:function(data) {
				var val = data.trim();
				if (val == "0") {
					alert("사용 가능한 이메일입니다.")
					$("#checkEmail").val("1");
				} else {
					alert("존재하는 이메일입니다.");
					$("#checkEmail").val("0");
					return false;
				}
				
			}
		});
		if ($("#checkEmail").val() == "0"){
			return false;
		}
	}
}
function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#newEmail").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#newEmail").focus();
		return false;
	}
	if ($("#newPw").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#newPw").focus();
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
	if(!validPassword($("#newPw"))) return false;
	
	
	if($("#checkEmail").val()==1){
		$("#frm").submit();
	}
}
</script>
<title>MOVIE</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">회원가입</h3>
			<form name="frm" id="frm" action="process.do" method="post">
			<table class="board_write">
				<caption>회원가입</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="newEmail" id="newEmail" class="inNextBtn" class="wid200" style="float:left;">
							<span class="email_check"><a href="javascript:;" onclick="checkEmail();" class="btn bgGray" style="float:left; width:auto; clear:none;">중복확인</a></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="newPw" id="newPw" class="wid200" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
					</tr>
					<tr>
						<th>비밀번호<span>확인</span></th>
						<td><input type="password" name="pw_check" id="pw_check" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" class="wid200" style="float:left;"> </td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<select name="gender" id="gender">
						<option value="1">남성</option>
						<option value="2">여성</option>
						</select> 
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" name="birth" id="birth" class="wid200" style="float:left;"> </td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td>
							<input type="text" name="hp" id="hp" value=""  class="wid50" maxlength="15" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" style="float:left;">
						</td>
					</tr>
				</tbody>
			</table>
					<input type="hidden" name="cmd" value="write.do"/>
					<input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
			</form>
			<!-- //write--->
			<div class="btnSet clear">
				<div><a href="javascript:;" class="btn" onclick="goSave();">가입</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
