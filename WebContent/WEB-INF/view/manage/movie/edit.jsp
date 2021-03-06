<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="movie.*"%>
<%@ page import="util.*"%>
<%
	MovieVo param = (MovieVo) request.getAttribute("param");
	MovieVo data = (MovieVo) request.getAttribute("data");
	StillCutVo scv = (StillCutVo) request.getAttribute("scv");
	TrailerVo tv = (TrailerVo) request.getAttribute("tv");
	ActorVo av = (ActorVo) request.getAttribute("av");
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
		$("#frm").submit();
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
						<h2>영화 [수정]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm"
									action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do"
									enctype="multipart/form-data">
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
												<td><input type="text" id="title" name="title"
													value="<%=data.getTitle()%>" title="영화 제목을 입력해주세요" /></td>
												<th scope="row"><label for=""> 장르</label></th>
												<td>
													<input type="checkbox" name="genre" value="액션"
													<%=Function.getGenreChecked(data.getGenre(), "액션")%> />액션
													<input type="checkbox" name="genre" value="드라마"
													  <%=Function.getGenreChecked(data.getGenre(), "드라마")%> />드라마
													<input type="checkbox" name="genre" value="스릴러"
													  <%=Function.getGenreChecked(data.getGenre(), "스릴러")%> />스릴러
													<input type="checkbox" name="genre" value="멜로"
													 <%=Function.getGenreChecked(data.getGenre(), "멜로")%> />멜로
													<input type="checkbox" name="genre" value="코믹" 
													 <%=Function.getGenreChecked(data.getGenre(), "코믹")%> />코믹
													<input type="checkbox" name="genre" value="범죄"
													 <%=Function.getGenreChecked(data.getGenre(), "범죄")%> />범죄
													<input type="checkbox" name="genre" value="판타지"
													<%=Function.getGenreChecked(data.getGenre(), "판타지")%>/>판타지
													<input type="checkbox" name="genre" value="SF"
													<%=Function.getGenreChecked(data.getGenre(), "SF")%> />SF
													<input type="checkbox" name="genre" value="가족"
													<%=Function.getGenreChecked(data.getGenre(), "가족")%>/>가족
													<input type="checkbox" name="genre" value="어린이"
													<%=Function.getGenreChecked(data.getGenre(), "어린이")%> />어린이
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">감독</label></th>
												<td><input type="text" id="director" name="director"
													value="<%=data.getDirector()%>" /></td>
												<th scope="row"><label for="">등급</label></th>
												<td>
													<input type="radio" id="rating1" name="rating" value="1" <%if (data.getRating() == 1) { out.print("checked"); }%>/>전체관람가
													<input type="radio" id="rating2" name="rating" value="12" <%if (data.getRating() == 12) { out.print("checked"); }%> />12세 관람가 
													<input type="radio" id="rating3" name="rating" value="15" <%if (data.getRating() == 15) { out.print("checked"); }%> />15세 관람가 
													<input type="radio" id="rating4" name="rating" value="19" <%if (data.getRating() == 19) { out.print("checked"); }%> />청소년 관람불가
												</td>
											</tr>
											<tr>
											<th scope="row"><label for="">출연배우</label></th>
											<td>
												<input type="text" name="actor1"
												value="<%if(av!=null && av.getActor1()!=null) { %><%=av.getActor1()%><%} else {out.print("");} %>"></input>
												<input type="text" name="actor2"
												value="<%if(av!=null && av.getActor2()!=null) { %><%=av.getActor2()%><%} else {out.print("");} %>"></input>
												<input type="text" name="actor3"
												value="<%if(av!=null && av.getActor3()!=null) { %><%=av.getActor3()%><%} else {out.print("");} %>"></input><br/>
												<input type="text" name="actor4"
												value="<%if(av!=null && av.getActor4()!=null) { %><%=av.getActor4()%><%} else {out.print("");} %>"></input>
												<input type="text" name="actor5"
												value="<%if(av!=null && av.getActor5()!=null) { %><%=av.getActor5()%><%} else {out.print("");} %>"></input>
												<input type="text" name="actor6"
												value="<%if(av!=null && av.getActor6()!=null) { %><%=av.getActor6()%><%} else {out.print("");} %>"></input>
											</td>
											
											<th scope="row"><label for="">포맷</label></th>
											<td>
												<input type="checkbox" name="format" value="2D"
												<%=Function.getFormatChecked(data.getFormat(), "2D")%> />2D
												<input type="checkbox" name="format" value="3D"
												<%=Function.getFormatChecked(data.getFormat(), "3D")%> />3D
												<input type="checkbox" name="format" value="4D"
												<%=Function.getFormatChecked(data.getFormat(), "4D")%> />4D
												<input type="checkbox" name="format" value="IMAX"
												<%=Function.getFormatChecked(data.getFormat(), "IMAX")%> />IMAX
											</td>
											</tr>
											<tr>
												<th scope="row"><label for="">상영시간/개봉일</label></th>
												<td>
													<input type="text" name="runtime" value="<%=data.getRuntime()%>"/>분 &nbsp;&nbsp;
													<input type="date" id="releaseDate" name="releaseDate" value="<%=data.getReleaseDate()%>" title="개봉일" />
												</td>
												<th scope="row"><label for="">상영종료일</label></th>
												<td>
													<input type="date" id="endDate" name="endDate" class="w50" value="<%=data.getEndDate()%>" title="상영종료일" />
												</td>
											</tr>

											<tr>
												<td colspan="4"><textarea id="contents" name="contents"
														title="내용을 입력해주세요" style="width: 100%;"> <%=data.getContents()%></textarea></td>
											</tr>
											<tr>
												<th scope="row"><label for="">메인 포스터</label></th>
												<td><input type="file" id="poster" name="poster_tmp"
													value="<%=data.getPoster()%>" class=" w50" title="포스터" /></td>
												<th scope="row"><label for="">노출여부</label></th>
												<td>
													<input type="radio" name="display" value="0" <%if (data.getDisplay() == 0) { out.print("checked"); }%>/>노출&nbsp; 
													<input type="radio" name="display" value="1" <%if (data.getDisplay() == 1) { out.print("checked"); }%>/> 숨김
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="">스틸컷</label></th>
												<td>
													<input type="file" name="stillCut1_tmp" class="w50" title="스틸컷1"/>
													<%if (scv != null && scv.getStillCut1()!=null && !("").equals(scv.getStillCut1())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut1()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut1_chk" value="1"/>파일 삭제<% } %>
													<br/>
													<input type="file" name="stillCut2_tmp" class="w50" title="스틸컷2"/>
													<%if (scv != null && scv.getStillCut2()!=null && !("").equals(scv.getStillCut2())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut2()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut2_chk" value="1"/>파일 삭제<% } %>
													<br/>
													<input type="file" name="stillCut3_tmp" class="w50" title="스틸컷3"/>
													<%if (scv != null && scv.getStillCut3()!=null && !("").equals(scv.getStillCut3())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut3()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut3_chk" value="1"/>파일 삭제<% } %>
													<br/>
													<input type="file" name="stillCut4_tmp" class="w50" title="스틸컷4"/>
													<%if (scv != null && scv.getStillCut4()!=null && !("").equals(scv.getStillCut4())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut4()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut4_chk" value="1"/>파일 삭제<% } %>
													<br/>
													<input type="file" name="stillCut5_tmp" class="w50" title="스틸컷5"/>
													<%if (scv != null && scv.getStillCut5()!=null && !("").equals(scv.getStillCut5())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut5()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut5_chk" value="1"/>파일 삭제<% } %>
													<br/>
													<input type="file" name="stillCut6_tmp" class="w50" title="스틸컷6"/>
													<%if (scv != null && scv.getStillCut6()!=null && !("").equals(scv.getStillCut6())){%>
													<img src="<%=property.SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut6()%>" width="20px" height="30px"/>
													<input type="checkbox" name="stillCut6_chk" value="1"/>파일 삭제<% } %>
													<br/>										
												</td>
												<th scope="row"><label for="">트레일러 </label></th>
												<td>
													<input type="text" class="w50" name="trailer1"
													value="<%if(tv!=null && tv.getTrailer1()!=null) { %><%=tv.getTrailer1()%><%} else {out.print("");} %>" /><br/>
												 	<input type="text" class="w50" name="trailer2"
													value="<%if(tv!=null && tv.getTrailer2()!=null) { %><%=tv.getTrailer2()%><%} else {out.print("");} %>" /><br/>
													<input type="text" class="w50" name="trailer3"
													value="<%if(tv!=null && tv.getTrailer3()!=null) { %><%=tv.getTrailer3()%><%} else {out.print("");} %>" /><br/>
													<input type="text" class="w50" name="trailer4"
													value="<%if(tv!=null && tv.getTrailer4()!=null) { %><%=tv.getTrailer4()%><%} else {out.print("");} %>"/><br/>
													<input type="text" class="w50" name="trailer5"
													value="<%if(tv!=null && tv.getTrailer5()!=null) { %><%=tv.getTrailer5()%><%} else {out.print("");} %>" /><br/>
													<input type="text" class="w50" name="trailer6"
													value="<%if(tv!=null && tv.getTrailer6()!=null) { %><%=tv.getTrailer6()%><%} else {out.print("");} %>" />
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="cmd" value="edit" /> 
									<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>" /> 
									<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>" /> 
									<input type="hidden" name="no" id="no" value="<%=param.getNo()%>" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index.do", param, 0)%>"><strong>목록</strong></a>
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