<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
			<h3 class="sub_title">회원가입</h3>

			<table class="board_write">
				<caption>회원가입</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="id" class="inNextBtn" class="wid200" style="float:left;">
							<span class="nickname_check"><a href="javascript:;" onclick="checkId();" class="btn bgGray" style="float:left; width:auto; clear:none;">중복확인</a></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password" id="password" class="wid200" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
					</tr>
					<tr>
						<th>비밀번호<span>확인</span></th>
						<td><input type="password" name="password2" id="password2" class="wid200" style="float:left;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" class="wid200" style="float:left;"> </td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="cell" id="cell" value=""  class="wid50" maxlength="15" onkeyup="isNumberOrHyphen(this);cvtPhoneNumber(this);" style="float:left;">
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" name="email" id="email" value=""  class="wid50"  style="float:left;" >
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td class="addr">
							<input type="text" name="zipcode" id="zipcode" value="" class="inNextBtn" style="float:left; margin-bottom:2px;" readonly>
							<span class="address_search"><a href="javascript:;" onclick="zipcodeapi();" class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호검색</a></span>
							<input type="text" name="addr0" id="addr0" value="" readonly style="margin-bottom:2px;clear:both;" class="wid100 clear fl_l;">
							<input type="text" name="addr1" id="addr1" value="" style="margin-bottom:2px;clear:both;" class="wid100 clear fl_l;">
						</td>
					</tr>
				</tbody>
			</table>
			<!-- //write--->
			<div class="btnSet clear">
				<div><a href="javascript:;" class="btn" onclick="goSave();">확인</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
