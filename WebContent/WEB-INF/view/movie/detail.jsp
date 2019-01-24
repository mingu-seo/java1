<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<%@ page import="member.*" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
MovieVo data = (MovieVo) request.getAttribute("data");
StillCutVo scv = (StillCutVo) request.getAttribute("scv");
TrailerVo tv = (TrailerVo) request.getAttribute("tv"); 
ActorVo av = (ActorVo) request.getAttribute("av");

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
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
     <div class="sub">
		<div class="size">
			<h3 class="sub_title">영화 정보</h3>
			<div class="bbs">
				<div class="movie">
					<div class="info">
						<div class="movie_img">
							<img src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=data.getPoster()%>" />
						</div>
						<div class="movie_info">
							<dl>
								<dt class="title">
									<%=data.getTitle()%> 
									<%if(data.getRating()==19) {%>
									<img src="/img/19.png" width="30"> 
									<%}else if(data.getRating()==15) {  %>
									<img src="/img/15.png" width="30">
									<%}else if(data.getRating()==12) {  %>
									<img src="/img/12.png" width="30">
									<%}else { %>
									<img src="/img/all.png" width="30"> <%} %>
								</dt>
								<dt class="info_detail">
									<strong>예매율</strong>&nbsp; 50%
								</dt>
								<dt class="info_detail">
									<strong>감독</strong>&nbsp; <%=data.getDirector()%>
								</dt>
								<dt class="info_detail">
									<strong>배우</strong>&nbsp; 
									<%if(av !=null && av.getActor1()!=null){ %><%=av.getActor1()%><%}  %>&nbsp; 
									<%if(av !=null && av.getActor2()!=null){ %><%=av.getActor2()%><%} %>&nbsp; 
									<%if(av !=null && av.getActor3()!=null){ %><%=av.getActor3()%><%} %>&nbsp; 
									<%if(av !=null && av.getActor4()!=null){ %><%=av.getActor4()%><%} %>&nbsp; 
									<%if(av !=null && av.getActor5()!=null){ %><%=av.getActor5()%><%} %>&nbsp;  
									<%if(av !=null && av.getActor6()!=null){ %><%=av.getActor6()%><%} %>&nbsp; 
								</dt>
								<dt class="info_detail">
									<strong>장르</strong>&nbsp; <%=data.getGenre()%>
								</dt>
								<dt class="info_detail">
									<strong>상영시간</strong>&nbsp; <%=data.getRuntime()%>분
								</dt>
								<dt class="info_detail">
									<strong>포맷</strong>&nbsp; <%=data.getFormat() %>
								<dt class="info_detail">
									<strong>개봉일</strong>&nbsp; <%=data.getReleaseDate()%>
								</dt>
								<dt class="synop">
									<strong>시놉시스</strong> <br/>
									<div class="synop_contents">
										<%=data.getContents() %>
									</div>
								</dt>
								<dt class="reser_btn">
									<input type="button" class="btn" value="예매"/>
								</dt>
							</dl>
						</div>
					</div>
					<h5 class="movie_title"><strong>스틸컷</strong></h5>
					<div class="stillcut_area">
							<div class="swiper_stillcut swiper-container">
				                <div class="swiper-wrapper">
				                
				                    <%if(scv.getStillCut1()!=null && scv.getStillCut1()!="") { %>
				                    <div class="swiper-slide" >
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut1()%>"/>
				                    </div>
				                    <%} %>
				                    <%if(scv.getStillCut2()!=null && scv.getStillCut2()!="") { %>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut2()%>"/>
				                    </div>
				                    <%} %>
				                    <%if(scv.getStillCut3()!=null && scv.getStillCut3()!="") { %>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut3()%>"/>
				                    </div>
				                    <%} %>
				                    <%if(scv.getStillCut4()!=null && scv.getStillCut4()!="") { %>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut4()%>"/>
				                    </div>
				                    <%} %>
				                    <%if(scv.getStillCut5()!=null && scv.getStillCut5()!="") { %>
				                    <div class="swiper-slide" >
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut5()%>"/>
				                    </div>
				                    <%} %>
				                    <%if(scv.getStillCut6()!=null && scv.getStillCut6()!="") { %>
				                    <div class="swiper-slide" >
				                    	<img class="stillcut_img" src="<%=SiteProperty.MOVIE_UPLOAD_PATH%><%=scv.getStillCut6()%>"/>
				                    </div>
				                    <%} %>
				                </div>
				    
				                <div class="swiper-pagination"></div>
				                <div class="swiper-button-prev"></div>
				                <div class="swiper-button-next"></div>
				            </div>
					</div>
					<h5 class="movie_title"><strong>트레일러</strong></h5>
					<div class="trailler_area">
						<ul>
						 <%if(tv.getTrailer1()!=null && !("").equals(tv.getTrailer1())) { %>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer1()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
						<% } %>
						 <%if(tv.getTrailer2()!=null && !("").equals(tv.getTrailer2())) { %>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer2()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
						<% } %>	
						<%if(tv.getTrailer3()!=null && !("").equals(tv.getTrailer3())) { %>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer3()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
						<% } %>		
						 <%if(tv.getTrailer4()!=null && !("").equals(tv.getTrailer4())) { %>	
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer4()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>	
							<% } %>
							 <%if(tv.getTrailer5()!=null && !("").equals(tv.getTrailer5())) { %>		
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer5()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
								<% } %>
								 <%if(tv.getTrailer6()!=null && !("").equals(tv.getTrailer6())) { %>		
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer6()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<% } %>
						</ul>
					</div>
					
					<form method="post" name="frm" id="frm" action="" >
					<input type="hidden" name="movie_pk" value="<%=data.getNo()%>"/>
					<h5 class="movie_title">리뷰</h5>
					<div class="review_area">
						<div class="review_write">
							<div class="input">
								<div class="rate">
									<select name="score"> <%=CodeUtil.getScoreTypeOption(1) %>
									</select>
								</div>
								
								<div class="textarea">
									<textarea name="contents" id="contents"></textarea>
								</div>
								<div class="btn_area">
									<input type="button" class="btn" onclick="save();" value="등록">
								</div>
							</div>
						</div>
						</form>
						
