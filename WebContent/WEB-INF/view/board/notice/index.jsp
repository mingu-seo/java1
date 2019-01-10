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
				<table class="list">
					<caption>게시판 목록</caption>
					<colgroup>
						<col width="80px" />
						<col width="*" />
						<col width="100px" />
						<col width="100px" />
						<col width="80px" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr style='cursor:pointer;' onclick="location.href='view.do?no=1'">
							<td>1</td>
							<td class="txt_l">안녕하세요</td>
							<td class="name">관리자</td>
							<td class="date">2019-01-11</td>
							<td class="hit">11</td>
						</tr>
					</tbody>
				</table>
				<div class="pagenate clear">
					<ul class='paging'><li><a href='javascript:;' class='current'>1</a></li></ul>
				</div>
				<!-- 페이지처리 -->
				<div class="bbsSearch">
					<form method="get" name="searchForm" id="searchForm" action="index.php">
						<span class="srchSelect">
							<select id="stype" name="stype" class="dSelect" title="검색분류 선택">
								<option value="all" >제목+내용</option>
								<option value="title" >제목</option>
								<option value="contents" >내용</option>
							</select>
						</span>
						<span class="searchWord">
							<input type="text" id="sval" name="sval" value="" title="검색어 입력" onKeypress="">
							<input type="button" id="" value="검색" title="검색" onclick="goSearch();">
						</span>
					</form>
				</div>
			</div>
		</div>
    </div>

    <%@ include file="/WEB-INF/view/include/footer.jsp" %>

</body>
</html>
