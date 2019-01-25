package util;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

/**
 * 페이징처리 및 URL, 파라미터 관련 클래스
 * 페이지수 구하는 메서드 추가
 * @author withsky
 *
 */
public class Page {

	/** 목록-페이징 처리
	 * 
	 * @param reqPageNo 요청페이지
	 * @param pageCount 페이지수
	 * @param req HttpServletRequest
	 * @return String
	 */
	
	public static String userindexList(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 10;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}
		strList.append("<ul class='paging'>");
		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<li><a href='"+listUrl+"reqPageNo="+curpage+"'><img src='/img/ico_prev.png' alt='' /></a></li>");
//			strList.append("<a href='"+listUrl+"reqPageNo=1' CLASS='b_num'>[1]</a> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
			  strList.append("<li><a href='javascript:;' class='current'>"+reqPageNo+"</a></li>");
			} else {
			  strList.append("<li><a href='"+listUrl+"reqPageNo="+curpage+"'>"+curpage+"</a></li>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1;  
			strList.append("<li><a href='"+listUrl+"reqPageNo="+curpage+"'><img src='/img/list_next.gif' alt='' /></a></li>");
//			strList.append(" <a href='"+listUrl+"reqPageNo="+pageCount+"' CLASS='b_num'>["+pageCount+"]</a>");
		}else{
			strList.append(" ");
		}
		strList.append("</ul> ");

		return strList.toString();
	}

	public static String indexList(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 10;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}
		strList.append("<div class='page'>");
		// 요청한 페이지 번호가 초기화면에 없는경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<a href='"+listUrl+"reqPageNo="+curpage+"' class='next'><img src='/img/list_prev.gif' alt='' />이전</a> ");
//			strList.append("<a href='"+listUrl+"reqPageNo=1' CLASS='b_num'>[1]</a> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
			  strList.append("<strong>"+reqPageNo+"</strong>");
			} else {
			  strList.append("<a href='"+listUrl+"reqPageNo="+curpage+"' class='b_num'>"+curpage+"</a>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1;  
			strList.append(" <a href='"+listUrl+"reqPageNo="+curpage+"' class='next'>다음<img src='/img/list_next.gif' alt='' /></a>");
//			strList.append(" <a href='"+listUrl+"reqPageNo="+pageCount+"' CLASS='b_num'>["+pageCount+"]</a>");
		}else{
			strList.append(" ");
		}
		strList.append("</div> ");

		return strList.toString();
	}

	
	public static String indexListJquery(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 10;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}
		strList.append("<div class='page'>");
		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<a href='javascript:pageIndex("+curpage+")' class='next'><img src='/img/list_prev.gif' alt='' />이전</a> ");
//			strList.append("<a href='"+listUrl+"reqPageNo=1' CLASS='b_num'>[1]</a> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
			  strList.append("<strong>"+reqPageNo+"</strong>");
			} else {
			  strList.append("<a href='javascript:pageIndex("+curpage+")' class='b_num'>"+curpage+"</a>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1;  
			strList.append(" <a href='javascript:pageIndex("+curpage+")' class='next'>다음<img src='/img/list_next.gif' alt='' /></a>");
//			strList.append(" <a href='"+listUrl+"reqPageNo="+pageCount+"' CLASS='b_num'>["+pageCount+"]</a>");
		}else{
			strList.append(" ");
		}
		strList.append("</div> ");

		return strList.toString();
	}
	
	public static String indexShopList(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 5;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		String bar = "<td class='bar'><img src='/img/common/arr_bar.jpg'></td>";
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}					
		strList.append("<table class='ar_box'><tbody class='arr'><tr clas=''>");
		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<td class='lf'><a href='"+listUrl+"reqPageNo="+curpage+"' ><img src='/img/common/arr_lf_img.png'></a></td>");
			strList.append(bar);
//			strList.append("<li class='prev-page' ><a class='icon-arrow-left' href='"+listUrl+"reqPageNo="+curpage+"' ></a></li>");
//			strList.append("<a href='"+listUrl+"reqPageNo=1' CLASS='b_num'>[1]</a> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
				strList.append("<td class=''><a class='on' href='#'>"+reqPageNo+"</a></td>");
				strList.append(bar);
