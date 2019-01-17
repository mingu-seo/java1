<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.reply2.*" %>
<%@ page import="manage.admin.*" %>
<%@ page import="util.*" %>
<%
Reply2Vo param = (Reply2Vo)request.getAttribute("param");
Reply2Vo data = (Reply2Vo)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
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
					<h2>Q&A</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="10%" />
									<col width="10%" />
									<col width="15%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">이메일</label></th>
										<td>
											<input type="text" id="email" name="email" class="w100" value="<%=data.getEmail()%>" readonly/>
										</td>
										<th scope="row"><label for="">비밀번호</label></th>
										<td>
											<input type="password" id="password" name="password" value="<%=data.getPassword()%>" readonly />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작성자</label></th>
										<td>
											<input type="text" id="name" name="name" value="<%=data.getName()%>" readonly />	
										</td>
										<th scope="row"><label for="">유형</label>
										<td>
										<input type="radio" name="qt" value="1" /> 예매관련 Q&A
										<input type="radio" name="qt" value="2"/> 결제관련 Q&A
										</td>
										</th>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w100" value="<%=data.getTitle()%>" readonly/>	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">내용</label></th>
										<td colspan="10">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" 
											style="width:100%;" readonly ><%=data.getContents()%></textarea>	
										</td>
									</tr>
									
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit" />
							<input type="hidden" name="writer" value="<%=request.getAttribute("admin_no")%>" />   
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
									<a class="btns" href="<%=param.getTargetURLParam("edit.do", param, data.getNo())%>"><strong>수정</strong></a>
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