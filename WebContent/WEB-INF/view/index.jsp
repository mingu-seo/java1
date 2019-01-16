<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
        		<img src="/img/poster1.jpg">
        	</div>
        	<div class="bxoffice">
        		<ul>
        			<li><span class="rank">1</span><a href="">주먹왕 랄프2 : 인터넷 속으로</a></li>
        			<li><span class="rank">2</span><a href="">극장판 공룡메카드: 타이니소어의 섬</a></li>
        			<li><span class="rank">3</span><a href="">말모이</a></li>
        			<li><span class="rank">4</span><a href="">아쿠아맨</a></li>
        			<li><span class="rank">5</span><a href="">범블비</a></li>
        			<li><span class="rank">6</span><a href="">주먹왕 랄프2 : 인터넷 속으로</a></li>
        			<li><span class="rank">7</span><a href="">극장판 공룡메카드: 타이니소어의 섬</a></li>
        			<li><span class="rank">8</span><a href="">말모이</a></li>
        			<li><span class="rank">9</span><a href="">아쿠아맨</a></li>
        			<li><span class="rank">10</span><a href="">범블비</a></li>
        		</ul>
        	</div>
        	<div class="youtube">
        		<div class="video_container">
					<iframe src="https://www.youtube.com/embed/dVXbK4Mz_NY" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
				</div>
        	</div>
        </div>
    </div>
    
    <%@ include file="/WEB-INF/view/include/footer.jsp" %>
     
</body>
</html>