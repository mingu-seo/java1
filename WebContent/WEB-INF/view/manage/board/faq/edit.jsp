<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.faq.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
FaqVO param = (FaqVO)request.getAttribute("param");
FaqVO data = (FaqVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
		var oEditors; // 에디터 객체 담을 곳
		jQuery(window).load(function(){
			oEditors = setEditor("answer"); // 에디터 셋팅
		});
	function goSave() {
	
		if ($("#question").val() == "") {
			alert('질문을 입력하세요.');
			$("#qeustion").focus();
			return false;
		}
		
		var sHTML = oEditors.getById["answer"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#answer").focus();
			return false;
		} else {
			oEditors.getById["answer"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		
		
		return true;
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
					<h2>FAQ - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								
								<tbody>
									<tr>
										<th scope="row"><label for="">종류</label></th>
										<td>
											<select name="type">
												<%=CodeUtil.getQtypeOption(data.getType())%>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*질문</label></th>
										<td colspan="10">
											<input type="text" id="question" name="question" class="w50" title="제목을 입력해주세요" value="<%=Function.checkNull(data.getQuestion())%>" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*내용</label></th>
										<td colspan="10">
											<textarea id="answer" name="answer" title="내용을 입력해주세요" style="width:100%;"><%=Function.checkNull(data.getAnswer())%></textarea>	
										</td>
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="cmd" id="cmd" value="edit"/>
								<input type="hidden" name="no" id="no" value="<%=data.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onclick="$('#frm').submit();"><strong>저장</strong></a>
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