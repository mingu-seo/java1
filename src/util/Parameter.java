package util;

/**
 * 모든 파라미터 클래스의 상속클래스
 * 기본적인 요청페이지, 페이지로우수, 시작페이지, 검색어타입, 검색어, 정렬값을 가짐.
 * @author withsky
 *
 */
public class Parameter {

	private int reqPageNo;			// 요청페이지번호
	private int pageRows;			// 페이지로우수
	private int startPageNo;		// limit 시작페이지
	private String tablename;		// 테이블명
	private String comment_tablename;	// 댓글 테이블명
	private String category_tablename;	// 카테고리 테이블명
	private int	comment_count;		// 댓글수

	private String stype;			// 검색타입
	private String sval;			// 검색어
	private int	sbranch_fk;
		
	private String smain;	

	private String ordertype;		// 정렬필드
	private String orderby;			// 정렬값(asc, desc)

	private String cmd;				// process.jsp command값

	private String db_encryption;	// 암호화방식
	private String uploadPath;		// 파일업로드경로(RealPath)

	private int email_send;			// 메일 보내기(0=미발신,1=발송)
	private int sms_send;			// sms 보내기(0=미발신,1=발송)

	private int number;				// 게시물갯수
	private int rownum;				// 로우넘 (이전글, 다음글을 구하기 위함)
	
	private String email_regexp;	// 이메일 정규식
	private String sms_regexp0;		// sms 정규식
	private String sms_regexp1;		// sms 정규식
	
	/**
	 *  검색조건 파라미터
	 *  read에서 index등으로 검색조건 그대로 이동할때
	 *  답글작성 후 다시 read페이지로 돌아갈때 no가 필요하므로 index값 설정
	 *  그 외 필요한 값들은 각 VO에 세팅할 것.
	 * @param pageUrl target URL
	 * @param param Parameter
	 * @param index no값필요시
	 * @return String
	 */
	public String getTargetURLParam(String pageUrl, Parameter param, int index) {

		StringBuffer strList= new StringBuffer();

		if (param != null) {
			strList.append(pageUrl);
			strList.append("?reqPageNo="+param.getReqPageNo());
			
			if(param.getSbranch_fk() > 0){
				strList.append("&sbranch_fk="+param.getSbranch_fk());
			}
			
			if(!"".equals(Function.checkNull(param.getStype()))){
				strList.append("&stype=" + param.getStype());
			}
			if(!"".equals(Function.checkNull(param.getSval()))){
				strList.append("&sval="+param.getSval());
			}
			if(!"".equals(Function.checkNull(param.getSmain()))){
				strList.append("&smain="+param.getSmain());
			}
			if(!"".equals(Function.checkNull(param.getCmd()))){
				strList.append("&cmd="+param.getCmd());
			}
			if (index > 0) {
				strList.append("&no="+index);
			}
		}
		return strList.toString();
	}
	
	/**
	 *  검색조건 파라미터
	 *  read에서 index등으로 검색조건 그대로 이동할때
	 *  답글작성 후 다시 read페이지로 돌아갈때 no가 필요하므로 index값 설정
	 *  그 외 필요한 값들은 각 VO에 세팅할 것.
	 * @param pageUrl target URL
	 * @param param Parameter
	 * @param index no값필요시
	 * @return String
	 */
	public String getTargetURLParamNoCmd(String pageUrl, Parameter param, int index) {

		StringBuffer strList= new StringBuffer();

		if (param != null) {
			strList.append(pageUrl);
			strList.append("?reqPageNo="+param.getReqPageNo());
			
			if(param.getSbranch_fk() > 0){
				strList.append("&sbranch_fk="+param.getSbranch_fk());
			}
			
			if(!"".equals(Function.checkNull(param.getStype()))){
				strList.append("&stype=" + param.getStype());
			}
			if(!"".equals(Function.checkNull(param.getSval()))){
				strList.append("&sval="+param.getSval());
			}
			if(!"".equals(Function.checkNull(param.getSmain()))){
				strList.append("&smain="+param.getSmain());
			}
			if (index > 0) {
				strList.append("&no="+index);
			}
		}
		return strList.toString();
	}

