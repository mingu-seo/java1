package property;

public class SiteProperty {
	/*
	 * 기본정보
	 */
	/**
	 * 업체명
	 */
	public static final String 	COMPANY_NAME			= "MOVIE";
	/**
	 * 관리자 시작페이지
	 */
	public static final String	INDEX_PAGE				= "/manage/board/notice/index.do";
	/**
	 * 회원 시작페이지
	 */
	public static final String	MOVIE_INDEX_PAGE		= "/index.do";
	/**
	 * 보안서버인증서(SSL)사용여부
	 */
	public static final boolean	SSL_USE					= false;
	/**
	 * URL http
	 */
	public static final String 	COMPANY_URL				= "http://localhost";
//	public static final String 	COMPANY_URL_MO			= "http://m.bigbang";

	/**
	 * URL https SSL
	 */
	public static final String 	COMPANY_SSL_URL			= "https://localhost";
	public static final String 	COMPANY_SSL_URL_MO		= "https://localhost";
	
	/**
	 * JSP 파일경로위치
	 */
	public static final String	JSP_HOME				= "/WEB-INF/view";

	/**
	 * mysql 비밀번호 암호화 방식
	 * password, old_password, md5, sha
	 */
	public static final String	DB_ENCRYPTION			= "password";
	/**
	 * 대표 이메일
	 */
	public static final String 	COMPANY_EMAIL			= "withsky999@gmail.com";

	/*
	 * 메일관련
	 */
	/**
	 * 메일서버
	 */
	public static final String 	SMTP_HOST				= "smtp.naver.com";
	public static final String 	SMTP_PORT				= "465";
	/**
	 * 메일계정 아이디
	 */
	public static final String 	SMTP_USER				= "zebra_yun";
	/**
	 * 메일계정 패스워드
	 */
	public static final String 	SMTP_PASSWORD			= "Test123123!";
	/**
	 * 이메일 기본 폼
	 */
	public static final String 	EMAIL_FORM				= "/include/emailForm.jsp";

	/**
	 * 에디터 이미지 업로드 경로
	 */
	public static final String	EDITOR_UPLOAD_PATH		= "/upload/editor/";

	/**
	 * 에디터 이미지 업로드 용량제한
	 */
	public static final int		EDITOR_MAXSIZE 			= 10*1024*1024;

	/**
	 * 처리페이지 (process.jsp)에서 레퍼러(이전페이지값) 비교여부
	 */
	public static final boolean	CHECK_REFERER			= true;

	public static final String	REFERER_URL				= "localhost";

	public static boolean getCHECK_REFERER(){
		return CHECK_REFERER;
	}
	
	public static String getREFERER_URL(){
		return REFERER_URL;
	}
	
	// 파일업로드 경로
	/**
	 * 로컬 홈디렉토리경로 (실서버 변경 필요)
	 */
	public static final String REAL_PATH				= "E:\\Java\\workspace\\java1\\WebContent"; //아란 path
//	public static final String REAL_PATH				= "E:\\workspace\\java1\\WebContent";  //상윤 path
//	public static final String REAL_PATH				= "D:\\jsphome\\java1\\aran\\www";
																
	 /* 공지사항 첨부파일 경로
=======
//	public static final String REAL_PATH				= "D:\\jsphome\\java1\\tssu\\www";
>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git
	/**
	 * 공지사항 첨부파일 경로
>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git
	 */
	public static final String NOTICE_UPLOAD_PATH		= "/upload/notice/";
	public static final String REPLY_UPLOAD_PATH		= "/upload/reply/";
	public static final String MOVIE_UPLOAD_PATH		= "/upload/movie/";
	public static final String MEMBER_UPLOAD_PATH		= "/upload/member/";

}
