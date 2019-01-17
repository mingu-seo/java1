<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.ArrayList"%>
<script>

function OpenWinCount(URL,width,height) {

	var str,width,height;
	str="'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no,";
	str=str+"width="+width;
	str=str+",height="+height+"',top=100,left=100";

	window.open(URL,'remote',str);
}

$(window).load(function(){
	// 1depth 메뉴들
	var parent = $(".parent");
	
	//현재 주소
	// 주소중 manage이후 폴더 경로 자르기 ex) /manage/board/index.jsp -> board
	var curUrl = document.location.pathname;
	curUrl = curUrl.substring(curUrl.indexOf("manage")+12,curUrl.length);
	if (curUrl.indexOf("/") > 0) {
		curUrl = curUrl.substring(curUrl,curUrl.indexOf("/"));
	}
	parent.each(function(){
		$(this).find("span").removeClass("bg");

		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		// 주소중 manage이후 폴더 경로 자르기 ex) /manage/board/index.jsp -> board
		href = href.substring(href.indexOf("manage")+7,href.length);
		href = href.substring(href,href.indexOf("/"));
		
		// 현재 주소에서 href가 포함 되어 있으면 그 메뉴에 배경색 지정
		if(curUrl == href){
			$(this).find("span").addClass("bg");
		}
	});
	
	// 방문자 통계 클릭시 메뉴 유지
	parent.click(function(){
		// 1depth 메뉴 href 담기
		href = $(this)[0].href;
		
		if(href.indexOf("OpenWinCount") >= 0){
			parent.find("span").removeClass("bg");
			$(this).find("span").addClass("bg");
		}
	});
	
	// 메뉴 수에 맞게 width 값 수정.
	$("ul.menu > li").css("width", (100 / $("ul.menu > li").length) + "%");
});
</script>
<div id="header">
	<div class="header_inner">
		<h1><%=property.SiteProperty.COMPANY_NAME%><span><a href="#" onclick="window.open('<%=property.SiteProperty.COMPANY_URL%>');"> <%=property.SiteProperty.COMPANY_URL%> </a></span></h1>
		<p class="login_name"></p>
		<!-- util : s -->
		<div class="util">
			<ul>
				<li class="frist"><a href="#" onclick="window.open('<%=property.SiteProperty.COMPANY_URL%>');">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/manage/logout">LogOut</a></li>
			</ul>
		</div>
		<!-- util : e --> 
		
		<div id="menu">
  			<ul class="menu">
  				<li><a href="<%=request.getContextPath()%>/manage/member/index.do" class="parent"><span>회원관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/movie/index.do" class="parent"><span>영화관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/" class="parent"><span>예매관리</span></a></li>
				<li><a href="<%=request.getContextPath()%>/manage/board/notice/index.do" class="parent"><span>고객지원</span></a>
					<div class="standard_left">
					<ul>
						<li><a href="<%=request.getContextPath()%>/manage/board/notice/index.do"><span>공지사항</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/qna/index.do"><span>Q&A</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/qna1/index.do"><span>Q&A(상윤)</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/qna2/index.do"><span>Q&A(아란)</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/qna3/index.do"><span>Q&A(나영)</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/movie/review/index.do"><span>영화후기</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/event/index.do"><span>이벤트</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/"><span>Q&A게시판</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/board/faq/index.do"><span>FAQ분류관리</span></a></li>
						
					</ul>
					</div>
				</li>
				<li><a href="<%=request.getContextPath()%>/manage/admin/index" class="parent"><span>관리자관리</span></a>
					<div>
					<ul>
						<li><a href="<%=request.getContextPath()%>/manage/admin/index"><span>관리자관리</span></a></li>
						<li><a href="<%=request.getContextPath()%>/manage/admin/loginHistory"><span>관리자접속기록</span></a></li>
					</ul>
					</div>
				</li>
			</ul>
		</div>
		<!--//gnb-->
	</div>
	<!-- //header_inner -->
</div>
<!-- //header -->