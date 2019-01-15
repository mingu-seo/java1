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
							<img src="/img/poster1.jpg" />
						</div>
						<div class="movie_info">
							<dl>
								<dt class="title">
									랄프2 : 인터넷 속으로
								</dt>
								<dt class="info_detail">
									예매율 50%
								</dt>
								<dt class="info_detail">
									감독 김청기
								</dt>
								<dt class="info_detail">
									배우 심형래, 라푼젤, 엘사
								</dt>
								<dt class="info_detail">
									장르 액션
								</dt>
								<dt class="info_detail">
									개봉일
								</dt>
								<dt class="synop">
									시놉시스
									<div class="synop_contents">
										1940년대 우리말이 점점 사라져가고 있는 경성.<br/>
										극장에서 해고된 후 아들 학비 때문에 가방을 훔치다 실패한 판수.<br/>
										하필 면접 보러 간 조선어학회 대표가 가방 주인 정환이다.<br/>
									</div>
								</dt>
								<dt class="reser_btn">
									<input type="button" class="btn" value="예매"/>
								</dt>
							</dl>
						</div>
					</div>
					<h5 class="movie_title">스틸컷</h5>
					<div class="stillcut_area">
							<div class="swiper_stillcut swiper-container">
				                <div class="swiper-wrapper">
				                    <div class="swiper-slide" >
				                    	<img class="stillcut_img" src="/img/stillcut1.jpg"/>
				                    </div>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="/img/stillcut2.jpg"/>
				                    </div>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="/img/stillcut3.jpg"/>
				                    </div>
				                    <div class="swiper-slide">
				                    	<img class="stillcut_img" src="/img/stillcut4.jpg"/>
				                    </div>
				                </div>
				    
				                <div class="swiper-pagination"></div>
				                <div class="swiper-button-prev"></div>
				                <div class="swiper-button-next"></div>
				            </div>
					</div>
					<h5 class="movie_title">트레일러</h5>
					<div class="trailler_area">
						<ul>
							<li>
								<div class="video_container">
									<iframe src="https://www.youtube.com/embed/dVXbK4Mz_NY" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="https://www.youtube.com/embed/dVXbK4Mz_NY" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="https://www.youtube.com/embed/dVXbK4Mz_NY" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
						</ul>
					</div>
					<h5 class="movie_title">리뷰</h5>
					<div class="review_area">
						<div class="review_write">
							<div class="input">
								<div class="rate">
									<select name="">
										<option value="5.0">5.0</option>
										<option value="5.0">5.0</option>
										<option value="5.0">5.0</option>
									</select>
								</div>
								<div class="textarea">
									<textarea name="" id=""></textarea>
								</div>
								<div class="btn_area">
									<input type="button" class="btn" value="등록">
								</div>
							</div>
						</div>
						<div class="review_list">
							<ul>
								<li>
									<div class="review_writer">홍길동</div>
									<div class="review_contents">재미있었어요~!</div>
									<div class="review_etc">
										<div class="review_date">2019.01.01</div>
										<div class="review_btn">
											<input type="button" class="btn" value="삭제"/>
										</div>
									</div>
								</li>
								<li>
									<div class="review_writer">홍길동</div>
									<div class="review_contents">재미있었어요~!</div>
									<div class="review_etc">
										<div class="review_date">2019.01.01</div>
										<div class="review_btn">
											<input type="button" class="btn" value="삭제"/>
										</div>
									</div>
								</li>
								<li>
									<div class="review_writer">홍길동</div>
									<div class="review_contents">재미있었어요~!</div>
									<div class="review_etc">
										<div class="review_date">2019.01.01</div>
										<div class="review_btn">
											<input type="button" class="btn" value="삭제"/>
										</div>
									</div>
								</li>
								<li>
									<div class="review_writer">홍길동</div>
									<div class="review_contents">재미있었어요~!</div>
									<div class="review_etc">
										<div class="review_date">2019.01.01</div>
										<div class="review_btn">
											<input type="button" class="btn" value="삭제"/>
										</div>
									</div>
								</li>
							</ul>
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