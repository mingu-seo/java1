<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="movie.MovieVo" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
MovieVo param = (MovieVo)request.getAttribute("vo");
ArrayList<MovieVo> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
function groupDelete() {	
	if ( isSeleted(document.frm.no) ){
		if (confirm ('삭제하시겠습니까?')) {
			document.frm.submit();
		}
	} else {
		alert("삭제할 항목을 하나 이상 선택해 주세요.");
	}
}

function goDelete(v) {	
	if (confirm ('삭제하시겠습니까?')) {
		document.location.href = "process?pno="+v+"&cmd=delete";
	}
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
					<h2>영화관리 - [목록]</h2>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
				<div id="bread">
				<form name="searchForm" id="searchForm" action="index.do" method="get">
				<span style="float:right">
				<input type="image" src="/manage/img/btn_search.gif" class="sbtn" alt="검색" />		<br/>	
				</span>
				
				<table width="100%" border="1" cellspacing="0" cellpadding="0">
				<colgroup>
					<col class="w1" />
					<col class="w3" />
					<col class="w1" />
					<col class="w4" />
				</colgroup>
				<tbody>
				<tr>
					<th scope="row" ><label for="">
					<select name="dateType">
						<option value="releaseDate"> 개봉일 </option> 
						
						<option value="endDate" > 상영 종료일 </option>
					</select>
					</label>
					</th>
					<td>
						<input type="date" name="sdate" value="<%=param.getSdate()%>"/>~
						<input type="date" name="edate" value="<%=param.getEdate()%>"/>
					</td>
					<th scope="row"> <label for=""> 장르별 검색 </label></th>
					<td>
					<select name="sgenre">

						<option value="">전체</option>
						<option value="액션">액션</option>
						<option value="드라마">드라마</option>
						<option value="스릴러">스릴러</option>
						<option value="멜로">멜로</option>
						<option value="코믹">코믹</option>
						<option value="범죄">범죄</option>
						<option value="판타지">판타지</option>
						<option value="SF">SF</option>
						<option value="가족">가족</option>
						<option value="어린이">어린이</option>
					</select>
					</td>		
				</tr>
				<tr>
					<th scope="row" ><label for=""> 검색어</label></th>
					<td>
					
								<div class="search">
									<select name="sdisplay" onchange="$('#searchForm').submit();">
										<option value="-1" <%=Function.getSelected(param.getSdisplay(), -1)%>>전체</option>
										<option value="0" <%=Function.getSelected(param.getSdisplay(), 0)%>>노출</option>
										<option value="1" <%=Function.getSelected(param.getSdisplay(), 1)%>>숨김</option>
									</select>
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="title" <%=Function.getSelected(param.getStype(), "title") %>>영화제목</option>
										<option value="director" <%=Function.getSelected(param.getStype(), "director") %>>감독</option>
										<option value="contents" <%=Function.getSelected(param.getStype(), "contents") %>>내용</option>
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									
								</div>
							
					</td>
					<th scope="row"><label for=""> 등급별 검색</label></th>
					<td>
						<input type="radio" name="srating" value="0"/>전체&nbsp;
						<input type="radio" name="srating" value="1" <%=Function.getChecked(param.getSrating(), 1) %>/>전체관람가 &nbsp;
						<input type="radio" name="srating" value="12" <%=Function.getChecked(param.getSrating(), 12) %> />12세 관람가 &nbsp;
						<input type="radio" name="srating" value="15" <%=Function.getChecked(param.getSrating(), 15) %> />15세 관람가 &nbsp;
						<input type="radio" name="srating" value="19" <%=Function.getChecked(param.getSrating(), 19) %> />청소년 관람불가 &nbsp; 
						 &nbsp; &nbsp;	 &nbsp; &nbsp;	 &nbsp; &nbsp;
						
					</td>
				</tr>
				</tbody>
				</table>
				</form>
				</div>
				
				<div id="blist">	

							<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
							<form name="frm" id="frm" action="process.do" method="post">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w1" />
									<col class="w6" />
									<col class="w6" />
									<col class="w1" />
									<col class="w4" />
									<col class="w4" />
									<col class="w4" />
									<col class="w1" />
									
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">번호</th>
										<th scope="col">영화제목</th> 
										<th scope="col">감독</th> 
										<th scope="col">등급</th>
										<th scope="col">개봉일</th> 
										<th scope="col">상영종료일</th> 
										<th scope="col">포스터</th>
										<th scope="col" class="last">노출여부</th>
										
									</tr>
								</thead>
								<tbody>
								<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="8">등록된 DB가 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										MovieVo data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("edit.do", param, data.getNo())+"'\"";
								%>
									<tr <%=topClass%>>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=data.getNo()%>"/></td>
										<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle()%></td>
										<td <%=targetUrl%>><%=data.getDirector()%></td>
										<td <%=targetUrl%>><% if(data.getRating()==1){out.print("전체관람가");} else{ %> <%=data.getRating()%> <%} %></td>
										<td <%=targetUrl%>><%=data.getReleaseDate()%></td>
										<td <%=targetUrl%>><%=data.getEndDate()%></td>
										<td <%=targetUrl%>><img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getPoster()%>" width="100px" height="150px"></img></td>
										<td <%=targetUrl%>><% if(data.getDisplay()==0){out.print("노출");} else {out.print("숨김");}%></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
								<input type="hidden" name="cmd" id="cmd" value="groupDelete"/>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong> </a>
								</div>
								<div class="btnRight">
									<a class="wbtn" href="write.do"><strong>등록</strong> </a>
								</div>
							</div>
							<!--//btn-->
							<!-- 페이징 처리 -->
							<%=Page.indexList(param.getReqPageNo(), totPage, request)%>
							<!-- //페이징 처리 -->
							
							<!-- //search --> 
						</div>
						<!-- //blist -->
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