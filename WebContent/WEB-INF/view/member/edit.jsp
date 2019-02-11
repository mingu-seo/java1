<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="member.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>

<%
MemberVO data = (MemberVO)request.getAttribute("data");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보수정</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
<meta name="format-detection" content="telephone=no, address=no, email=no">
<meta name="keywords" content="">
<meta name="description" content="">
<title>MOVIE</title>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
<script>

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
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
	
	//비밀번호 확인 체크
	if($("#pw").val()==$("#pw_check").val()){
		
			$("#frm").submit();
		
	}else{
		alert("비밀번호를 확인해주세요.");
		$("#pw_check").focus();
		return false;
	}
	
	
}

</script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>

    <div class="sub">
		<div class="size">
			<h3 class="sub_title">회원정보 수정</h3>
			<div class="mypage_tab">
				<ul>
					<li><a href="/mypage/index.do">예매확인/취소</a></li>
					<li><a href="/member/point.do">포인트</a></li>
					<li><a href="/member/edit.do">내 정보</a></li>
				</ul>
			</div>
			<div class="mypage_tab_bottom"></div>
			<form name="frm" id="frm" action="process.do" method="post" enctype="multipart/form-data">
			<table class="board_write">
				<caption>회원정보 수정</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				
				<tbody>
			
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" id="email" class="inNextBtn" value=<%=data.getEmail()%> disabled class="wid200" style="float:left;">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw" id="pw" class="wid200" value="" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
					</tr>
					<tr>
						<th>비밀번호<span>확인</span></th>
						<td><input type="password" name="pw_check" id="pw_check" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" value=<%=data.getName() %> class="wid200" style="float:left;"> </td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
						<select name="gender" style="height:30px;"id="gender">
						<option value="1" <%if(data.getGender()==1){out.print("selected");} %>>남성</option>
						<option value="2" <%if(data.getGender()==2){out.print("selected");} %>>여성</option>
						</select> 
						</td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td>
							<input type="text" name="hp" id="hp" value=<%=data.getHp() %>  class="wid50" maxlength="15" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" style="float:left;">
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
					<input type="hidden" id="no" name="no" value="<%=data.getNo() %>"/>
					<input type="hidden" id="point" name="point" value="<%=data.getPoint() %>"/>
					<input type="hidden" name="cmd" value="edit.do"/>
					<input type="hidden" name="checkEmail" id="checkEmail" value="0"/>
			</form>
			<!-- //write--->
			<div class="btnSet clear">
				<div>
				<a class="btn" onclick="goSave();">수정</a> 
				<a href="javascript:;" class="btn" onclick="history.back();">취소</a>
				<a href="/member/secession.do" class="btn">회원탈퇴</a>
				</div>
			</div>
		</div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