	/**
	 * 초기값 세팅
	 */
	public Parameter() {
		stype = "";
		sval = "";
		orderby = "";
		ordertype = "";
		reqPageNo = 1;
		smain = "";
		email_regexp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+[a-zA-Z0-9\\-]+[a-zA-Z0-9]+\\.[a-zA-Z]+$";
		sms_regexp0 = "^01([016789]{1})+(-[0-9]{3,4})+(-[0-9]{4})$";
		sms_regexp1 = "^01([016789]{1})+([0-9]{3,4})+([0-9]{4})$";		
	}

	/**
	 * 정렬필드
	 * @return
	 */
	public String getOrdertype() {
		return ordertype;
	}

	/**
	 * 정렬값 desc / asc
	 * @param ordertype
	 */
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}

	/**
	 * get 정렬값
	 * @return String
	 */
	public String getOrderby() {
		return orderby;
	}

	/**
	 * set 정렬값
	 * @param orderby String
	 */
	//예매율정렬값
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	/**
	 * get startPageNo (limit 시작값)
	 * @return int
	 */
	public int getStartPageNo() {
		startPageNo = (reqPageNo-1)*pageRows;
		return startPageNo;
	}

	/**
	 * set startPageNo (limit 시작값)
	 * @param startPageNo int
	 */
	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	/**
	 * get reqPageNo
	 * @return int
	 */
	public int getReqPageNo() {
		return reqPageNo;
	}

	/**
	 * set reqPageNo
	 * @param reqPageNo int
	 */
	public void setReqPageNo(int reqPageNo) {
		this.reqPageNo = reqPageNo;
	}

	/**
	 * get pageRows
	 * @return int
	 */
	public int getPageRows() {
		return pageRows;
	}

	/**
	 * set pageRows
	 * @param pageRows int
	 */
	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}

	/**
	 * get stype
	 * @return String
	 */
	public String getStype() {
		return stype;
	}

	/**
	 * set stype
	 * @param stype String
	 */
	public void setStype(String stype) {
		this.stype = stype;
	}

	/**
	 * get sval
	 * @return String
	 */
	public String getSval() {
		return sval;
	}

	/**
	 * set sval
	 * @param sval String
	 */
	public void setSval(String sval) {
		this.sval = sval;
	}

	public int getSbranch_fk() {
		return sbranch_fk;
	}

	public void setSbranch_fk(int sbranch_fk) {
		this.sbranch_fk = sbranch_fk;
	}

	

	

	public String getCmd() {
		return cmd;
	}

	public void setCmd(String cmd) {
		this.cmd = cmd;
	}

	public String getDb_encryption() {
		return db_encryption;
	}

	public void setDb_encryption(String db_encryption) {
		this.db_encryption = db_encryption;
	}

	public String getTablename() {
		return tablename;
	}

	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	public String getComment_tablename() {
		return comment_tablename;
	}

	public void setComment_tablename(String comment_tablename) {
		this.comment_tablename = comment_tablename;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getCategory_tablename() {
		return category_tablename;
	}

	public void setCategory_tablename(String category_tablename) {
		this.category_tablename = category_tablename;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getEmail_send() {
		return email_send;
	}

	public void setEmail_send(int email_send) {
		this.email_send = email_send;
	}

	public int getSms_send() {
		return sms_send;
	}

	public void setSms_send(int sms_send) {
		this.sms_send = sms_send;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getSms_regexp0() {
		return sms_regexp0;
	}
	public void setSms_regexp0(String sms_regexp0) {
		this.sms_regexp0 = sms_regexp0;
	}
	public String getSms_regexp1() {
		return sms_regexp1;
	}
	public void setSms_regexp1(String sms_regexp1) {
		this.sms_regexp1 = sms_regexp1;
	}
	public String getEmail_regexp() {
		return email_regexp;
	}
	public void setEmail_regexp(String email_regexp) {
		this.email_regexp = email_regexp;
	}

	public String getSmain() {
		return smain;
	}

	public void setSmain(String smain) {
		this.smain = smain;
	}

}