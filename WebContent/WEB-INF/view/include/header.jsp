<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript" src="/js/swiper.min.js"></script>
<script>
$(function() {
	$(".depth1 > li").mouseover(function(){
		$(this).find(".depth2").stop().slideDown(300);
	});
	$(".depth1 > li").mouseleave(function(){
		$(this).find(".depth2").stop().slideUp(300);
	});
	
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
	<div id="header">
        <div class="head_top">
            <div class="size">
                <div class="header_call">
                    <div class="txt">
                        <a href=""></a>
                    </div>
                </div>
                <h1 class="logo"><a href="/"><img src="/img/logo.png"/></a></h1>
                <div class="util clear">
                    <a href="">로그인</a>
                    <a href="member/join.do">회원가입</a>
                    <!-- 
                    <a href="">로그인</a>
                    <a href="">예매내역</a>
                     -->
                </div>
            </div>
        </div>
        <div class="head_bot">
            <div class="size">
                <div class="gnb">
                    <ul class="depth1 clear">
                        <li>
                            <a href="" >MOVIE</a>
                            <ul class="depth2">
                                <li><a href="" >현재 상영자</a></li>
                                <li><a href="" >개봉 예정작</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >TICKET</a>
                            <ul class="depth2">
                                <li><a href="" >예매하기</a></li>
                                <li><a href="" >상영 시간표</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >NOTICE</a>
                            <ul class="depth2">
                                <li><a href="" >공지사항</a></li>
                                <li><a href="" >이벤트</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="" >STORE</a>
                            <ul class="depth2">
                                <li><a href="" >상품권</a></li>
                                <li><a href="" >스낵</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>