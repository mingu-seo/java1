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
			<h3 class="sub_title">공지사항</h3>
			<div class="bbs">
				<div class="view">
					<div class="title">
						<dl>
							<dt>안녕하세요</dt>
							<dd class="name">관리자</dd>
							<dd class="date">2019-01-11</dd>
						</dl>
					</div>
					<div class="cont">내용내용내용</div>
					<dl class="file">
						<dt>첨부파일 </dt>
						<dd><a href="" target="_blank">파일명.pdf</a></dd>
					</dl>
					<div class="btnSet clear">
						<div class="fl_l"><a href="index.do?" class="btn">목록으로</a></div>
					</div>
				</div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
