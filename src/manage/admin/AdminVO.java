package manage.admin;

import java.sql.Timestamp;

import util.Parameter;

public class AdminVO extends Parameter {

	private int no;					// 번호
	private String id;				// 아이디
	private String password;		// 패스워드
	private String email;
	private String name;			// 이름
	private String memo;			// 메모
	private Timestamp registdate;	// 등록일
	
	private Timestamp logindate;	// 로그인일자
	private String ip;				// 접속 아이피
	private int prev_no;			// 이전글 no
	private int next_no;			// 다음글 no
	private String prev_title;		// 이전글 제목
	private String next_title;		// 다음글 제목

	public AdminVO() {
		super.setPageRows(10);
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public AdminVO(int pageRows) {
		super.setPageRows(pageRows);
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
	public String getTargetURLParam(String pageUrl, AdminVO param, int index) {

		StringBuffer strList= new StringBuffer();

		if (param != null) {
			strList.append(pageUrl);
			strList.append("?stype=" + param.getStype());
			strList.append("&sval="+param.getSval());
			strList.append("&reqPageNo="+param.getReqPageNo());
			if (index > 0) {
				strList.append("&no="+index);
			}
		}
		return strList.toString();
	}

	public int getNo() {
		return no;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getEmail() {
		return email;
	}
	public String getName() {
		return name;
	}
	public String getMemo() {
		return memo;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public Timestamp getLogindate() {
		return logindate;
	}
	public String getIp() {
		return ip;
	}
	public int getPrev_no() {
		return prev_no;
	}
	public int getNext_no() {
		return next_no;
	}
	public String getPrev_title() {
		return prev_title;
	}
	public String getNext_title() {
		return next_title;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public void setLogindate(Timestamp logindate) {
		this.logindate = logindate;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public void setPrev_no(int prev_no) {
		this.prev_no = prev_no;
	}
	public void setNext_no(int next_no) {
		this.next_no = next_no;
	}
	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}
	public void setNext_title(String next_title) {
		this.next_title = next_title;
	}

}
