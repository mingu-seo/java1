<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="board.reply2.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
NoticeVO param = (NoticeVO)request.getAttribute("param");
NoticeVO data = (NoticeVO)request.getAttribute("data");
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
		
		// 달력
		initCal({id:"cre_date",type:"day",today:"y",timeYN:"y"});
	});
	
	function goSave() {
		var regex=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 
			var regex2=/[0-9]{4}[\-][0-1][0-9][\-][0-3][0-9]\s[0-2][0-9]:[0-6][0-9]:[0-6][0-9]$/i; 
			if(!regex2.test($("#cre_date").val())){
				alert('잘못된 날짜 형식입니다.\\n올바로 입력해 주세요.\\n ex)2013-02-14 03:28:85.0');
				$("#cre_date").focus();
				return false;
			} 
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
					<h2>공지사항 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="process.do" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="10%" />
									<col width="15%" />
									<col width="10%" />
									<col width="15%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">종류</label></th>
										<td>
											<select name="type">
												<%=CodeUtil.getTypeOption(data.getType())%>
											</select>
										</td>
										<th scope="row"><label for="">상태</label></th>
										<td>
											<select name="display">
												<%=CodeUtil.getDisplayOption(data.getDisplay())%>
											</select>
										</td>
										<th scope="row"><label for="">등록일</label></th>
										<td>
											<input type="text" id="cre_date" name="cre_date" class="inputTitle" value="<%=DateUtil.getDateTimeFormat(data.getCre_date())%>" title="등록일을 입력해주세요"/>&nbsp;
											<span id="CalregistdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalregistdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="10">
											<% if (data.getFilename() == null || "".equals(data.getFilename())) { %>
											<input type="file" name="filename_tmp" id="filename_tmp" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.NOTICE_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFilename_org(), "UTF-8"), data.getFilename()) %>" target="_blank"><%= Function.checkNull(data.getFilename_org()) %> [<%= Function.getFileSize(data.getFilesize())%>]</a><br />
														<input type="checkbox" id="filename_chk" name="filename_chk" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="file_name_chk">기존파일삭제</label>
													</p>
													<input type="file" name="filename_tmp" id="filename_tmp" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>											
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="10">
											<input type="text" id="title" name="title" class="w50" title="제목을 입력해주세요" value="<%=Function.checkNull(data.getTitle())%>" />	
										</td>
									</tr>
									<tr>
										<td colspan="10">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"><%=Function.checkNull(data.getContents())%></textarea>	
										</td>
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="cmd" id="cmd" value="edit"/>
								<input type="hidden" name="no" id="no" value="<%=data.getNo()%>"/>
								<input type="hidden" name="writer" value="<%=request.getAttribute("admin_no")%>" />
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