package util;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;

/**
 * 각종 유용한 함수들
 * @author withsky
 *
 */
public class Function {

	/**
	 *  메세지(alertMessage)를 alert하고 전달된 rurl로 이동한다.
	 * @param rurl String
	 * @param alertMessage String
	 * @return String
	 */
	public static String returnURL(String rurl, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					"document.location.href='" + rurl + "';  \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 * 메세지(alertMessage)를 alert하고 전달된 rurl로 target설정된 frame을 이동시킨다.
	 */
	public static String returnURL(String rurl, String alertMessage, String target) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") ) alertMessage =  "";
			rHtml  =	"<script language=javascript>\n " +
						"<!-- \n" +
						"alert('" + alertMessage.trim() + "'); \n" +
						target+".location.href='" + rurl + "';  \n" +
						"window.close(); \n" +
						"// --> \n" +
						"</script> \n";
		return rHtml;
	}

	/**
	 *  전달된 rurl로 이동한다.
	 */
	public static String returnURL(String rurl) {
		String rHtml = new String(" ");

		if ( rurl == null || rurl.equals("") )
			rurl =  "/";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"document.location.href='" + rurl + "';  \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  전달된 rurl로 이동한다 창을 닫는다.
	 */
	public static String returnURLClose(String rurl) {
		String rHtml = new String(" ");

		if ( rurl == null || rurl.equals("") )
			rurl =  "/";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"document.location.href='" + rurl + "';  \n" +
					"window.close(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  전달된 rurl로 이동한다 창을 닫는다.
	 */
	public static String returnURLClose(String rurl, String msg) {
		String rHtml = new String(" ");

		if ( rurl == null || rurl.equals("") )
			rurl =  "/";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + msg.trim() + "'); \n" +
					"document.location.href='" + rurl + "';  \n" +
					"window.close(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  메세지(alertMessage)를 팝업창을 닫고 alert하고 전달된 rurl로 이동한다.
	 */
	public static String popupCloseURL(String rurl, String target, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					"window.close(); \n" +
					target+".location.href='" + rurl + "';  \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  메세지를 alert하고 opener를 reload한 후 창을 닫는다.
	 */
	public static String popupCloseRefresh(String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					"opener.location.reload();window.close(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
    }

	/**
	 *  메세지(alertMessage)를 팝업창을 닫고 alert하고 전달된 rurl로 이동한다.
	 */
	public static String popupCloseURL(String rurl, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage = "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"var openwin=window.open('childwin.html','childwin','width=300,height=160'); \n" +
					"openwin.close(); \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					"document.location.href='" + rurl + "';  \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}


	/**
	 * 메세지(alertMessage)를 alert하고 이전 페이지로 이동한다.
	 * @param alertMessage
	 * @return String
	 */
	public static String returnHistory(String alertMessage) {
		String rHtml = "";

		rHtml =		"<script language=javascript> \n " +
					"<!-- \n" +
					" alert('"+alertMessage.trim()+"'); \n" +
					" history.back(); \n" +
					"// --> \n" +
					"</script> \n ";
		return rHtml;
	}

	/**
	 *  메세지(alertMessage)를 확인하면 전달된 rurl로 이동하고 취소하면 이전페이지로 이동한다.
	 * @param rurl String
	 * @param alertMessage String
	 * @return
	 */
	public static String returnConfirm(String rurl, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"sure = confirm('" + alertMessage.trim() + "'); \n" +
					"if (sure) \n" +
					"	location.href='" + rurl + "';  \n" +
					"else \n" +
					"	history.back(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  메세지(alertMessage)를 확인하면 전달된 rurl로 이동하고 취소하면 index.jsp로 이동한다.
	 * @param rurl String
	 * @param alertMessage String
	 * @return
	 */
	public static String returnUrlConfirm(String rurl, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"sure = confirm('" + alertMessage.trim() + "'); \n" +
					"if (sure) \n" +
					"	location.href='" + rurl + "';  \n" +
					"else \n" +
					"	location.href='/index.jsp'; \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  메세지(alertMessage)를 확인하면 전달된 rurl로 gourl값을 parameter로 이동하고 취소하면 이전페이지로 이동한다.
	 * @param rurl String
	 * @param gourl String
	 * @param alertMessage String
	 * @return String
	 */
	public static String returnConfirm(String rurl, String gourl, String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml =		"<script language=javascript>\n " +
					"<!-- \n" +
					"sure = confirm('" + alertMessage.trim() + "'); \n" +
					"if (sure) \n" +
					"	location.href='" + rurl + "?url="+gourl+"';  \n" +
					"else \n" +
					"	history.back(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}

	/**
	 *  alert하고 팝업창을 닫는다.
	 * @param alertMessage 메세지
	 * @return String
	 */
	public static String popupClose(String alertMessage) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			alertMessage =  "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					"window.close(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}


	/**
	 *  8자리 String 문자열을 yyyy-MM-dd형으로 변환
	 * @param str
	 * @return String
	 */
	public static String setDateFormat(String str) {
		if (str == null)
			return "";
		else if (str.length() < 8)
			return str;
		else
			str = str.substring(0,4)+"-"+str.substring(4,6)+"-"+str.substring(6);
		return str;
	}

	/**
	 *  문자열(str)중 patten인 문자열을 replace로 변경하여 반환한다.
	 * @param str 원문자열
	 * @param pattern 패턴
	 * @param replace 변경해야할 문자열
	 * @return 문자열
	 */
	public static String rplc(String str, String pattern, String replace) {
		int s = 0;
		int e = 0;
		StringBuffer result = new StringBuffer();

		while ((e = str.indexOf(pattern, s)) >= 0) {
			result.append(str.substring(s, e));
			result.append(replace);
			s = e + pattern.length();
		}
		result.append(str.substring(s));
		return result.toString();
	}

	/**
	 *  Null 문자열을 공백으로 변환
	 * @param str String
	 * @return String
	 */
	public static String checkNull(String str) {
		String strTmp;
		if (str == null)
			strTmp = "";
		else
			strTmp = str.trim();
		return strTmp;
	}

	/**
	 *  전달된 Req값이 null 이나 "" 이면 0 값을 반환하고 그렇치 않다면 double형으로 형변환해서 반환한다.
	 * @param Req String
	 * @return double
	 */
	public static double getDoubleParameter(String Req ) {
		try {
			if (Req == null || Req.equals(""))
				return 0.0;
			else
				return Double.parseDouble(Req.toString());
		} catch(NumberFormatException e) {
			return 0.0;
		}
	}

	/**
	 *  req 값이 null 이나 "" 일 경우 전달된(ifNulltoReplace)로 변경한다.
	 * @param Req String
	 * @param ifNulltoReplace String
	 * @return String
	 */
	public static String getReqParameter(String Req,String ifNulltoReplace ) {
		if ( Req == null || Req.equals(""))
			return ifNulltoReplace;
		else
			return Req.trim();
	}

	/**
	 *  req 값이 null 이나 "" 일 경우 ""로 전달한다.
	 * @param Req String
	 * @return String
	 */
	public static String getReqParameter(String Req ) {
		if (Req == null || Req.equals(""))
			return "";
		else
			return Req.trim();
	}

	/**
	 *  전달된 Req값이 null 이나 "" 이면 0 값을 반환하고 그렇치 않다면 Integer로 형변환해서 반환다.
	 * @param Req String
	 * @return int
	 */
	public static int getIntParameter(String Req ) {
		try {
			if (Req == null || Req.equals(""))
				return 0;
			else
				return Integer.parseInt(Req.toString());
		} catch (NumberFormatException e) {
			return 0;
		}
	}

	/**
	 *  전달된 Req값이 null 이나 "" 이면 ifNulltoReplace 값을 반환하고 그렇치 않다면 int로 형변환해서 반환다.
	 * @param Req String
	 * @param ifNulltoReplace int
	 * @return int
	 */
	public static int getIntParameter(String Req,int ifNulltoReplace ) {
		try {
			if ( Req == null || Req.equals(""))
				return ifNulltoReplace;
			else
				return Integer.parseInt(Req.toString());
		} catch (NumberFormatException e) {
			return ifNulltoReplace;
		}
	}

	/**
	 *  파일 사이즈를 계산해서 알맞은 단위로 변경한다.
	 * @param filesize long
	 * @return String
	 */
	public static String getFileSize(long filesize) {

		DecimalFormat df = new DecimalFormat(".##");
		String fSize="";

		if ((filesize > 1024) && (filesize < 1024 * 1024)) {
			fSize = df.format((float)filesize/1024).toString() + "KB" ;
		} else if (filesize >= 1024 * 1024) {
			fSize = df.format((float)filesize/(1024*1024)).toString() + "MB" ;
		} else {
			fSize = Long.toString(filesize) + "Bytes" ;
		}
		return fSize;
	}

	/**
	 *  checkbox 체크 출력 여부
	 * @param s int
	 * @param w int
	 * @return String
	 */
	public static String getChecked(int s,int w) {
		return (s==w)? "checked" : "";
	}

	/**
	 *  checkbox 반대값 체크 출력 여부
	 * @param s Integer
	 * @param w Integer
	 * @return String
	 */
	public static String getDifferChecked(int s,int w) {
		return (s!=w)? "checked" : "";
	}

	/**
	 *  checkbox 체크 출력 여부
	 * @param s String
	 * @param word String
	 * @return String
	 */
	public static String getChecked(String s,String word) {
		return s.equals(word) ? "checked" : "";
	}

	/**
	 *  selectbox 선택 여부
	 * @param s int
	 * @param w int
	 * @return String
	 */
	public static String getSelected(int s,int w) {
		return (s==w)? "selected" : "";
	}

	/**
	 *  selectbox 선택 여부
	 * @param s String
	 * @param word String
	 * @return String
	 */
	public static String getSelected(String s,String word) {
		return s.equals(word) ? "selected" : "";
	}

	/**
	 *  request 본문(body)의 MIME 유형이 multipart/form-data 인지 확인
	 * @param formType String
	 * @return boolean
	 */
	public static boolean getContentType(String formType) {
		formType = checkNull(formType);
		int textLength = formType.length();
		if (textLength >= 19) {
			if ("multipart/form-data".equals(formType.substring(0, 19))) {
				return true;
			}
		}
		return false;
	}

	/**
	 *  이미지의 width를 전달 받은 값 보다 큰가 확인 한 후 크면 전달 받은 값으로 변경한다.
	 * @param img 이미지명
	 * @param reWidth 넓이
	 * @return 크기
	 */
	public static int getImgReSize(String img, int reWidth) {
		Image imgSource = new ImageIcon(img).getImage();
		int    width = imgSource.getWidth(null);

		if (width > reWidth) {
			width = reWidth;
		}
		return width;
	}

	/**
	 *  html의 html tag를 제거 한 후 size보다 크면 size 만큼 절사 한 후 전달한다.
	 * @param html HTML코드
	 * @param size 길이
	 * @return size만큼의 문자열
	 */
	public static String getHtmlRemoveTextReSize(String html, int size) {
		html = html.replaceAll("<([/!])?([a-zA-Z0-9-]*)(\\s[a-zA-Z0-9-]*=[^>]*)?(\\s)*([/])?>", "")
				   .replaceAll("&nbsp;", " ")
				   .replaceAll("&nbsp", " ")
				   .replaceAll("&nbs", " ")
				   .replaceAll("&nb", " ")
				   .replaceAll("&n", " ")
				   .replaceAll("&", " ")
		           .replaceAll("<!--.*-->", "");
		if (html.length() > size) {
			return html.substring(0, size)+"....";
		} else {
			return html;
		}
	}

	/**
	 *  <,>,&," 등을 Symbolic HTML entity 문자열로 변경하여 반환한다.
	 * @param str 문자열
	 * @return 문자열
	 */
	public static String htmlReplaceEntity(String str) {
		if (str == null)
			return str;
		str = str.replaceAll("\"", "&quot;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}

	/**
	 *  text 테이터의 \r(엔터), \n(1라인에 길게 글을 쓸때), \u0020(스페이스값)을 <br>, &nbsp;으로 변경한다.
	 * @param comment String
	 * @return String
	 */
	public static String nl2br(String comment) {
		if (comment == null || "".equals(comment)) {
			comment = "";
			return comment;
		} else {
			int pos = comment.indexOf("<pre>");
			if (pos < 0) {
				comment = comment.replaceAll("\u0020", "&nbsp;");
				comment = comment.replaceAll("\r\n", "<br>");
				return comment;
			} else {
				return comment;
			}
		}
	}

	/**
	 * 메세지(alertMessage)를 alert하고 전달된 rurl로 target설정된 frame을 reload한다.
	 * @param alertMessage 메세지
	 * @param target 대상
	 * @return
	 */
	public static String returnReloadURL(String alertMessage, String target) {
		String rHtml = new String(" ");

		if ( alertMessage == null || alertMessage.equals("") )
			return "";

		rHtml  =	"<script language=javascript>\n " +
					"<!-- \n" +
					"alert('" + alertMessage.trim() + "'); \n" +
					target+".location.reload();  \n" +
					"window.close(); \n" +
					"// --> \n" +
					"</script> \n";
		return rHtml;
	}
	
	/**
	 *  전달된 name에 value 값으로 쿠키를 설정한다.
	 * @param response HttpServletResponse
	 * @param name 이름
	 * @param value 값
	 */
	public static void setCookie(HttpServletResponse response, String name, String value) {
		value = java.net.URLEncoder.encode(value);
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(60*60*24*1);
		response.addCookie(cookie);
	}

	/**
	 *  해당 url에 전달된 name에 value 값으로 쿠키를 설정한다.
	 * @param response HttpServletResponse
	 * @param name 이름
	 * @param value 값
	 * @param uri 경로
	 */
	public static void setCookie(HttpServletResponse response, String name, String value, String uri) {
		value = java.net.URLEncoder.encode(value);
		Cookie cookie = new Cookie(name, value);
		cookie.setPath(uri);
		cookie.setMaxAge(60*60*24*1);
		response.addCookie(cookie);
	}

	/**
	 *  전달된 name에 value 값의 쿠키를 삭제한다.
	 * @param response HttpServletResponse
	 * @param name 이름
	 * @param value 값
	 */
	public static void setDeleteCookie(HttpServletResponse response, String name, String value) {
		value = java.net.URLEncoder.encode(value);
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}

	/**
	 *  전달된 cookieName에 쿠키 값을 가져온다.
	 * @param request HttpServletRequest
	 * @param cookieName 쿠키명
	 * @return String
	 */
	public static String getCookie(HttpServletRequest request, String cookieName) {
		Cookie [] cookies = request.getCookies();
		String value = "";
		if(cookies != null){
			
			for(int i=0;i<cookies.length;i++) {
				if(cookieName.equals(cookies[i].getName())) {
					value = java.net.URLDecoder.decode(cookies[i].getValue());
					break;
				}
			}
			
			
		}
		return value;
	}
		

	/**
	 *  source 내용 중 keyword 패턴을 replace값으로 변경한다.
	 * @param source 원문자열
	 * @param keyword 변경할 값
	 * @param replace 변경될 값
	 * @return
	 */
	public static String replace(String source, String keyword, String replace){
		String result = source;
		Pattern pattern = Pattern.compile(keyword);
		Matcher match = pattern.matcher(source);
		if (match.find()) {
			result = match.replaceAll(replace);
		}
		return result;
	}

	/**
	 *  true면 스팸이 아니고..  false 이면 스팸이다
	 * @param url URL
	 * @return boolean
	 */
	public static boolean getCheckSpam(String url) {

		boolean isSpam = false;

		String temp = checkNull(url);

		if(temp.indexOf("edit.jsp") > -1 || temp.indexOf("write.jsp") > -1 || temp.indexOf("read.jsp") > -1){
			return true;
		}
		return isSpam;
	}

	/**
	 *  byte길이로 문자열 자르기(한글 안깨짐) 형식 : <%=Function.strCut(data.get(i).getTitle(), "", 46, 0, true, true)%>
	 * @param szText
	 * @param szKey
	 * @param nLength
	 * @param nPrev
	 * @param isNotag
	 * @param isAdddot
	 * @return String
	 */
	public static String strCut(String szText, String szKey, int nLength, int nPrev, boolean isNotag, boolean isAdddot){  // 문자열 자르기

	    String r_val = szText;
	    int oF = 0, oL = 0, rF = 0, rL = 0;
	    int nLengthPrev = 0;
	    Pattern p = Pattern.compile("<(/?)([^<>]*)?>", Pattern.CASE_INSENSITIVE);  // 태그제거 패턴

	    if(isNotag) {r_val = p.matcher(r_val).replaceAll("");}  // 태그 제거
	    r_val = r_val.replaceAll("&amp;", "&");
	    r_val = r_val.replaceAll("(!/|\r|\n|&nbsp;)", "");  // 공백제거

	    try {
	      byte[] bytes = r_val.getBytes("UTF-8");     // 바이트로 보관
	      if(szKey != null && !szKey.equals("")) {
	        nLengthPrev = (r_val.indexOf(szKey) == -1)? 0: r_val.indexOf(szKey);  // 일단 위치찾고
	        nLengthPrev = r_val.substring(0, nLengthPrev).getBytes("MS949").length;  // 위치까지길이를 byte로 다시 구한다
	        nLengthPrev = (nLengthPrev-nPrev >= 0)? nLengthPrev-nPrev:0;    // 좀 앞부분부터 가져오도록한다.
	      }

	      // x부터 y길이만큼 잘라낸다. 한글안깨지게.
	      int j = 0;

	      if(nLengthPrev > 0) while(j < bytes.length) {
	        if((bytes[j] & 0x80) != 0) {
	          oF+=2; rF+=3; if(oF+2 > nLengthPrev) {break;} j+=3;
	        } else {if(oF+1 > nLengthPrev) {break;} ++oF; ++rF; ++j;}
	      }

	      j = rF;

	      while(j < bytes.length) {
	        if((bytes[j] & 0x80) != 0) {
	          if(oL+2 > nLength) {break;} oL+=2; rL+=3; j+=3;
	        } else {if(oL+1 > nLength) {break;} ++oL; ++rL; ++j;}
	      }

	      r_val = new String(bytes, rF, rL, "UTF-8");  // charset 옵션

	      if(isAdddot && rF+rL+3 <= bytes.length) {r_val+="...";}  // ...을 붙일지말지 옵션
	    } catch(UnsupportedEncodingException e){ e.printStackTrace(); }

	    return r_val;
	}

	/**
	 * 스팸체크를 위한 랜덤문자열 생성
	 * @return 4자리 문자열
	 */
	public static String getRandomForSpam() {
		Random oRandom = new Random();
		String str;
		// 대문자 매칭
		int ascno1 = oRandom.nextInt(25) + 65;
		str = String.format ( "%c" ,(char) ascno1);
		int ascno2 = oRandom.nextInt(25) + 65;
		str = str+String.format ( "%c" ,(char) ascno2);

		// 일부 특수문자 매칭
		int ascno3 = oRandom.nextInt(3) + 49;
		str = str+String.format ( "%c" ,(char) ascno3);
		// 숫자 매칭
		int ascno4 = oRandom.nextInt(8) + 49;
		str = str+String.format ( "%c" ,(char) ascno4);

		int ascno5 = oRandom.nextInt(25) + 65;
		str = str+String.format ( "%c" ,(char) ascno5);

		return str;
	}

	/**
	 * CKEditor값 세팅(ajax 전송시 필요)
	 * @param idName editor id명
	 * @return html
	 */
	public static String scriptSetCKEditorValue(String idName) {
		String rHtml = " $(\"#"+idName+"\").val(CKEDITOR.instances."+idName+".getData()); ";
		return rHtml;
	}
	/**
	 * ajax로 form submit하는 함수
	 * @param target 대상페이지
	 * @param formName 폼이름
	 * @param alertMessage alert메세지
	 * @param href 처리 후 이동
	 * @return html
	 */
	public static String scriptAjaxSubmit(String target, String formName, String alertMessage, String href) {
		String rHtml = new String(" ");

		rHtml = " $.ajax({  \n" +
					 " 		type: \"POST\",  \n"+
					 " 		url: \""+target+"\",  \n"+
					 " 		async:false, \n" +
					 " 		data:$(\""+formName+"\").serialize(), \n" +
					 " 		dataType:\"html\", \n" +
					 " 		success: function(html){ \n" +
					 " 		result = html.trim(); \n" +
					 " 		alert(\""+alertMessage+"\"); \n" +
					 " 		location.href = '"+href + "'; \n" +
					 " 		}, \n"+
					 " 		error : function(request, status, error) { \n" +
					 " 			alert(\"code : \"+request.status+\"message : \"+request.responseText); \n"+
					 " 		} \n"+
					 " }); \n";

		return rHtml;
	}

	/**
	 * SSL 사용여부에 따라 도메인을 https로 세팅
	 * @param requestUrl request.getRequestURL()
	 * @return url
	 */
	public static String getSslCheckUrl(StringBuffer requestUrl) {
		String chkUrl = requestUrl.toString();
		chkUrl = chkUrl.substring(0, chkUrl.lastIndexOf("/")).replaceAll("http://","");
		chkUrl = chkUrl.replaceAll(SiteProperty.JSP_HOME, "");

		String url = "";
		if (property.SiteProperty.SSL_USE) {
			url = "https://"+chkUrl;
		} else {
			url = "http://"+chkUrl;
		}
		return url;
	}

	/**
	 * SSL 사용여부에 따라 property.SiteProperty.COMPANY_URL을 SSL_USE에 따라 생성
	 * @return
	 */
	public static String getSslCheckUrl() {

		String url = "";
		if (property.SiteProperty.SSL_USE) {
			url = property.SiteProperty.COMPANY_SSL_URL;
		} else {
			url = property.SiteProperty.COMPANY_URL;
		}
		return url;
	}

	/**
	 * process.jsp에서 처리 후 강제로 http로 변환, http로 돌아가기 위해 URL구함
	 * @param requestUrl request.getRequestURL()
	 * @return url
	 */
	public static String getRemoviSslUrl(StringBuffer requestUrl) {
		String chkUrl = requestUrl.toString();
		chkUrl = chkUrl.substring(0, chkUrl.lastIndexOf("/")).replaceAll("http://","");;

		String url = "http://"+chkUrl;
		return url;
	}

	/**
	 * process.jsp에서 처리 후 강제로 http로 변환 property.SiteProperty.COMPANY_URL을 SSL_USE에 따라 생성
	 * @return
	 */
	public static String getRemoviSslUrl() {
		String url = property.SiteProperty.COMPANY_URL;
		return url;
	}

	/**
	 * 파일사이즈 구하기
	 * @param realPath request.getRealPath
	 * @param fileName 파일명
	 * @return
	 */
	public static long getFileSize(String realPath, String fileName) {
		long fileSize = 0;
		try {
			if(!"".equals(checkNull(fileName))){
				File f = new File(realPath, fileName);
				fileSize = f.length();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return fileSize;
	}

	/**
	 * 파일 삭제
	 * @param realPath request.getRealPath
	 * @param fileName
	 */
	public static void fileDelete(String realPath, String fileName) {
		try {
			if(!"".equals(checkNull(fileName))){
				File f = new File(realPath, fileName);
				f.delete();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}

	/**
	 * 다운로드URL
	 * @param uploadPath
	 * @param name_org
	 * @param name
	 */
	public static String downloadUrl(String uploadPath, String name_org, String name) {
		String url = "/include/download.jsp?";
		try {
			if(!"".equals(checkNull(uploadPath))){
				url += "path="+uploadPath;
			}
			if(!"".equals(checkNull(name_org))){
				url += "&vf="+name_org;
			}
			if(!"".equals(checkNull(name))){
				url += "&af="+name;
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return url;
	}

	/**
	 * 레퍼러값 체크
	 * @param referer request.getHeader("referer")
	 * @return
	 */
	public static boolean checkReferer(String referer) {
		boolean result = false;
		referer = getReqParameter(referer);
		if (property.SiteProperty.getCHECK_REFERER()) {
			if (referer.indexOf(property.SiteProperty.getREFERER_URL()) > 0) {
				result = true;
			}
		} else {
			result = true;
		}
		return result;
	}

	/**
	 * 우편번호에 하이픈붙이기
	 * @param zipcode String
	 * @return newzipcode String
	 */
	public static String zipcodeHypen(String zipcode) {
		String newzip = "";
		newzip = zipcode.substring(0, 3);
		newzip = newzip + "-" + zipcode.substring(3, 6);
		return newzip;
	}

	/**
	 * UTF8로 인코딩
	 * @param val
	 * @return
	 */
	public static String encodeUTF8(String val) {
		String result = "";
		try {
			result = URLEncoder.encode(val, "UTF-8");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	/**
	 * 스팸체크 문자 생성
	 * @param checkpage String
	 * @return String
	 */
	public static String boardspamchk(String checkpage) {
		Random oRandom = new Random();
		String str;
		if (checkpage == "boardupformchk")
		{
			// 대문자 매칭
			int ascno1 = oRandom.nextInt(25) + 65;
			str = String.format ( "%c" ,(char) ascno1);

			// 소문자 매칭
			int ascno2 = oRandom.nextInt(25) + 65;
			str = str+String.format ( "%c" ,(char) ascno2);

			// 일부 특수문자 매칭
			int ascno3 = oRandom.nextInt(3) + 49;
			str = str+String.format ( "%c" ,(char) ascno3);

			// 숫자 매칭
			int ascno4 = oRandom.nextInt(8) + 49;
			str = str+String.format ( "%c" ,(char) ascno4);

			int ascno5 = oRandom.nextInt(25) + 65;
			str = str+String.format ( "%c" ,(char) ascno5);

			return str;
		} else {
			return "error";
		}
	}
		
	/**
	 * 관리자 SMS발송 여부 체크
	 * @param chk String
	 * @param startTime String
	 * @param endTime String
	 * @return boolean
	 */
	public static boolean timeLimit(String chk, String start, String end){
		boolean tf = false;
		if(chk.equals("0")){
			tf = true;
		} else {
			Calendar cal = Calendar.getInstance();
			int time = cal.get(Calendar.HOUR_OF_DAY);
			int sTime = Integer.parseInt(start.substring(0,2));
			int eTime = Integer.parseInt(end.substring(0,2));
			
			if(sTime <= time && time <= eTime){
				tf = true;
			}
		}
		return tf;
	}
	
	
	/**
	 * 정규식 치환, 에디터에서 img, br태그 닫힘 없이 생성되는것 닫힘 태그 추가하기
	 * regex에 배열로 정규식 추가
	 * rpl에 정규식으로 검색된것 치환 값 배열로 담기 
	 * @param str String
	 * @return String
	 */
	public static String RegexReplace(String str){
		str = checkNull(str);

		String[] regex 	= {"<([br|BR].*?)(([/]*|)>)", "(<[imgIMG].*?)(([/]*|)>)"};		// 정규식
		String[] rpl	= {"<$1/>", "$1 />"};			// 변환될 텍스트
		
		Pattern p = null;
		
		for(int i = 0; i < regex.length; i++){
			p = Pattern.compile(regex[i]);
			Matcher m = p.matcher(str);
			str = m.replaceAll(rpl[i]);
		}
		
		return str;
	}
	
	/**
	 * 랜덤 코드 생성 Math.random()
	 * @param str String
	 * @return String
	 */
	public static String randomNumber(String str){
		str = checkNull(str);
		String sr = "";
		for(int i=1; i <= 2; i++){
		char ch = (char)((Math.random()*26)+65);
		sr += ch;
		}
		
		String num = "";
		for(int i=1; i <= 2; i++){
		int n =	(int) Math.round(Math.random()*9);
		num += n;
		}
		
		if("".equals(str)){
			 
			String today = DateUtil.getToday();
			String[] todays = today.split("-");
			
			str = todays[0]+sr+todays[1]+num+todays[2];
		}else{
			str += sr+num;
		}
		
		
		
		return str;
	}
	
	public static String getNumberFormat(int var) {
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		return nf.format(var);
	}
	
	public static String getNumberFormat(long var) {
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		return nf.format(var);
	}
	
	public static String getDollarFormat(long var) {

		int unit = 3;
		
		String dollar = String.valueOf(var);
		int length = dollar.length();
		
		int dot = length / unit;
		
		StringBuffer sb = new StringBuffer();
		
		for(int i=0; i < length; i++){
			sb.append(dollar.substring(i,i+1));
			
			if(i == (length - 1)){break;}
			if((i+1) % unit == dot){sb.append(",");}
		}
		
		return sb.toString();
	}
	
	
	//content 에서 첫번째 이미지 목록이미지에 삽입
		public static String RegexImgIgnore(String str){
			String rtn = "";
			Pattern pattern = Pattern.compile("<img(\\s+[a-zA-Z0-9_]*=[^>]*)*(\\s)*(/)?>");
			Matcher matcher = pattern.matcher(str);
			ArrayList<String> imgTagList = new ArrayList<String>();
			while(matcher.find()){
				imgTagList.add(str.substring(matcher.start(),matcher.end()));
			}
			
			Pattern imgSrcPattern = Pattern.compile("src[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣(~!@#$%^&)_.\\-%&=?!:;@\"'/]*(.gif|.jpg|.png|.jpeg|.GIF|.JPG|.PNG|.JPEG)");
			if(imgTagList.size() > 0){
				String imgSrcValue = "";
				matcher = imgSrcPattern.matcher(imgTagList.get(0));
				while(matcher.find()){
					imgSrcValue = imgTagList.get(0).substring(matcher.start(),matcher.end());
				}
				
				Pattern imgUrlPattern = Pattern.compile("/[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣(~!@#$%^&)_.\\-%&=?!:;@\"'/]*(.gif|.jpg|.png|.jpeg|.GIF|.JPG|.PNG|.JPEG)");
				if(!"".equals(imgSrcValue)){
					matcher = imgUrlPattern.matcher(imgSrcValue);
					if(matcher.find()){
						rtn = imgSrcValue.substring(matcher.start(),matcher.end());
					}
				}
			}
			
			
			
		return rtn;		
		}
		
		
			       
		
		public static HashMap<String, Object> RegexImgIgnoreList(String str){
			String rtn = "";
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			ArrayList<String> imgTagList = new ArrayList<String>();
			ArrayList<String> imgTagList2 = new ArrayList<String>();
			ArrayList<String> imgTagList3 = new ArrayList<String>();
			
			ArrayList<String> textList = new ArrayList<String>();
			
			Pattern pattern = Pattern.compile("<img(\\s+[a-zA-Z0-9_]*=[^>]*)*(\\s)*(/)?>");
			Matcher matcher = pattern.matcher(str);
			
			int index = 0;
			int fir = 0;
			while(matcher.find()){
				
				imgTagList.add(str.substring(matcher.start(),matcher.end()));
				
				if(index > 0){
					textList.add(str.substring(fir,matcher.start()).replace("</p><p>&nbsp;</p>", ""));
				}
				
				fir = matcher.end();
				index++;
			}
			
			if(index > 0){
				textList.add(str.substring(fir,str.length()).replace("</p><p>&nbsp;</p>", ""));
			}else{
				textList.add(str);
			}
			
			Pattern imgSrcPattern = Pattern.compile("src[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣(~!@#$%^&)_.\\-%&=?!:;@\"'/]*(.gif|.jpg|.png|.jpeg|.GIF|.JPG|.PNG|.JPEG)");
			
			if(imgTagList.size() > 0){
				
				for(int i=0; i < imgTagList.size(); i++){
					
					matcher = imgSrcPattern.matcher(imgTagList.get(i));
					while(matcher.find()){
						imgTagList2.add(imgTagList.get(i).substring(matcher.start(),matcher.end()));
					}
				
				}
				
				Pattern imgUrlPattern = Pattern.compile("/[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣(~!@#$%^&)_.\\-%&=?!:;@\"'/]*(.gif|.jpg|.png|.jpeg|.GIF|.JPG|.PNG|.JPEG)");
				
				if(imgTagList2.size() > 0){
					
					for(int a=0; a < imgTagList2.size(); a++){
						matcher = imgUrlPattern.matcher(imgTagList2.get(a));
						if(matcher.find()){
							imgTagList3.add(imgTagList2.get(a).substring(matcher.start(),matcher.end()));
						}
					}
					
				}
			}
			
			map.put("imgTagList", imgTagList3);
			map.put("textList", textList);
			
		return map;		
		}
		// 문자열 포함여부 확인 후 출력
		public static String getIndexOf(String org, String compare, String output) {
			String result = "";
			if (org != null && !"".equals(org)) {
				if (org.indexOf(compare) > -1) {
					result = output;
				}
			}
			return result;
		}
	
	/**
	 * 파일 확장자 테스트
	 * 파일 확장자가 jsp, asp, php, html, cab, exe, exec 일 경우 true 리턴 
	 * @param fname 파일명
	 * @return boolean
	 */
	public static boolean fileExtCheck(String fname){
		boolean test = false;
		
		if(checkNull(fname).equals("")){
			test = true;
		} else {
			int i = -1;
			if ((i = fname.indexOf(".")) != -1) {
				fname = fname.substring(i);
				
				if(fname.toUpperCase().matches("\\.?(JSP|ASP|PHP|HTML|CAB|EXE|EXEC|JS)")){
					test =  true;
				} else {
					test = false;
				}
			} else {
				test = true;
			}
			
		}
		
		return test;
	}
	
	/**
	 * 컨트롤러 등록,수정,삭제 처리 후 메시지처리
	 * val이 0보다 클경우 앞메시지, 그렇지않을 경우 뒷메시지 리턴
	 * @param val
	 * @param trueMsg
	 * @param failMsg
	 * @return
	 */
	public static String message(int val, String trueMsg, String failMsg) {
		String msg = "";
		if (val > 0) {
			msg = trueMsg;
		} else {
			msg = failMsg;
		}
		return msg;
	}
	
	public static FileUtil fileUpload(HttpServletRequest request, String file_name, String upload_path, String real_path, String renameValue) {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get(file_name);
		if (!file.isEmpty()) {
			try {
				fu.upload(file, upload_path, real_path, renameValue);
			} catch (IOException e) {
				System.out.println("IOException:"+e.toString());
				e.printStackTrace();
			}
		}
		return fu;
	}
		
	public static void main(String[] args)throws Exception{
//		System.out.println(strCut("MONTBLANCＩTABLE_MONTBLANCBENCH_COCOROCHAIR", "", 30, 0, true, true));
//		System.out.println(strCut("한글은 어떻게 나올까 이렇게 저렇게", "", 30, 0, true, true));
		System.out.println(randomNumber("movie"));
	}
}
