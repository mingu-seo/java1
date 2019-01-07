<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.admin.*" %>
<%@ page import="java.util.*" %>
<%
AdminVO param = (AdminVO)request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
var oEditors; // 에디터 객체 담을 곳
$(window).load(function() {
	oEditors = setEditor("memo"); // 에디터 셋팅
});

function goSave() {
	if ($("#name").val() == "") {
		alert("이름을 입력해주세요.");
		$("#name").focus();
		return false;
	}
	if ($("#id").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#id").focus();
		return false;
	}
	// 비밀번호 유효성체크
	if(!validPassword($("#password"))) return false;
	
	$.ajax ({
		type:'POST',
		url:"/manage/admin/idcheck",
		data:$("[name=frm]").serialize(),
		async:false,
		success:function(data) {
			var val = data.trim();
			if (val == "0") {
				$("#idcheck").val("1");
			} else {
				alert("존재하는 아이디입니다.");
				$("#idcheck").val("0");
				return false;
			}
		}
	});
	if ($("#idcheck").val() == "0") {
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
	oEditors.getById["memo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
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
					<h2>관리자관리 - [쓰기]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>관리자 기본 정보</h3>
							<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">*이름</label></th>
										<td>
											<input type="text" id="name" name="name" value="" title="관리자 이름을 입력해주세요." />
										</td>
										<th scope="row"><label for="">이메일</label></th>
										<td>
											<input type="text" id="email" name="email" value="" title="관리자 이메일을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*아이디</label></th>
										<td>
											<input type="text" id="id" name="id" value="" title="관리자 이름을 입력해주세요." />
										</td>
										<th scope="row"><label for="">*비밀번호</label></th>
										<td>
											<input type="password" id="password" name="password" value="" title="관리자 이메일을 입력해주세요." />
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="memo" name="memo" title="내용을 입력해주세요" style="width:100%" ></textarea>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
							<input type="hidden" name="ip" id="ip" value="<%=request.getRemoteAddr()%>"/>
							<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
							<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							<input type="hidden" name="idcheck" id="idcheck" value="0"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
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