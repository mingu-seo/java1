<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="movie.*" %>
<% 
MovieVo param = (MovieVo)request.getAttribute("vo");
MovieVo data = (MovieVo) request.getAttribute("data");
StillCutVo scv = (StillCutVo) request.getAttribute("scv");
TrailerVo tv = (TrailerVo) request.getAttribute("tv"); 
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
								</dt>
								<dt class="info_detail">
									예매율 50%
								</dt>
								<dt class="info_detail">
									감독 <%=data.getDirector()%>
								</dt>
								<dt class="info_detail">
									배우 심형래, 라푼젤, 엘사
								</dt>
								<dt class="info_detail">
									장르 <%=data.getGenre()%>
								</dt>
								<dt class="info_detail">
									개봉일 <%=data.getReleaseDate()%>
								</dt>
								<dt class="synop">
									시놉시스 <br/>
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
					<h5 class="movie_title">스틸컷</h5>
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
					<h5 class="movie_title">트레일러</h5>
					<div class="trailler_area">
						<ul>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer1()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer2()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>
								<div class="video_container">
									<iframe src="<%=tv.getTrailer3()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer4()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>	
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer5()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
								</div>
							</li>
							<li>	
								<div class="video_container">
									<iframe src="<%=tv.getTrailer6()%>" frameborder="0"  wmode="Opaque" width="100%" height="315"></iframe>
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