<script>
$(function() {
	getList();
});

function getList() {
	$.ajax({
		url : "reviewList.do",
		dataType : "html",
		data : {"smovie_pk" : <%=data.getNo()%>},
		async : true,
		success : function(data) {
			$(".review_list").html(data);
		},
		error : function(msg) {
			console.log(msg);
		}
	});
}

function goDelete(no) {
	if (confirm("삭제하시겠습니까?")) {
		$.ajax({
			url : "/movie/review/delete.do",
			data : {"no" : no},
			async : true,
			success : function(data) {
				var d = data.trim();
				if (d>0) {
					getList();
					alert("정상적으로 삭제되었습니다.");
				} else {
					alert("삭제실패");
				}
			},
			error : function(msg) {
				console.log(msg);
			}
		});
	}
}

function save() {
	<%
	if (memberInfo == null) {
	%>
	alert("로그인후 작성가능합니다.");
	<% } else { %>
	var data = $("#frm").serialize();
	$.ajax({
		type : "POST",
		url :"/movie/review/insert.do",
		async : true,
		data : data,
		success : function (data) {
			var r = data.trim();
			if (r>0) {
				getList();
				alert("정상적으로 등록되었습니다.");
				$("#contents").val("");
			} else {
				alert("등록실패");
			}
		}
	})
	<% } %>
}
</script>
						<div class="review_list">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
<script>
$(function(){
	var swiper = new Swiper('.swiper-container', {
		loop: true,
		autoplay: {
		    delay: 5000,
		  },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
       	},
	});
});
</script>
</body>
</html>