//			  strList.append("<li class='active' ><a href='#'>"+reqPageNo+"</a></li>");
			} else {
				strList.append("<td class='num'><a href='"+listUrl+"reqPageNo="+curpage+"'>"+curpage+"</a></td>");
				strList.append(bar);
//			  strList.append("<li><a href='#'><a href='"+listUrl+"reqPageNo="+curpage+"' >"+curpage+"</a></li>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1; 
			strList.append("<td class='rt'><a href='"+listUrl+"reqPageNo="+curpage+"' ><img src='/img/common/arr_rt_img.png'></a></td>");
//			strList.append("<li class='next-page' ><a class='icon-arrow-right' href='"+listUrl+"reqPageNo="+curpage+"' ></a></li>");
//			strList.append(" <a href='"+listUrl+"reqPageNo="+pageCount+"' CLASS='b_num'>["+pageCount+"]</a>");
		}else{
			strList.append(" ");
		}
		strList.append("</tr></tbody></table> ");
		return strList.toString();
	}
	
	/** 목록-페이징 처리
	 * 
	 * @param reqPageNo 요청페이지
	 * @param pageCount 페이지수
	 * @param req HttpServletRequest
	 * @return String
	 */
	public static String indexListMo(int reqPageNo, int pageCount, HttpServletRequest req) {
		int pagenumber = 5;								// 화면에 보여질 페이지 인덱스 수
		int startpage;											// 화면에 보여질 시작페이지 번호
		int endpage;												// 화면에 보여질 마지막페이지 번호
		int curpage;												// 이동하고자 하는 페이지 번호
		StringBuffer strList= new StringBuffer();	// 리턴될 페이지 인덱스 리스트
		String listUrl = getPageURL(req);				// 현재 url 구하기

		// 시작 페이지번호 구하기
		startpage = ((reqPageNo - 1) / pagenumber) * pagenumber + 1;
		// 마지막 페이지번호 구하기
		endpage = (((startpage - 1) +  pagenumber) / pagenumber) * pagenumber;

		// 총 페이지 수가 계산된 마지막페이지 번호보다 작을경우 
		// 총 페이지 수가 마지막페이지 번호가 됨
		if (pageCount <= endpage){
		    endpage = pageCount;
		}
		strList.append("<div class='page'>");
		// 첫번째 페이지 인덱스 화면이 아닌경우
		if ( reqPageNo > pagenumber) {
			curpage = startpage - 1;    // 시작페이지 번호보다 1 적은 페이지로 이동
			strList.append("<a href='"+listUrl+"reqPageNo="+curpage+"' class='next'><img src='/img/mo_list_prev.gif' alt='' /></a> ");
//			strList.append("<a href='"+listUrl+"reqPageNo=1' CLASS='b_num'>[1]</a> ");
		}else{
			strList.append(" ");
		}

		// 시작페이지 번호부터 마지막페이지 번호까지 화면에 표시
		curpage = startpage;
		while (curpage <= endpage){
			if (curpage == reqPageNo) {
			  strList.append("<strong>"+reqPageNo+"</strong>");
			} else {
			  strList.append("<a href='"+listUrl+"reqPageNo="+curpage+"' class='b_num'>"+curpage+"</a>");
			}
			curpage++;
		}

		// 뒤에 페이지가 더 있는경우
		if ( pageCount > endpage) {
			curpage = endpage + 1;  
			strList.append(" <a href='"+listUrl+"reqPageNo="+curpage+"' class='next'><img src='/img/mo_list_next.gif' alt='' /></a>");
//			strList.append(" <a href='"+listUrl+"reqPageNo="+pageCount+"' CLASS='b_num'>["+pageCount+"]</a>");
		}else{
			strList.append(" ");
		}
		strList.append("</div> ");

		return strList.toString();
	}
	
	/**
	 *  페이징처리를위한 현재 페이지 URL + 파라미터 구하는 메서드
	 *  reqPageNo 제외
	 * @param request HttpServletRequest
	 * @return String 
	 */
	public static String getPageURL(HttpServletRequest request) {
		 
		//String originalURL = request.getRequestURI();  //이렇게 호출하면 페이징처리 하는 부분 호출한 곳에서마다 달라짐.
		String originalURL = (String)request.getAttribute("javax.servlet.forward.request_uri"); //지정해줘야함
		
		Enumeration param = request.getParameterNames();	// request
		String paramName = "";								// 파라미터 네임값
		String paramValue = "";								// 파라미터 밸류값
		String strParam = "";								// 파라미터 문자열
		String listUrl = "";								// url + 파라미터
		StringBuffer strList= new StringBuffer();			// 리턴될 페이지 인덱스 리스트
		
		while(param.hasMoreElements()) {
			paramName = (String)param.nextElement();
			paramValue = request.getParameter(paramName);
			if (!"reqPageNo".equals(paramName)) {
				strParam = paramName + "=" + paramValue + "&" + strParam;
			}
		}
		listUrl = originalURL+"?"+strParam; 
		return listUrl; 
	}
		
	/**
	 *  현재 URL+파라미터를 구하는 메서드 
	 * @param request HttpServletRequest
	 * @return String
	 */
	public static String getURL(HttpServletRequest request) {
		
		String originalURL = request.getRequestURI();  
		  
		Enumeration param = request.getParameterNames();	// request
		String paramName = "";								// 파라미터 네임값
		String paramValue = "";								// 파라미터 밸류값
		String strParam = "";								// 파라미터 문자열
		String listUrl = "";								// url + 파라미터
		StringBuffer strList= new StringBuffer();			// 리턴될 페이지 인덱스 리스트
		
		while(param.hasMoreElements()) {
			paramName = (String)param.nextElement();
			paramValue = request.getParameter(paramName);
			strParam = paramName + "=" + paramValue + "&" + strParam;
		}
		listUrl = originalURL+"?"+strParam; 
		return listUrl; 
	}
		
	/**
	 * 전체 페이지 수 구하기
	 * @param pageRows 한페이지 로우수
	 * @param totalCount 전체 로우수
	 * @return int 페이지 수
	 */
	public static int getPageCount(int pageRows, int totalCount) {
		int pageCount = 0;
		pageCount = totalCount / pageRows;
		if (totalCount % pageRows > 0) pageCount++;
		return pageCount;
	}

}
