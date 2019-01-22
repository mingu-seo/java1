<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="board.reply3.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReplyVO3 param = (ReplyVO3)request.getAttribute("vo");
%>
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
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({id:"cre_date",type:"day",today:"y",timeYN:"y"});
	});
	
	function goSave() {
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		$("#frm").submit();
	}
	
	
</script>
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
   <div class="sub">
		<div class="size">
			<h3 class="sub_title">Q&A</h3>

			<div class="bbs">
			<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/sprocess.do" enctype="multipart/form-data" >
				<table class="write">
					<tbody>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" id="title" value=""/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea name="contents" id="contents"></textarea>
						</td>
					</tr>
					</tbody>
				</table>
				<input type="hidden" name="cmd" value="write" />
				<div class="btnSet"  style="text-align:right;">
					<a class="btn" href="javascript:goSave();">저장 </a>
				</div>
				</form>
			</div>
		</div>
    </div>
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
