<%@ page import="movie.*" %>
<%@ page import="ticket1.*" %>   
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
ArrayList<MovieVo> tklist = (ArrayList)request.getAttribute("tklist");
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
</head>
<body>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
    
    <div class="main">
        <div class="visual animate">
            <div class="swiper1 swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide bg1">
                    </div>
                    <div class="swiper-slide bg2">
                    </div>
                    <div class="swiper-slide bg3">
                    </div>
                    <div class="swiper-slide bg4">
                    </div>
                </div>
    
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
        <div class="movie">
        	<div class="poster">
        		<div class="tit"><h4>BOXOFFICE</h4></div>
        		<img id="poster_img" src="/img/poster1.jpg" style="cursor:pointer;">
        	</div>
        	<div class="bxoffice">
        		<ul> <% MovieVo rank;
        					for(int i=0; i<tklist.size(); i++) {
								rank = tklist.get(i);
					%>
        			<li class="ranking_li" data-poster="<%=rank.getPoster()%>" data-no="<%=rank.getNo()%>" data-youtube="<%=rank.getYoutube() %>">
        			<span class="rank"><%=i+1 %></span><a href="/movie/detail.do?no=<%=rank.getNo()%>"><%=rank.getTitle() %></a></li>
        		<%} %>
        		</ul>
        	</div>
        	<div class="youtube">
        		<div class="video_container">
					<iframe id="youtube" src="https://www.youtube.com/embed/dVXbK4Mz_NY" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
				</div>
        	</div>
        </div>
    </div>
<script>
$(function() {
	
	$("#poster_img").attr("src", "<%=property.SiteProperty.MOVIE_UPLOAD_PATH%>"+$(".ranking_li").eq(0).data("poster"));
	$("#poster_img").attr("onclick", "location.href='/movie/detail.do?no="+$(".ranking_li").eq(0).data("no")+"';");
	$("#youtube").attr("src", $(".ranking_li").eq(0).data("youtube"));
	
	$(".ranking_li").mouseover(function() {
		var idx = $(".ranking_li").index(this);
		var img = $(".ranking_li").eq(idx).data("poster");
		var you = $(".ranking_li").eq(idx).data("youtube");
		var no = $(".ranking_li").eq(idx).data("no");
		$("#poster_img").attr("src", "<%=property.SiteProperty.MOVIE_UPLOAD_PATH%>"+img);
		$("#youtube").attr("src", you);
		$("#poster_img").attr("onclick", "location.href='/movie/detail.do?no="+no+"';");
	});
});
</script>    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>