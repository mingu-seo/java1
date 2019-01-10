<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="movie.MovieVo"%>
<%@ page import="util.*"%>
<%
	MovieVo param = (MovieVo) request.getAttribute("vo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function() {
		oEditors = setEditor("contents"); // 에디터 셋팅
		initCal({
			id : "registDate",
			type : "day",
			today : "y",
			timeYN : "y"
		});
	});

	function goSave() {
		if ($("#title").val() == "") {
			alert('영화 제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		}
		return true;
	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->

			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>영화 [등록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm"
									action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"
									enctype="multipart/form-data" onsubmit="return goSave();">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										summary="관리자 관리 기본내용입니다.">
										<colgroup>
											<col width="15%" />
											<col width="35%" />
											<col width="15%" />
											<col width="35%" />
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="">영화제목</label></th>
												<td>
													<input type="text" id="title" name="title" class="w50" title="영화 제목을 입력해주세요" />
												</td>
												<th scope="row"><label for=""> 장르</label></th>
												<td>
													<input type="checkbox" id="title"/>액션 &nbsp;
													<input type="checkbox" id="title"/>스릴러 &nbsp;
													<input type="checkbox" id="title"/>멜로 &nbsp;
													<input type="checkbox" id="title"/>코믹 &nbsp;
													<input type="checkbox" id="title"/>범죄 &nbsp;
													<input type="checkbox" id="title"/>판타지 &nbsp;
													<input type="checkbox" id="title"/>SF &nbsp;
													<input type="checkbox" id="title"/>가족 &nbsp;
													<input type="checkbox" id="title"/>어린이 &nbsp;
												</td>
											</tr>	
											<tr>
												<th scope="row"><label for="">감독</label></th>
												<td><input type="text" id="director"
													name="director" class="w50" /></td>
												<th scope="row"><label for="">등급</label></th>
												<td>
													<input type="radio" id="rating" name="rating" value="0"/>전체관람가 &nbsp;
													<input type="radio" id="rating" name="rating" value="12"/>12세 관람가 &nbsp;
													<input type="radio" id="rating" name="rating" value="15"/>15세 관람가 &nbsp;
													<input type="radio" id="rating" name="rating" value="19"/>청소년 관람불가 &nbsp;
												</td>
											</tr>		
											<tr>
												<th scope="row"><label for="">개봉일</label></th>
												<td><input type="date" id="releaseDate"
													name="releaseDate" class="w50" title="개봉일" /></td>
												<th scope="row"><label for="">상영종료일</label></th>
												<td><input type="date" id="endDate"
													name="endDate" class="w50" title="상영종료일" /></td>
											</tr>
											
											<tr>
												<td colspan="4"><textarea id="contents" name="content"
														title="내용을 입력해주세요" style="width: 100%;"></textarea></td>
											</tr>
											<tr>
												<th scope="row"><label for="">메인 포스터</label></th>
												<td>
													<input type="file" id="poster" name="poster" class="w50" title="포스터"/>
												</td>
												<th scope="row"><label for="">노출여부</label></th>
												<td>
													<input type="radio" name="display" value="0"/> 노출&nbsp;
													<input type="radio" name="display" value="1"/> 숨김
													
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">스틸컷</label></th>
												<td>
													<input type="file" name="poster" class="w50" title="포스터"/><br/><br/>
													<input type="file" name="poster" class="w50" title="포스터"/><br/><br/>
													<input type="file" name="poster" class="w50" title="포스터"/><br/><br/>
													<input type="file" name="poster" class="w50" title="포스터"/><br/><br/>
													<input type="file" name="poster" class="w50" title="포스터"/>
												</td>
												<th scope="row"><label for="">트레일러 </label></th>
												<td>
													<input type="text" class="w50" name="trailer" value="" title="동영상 url주소를 첨부하세요"/><br/><br/>
													<input type="text" class="w50" name="trailer" value="" title="동영상 url주소를 첨부하세요"/><br/><br/>
													<input type="text" class="w50" name="trailer" value="" title="동영상 url주소를 첨부하세요"/><br/><br/>
													<input type="text" class="w50" name="trailer" value="" title="동영상 url주소를 첨부하세요"/><br/><br/>
													<input type="text" class="w50" name="trailer" value="" title="동영상 url주소를 첨부하세요"/>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="cmd" value="write" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
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