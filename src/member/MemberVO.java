package member;

import java.sql.Timestamp;

import util.Parameter;

public class MemberVO extends Parameter {

	private int no;			  //회원번호
	private String name;      //회원명
	private String birth;     //생년월일
	private String email;	  //이메일(id)
	private String pw;        //비밀번호
	private int gender;       //성별 "1=남자" "2=여자"
	private String hp;        //휴대폰번호
	private int point;        //영화 포인트
	private Timestamp credate;//회원 가입일
	private Timestamp moddate;//회원정보 수정일
	
	
	private String ip;				// 접속 아이피
	private int prev_no;			// 이전글 no
	private int next_no;			// 다음글 no
	private String prev_title;		// 이전글 제목
	private String next_title;		// 다음글 제목

	public MemberVO() {
		super.setPageRows(10);
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public MemberVO(int pageRows) {
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
	public String getTargetURLParam(String pageUrl, MemberVO param, int index) {

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
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getCredate() {
		return credate;
	}
	public void setCredate(Timestamp credate) {
		this.credate = credate;
	}
	public Timestamp getModdate() {
		return moddate;
	}
	public void setModdate(Timestamp moddate) {
		this.moddate = moddate;
	}
	
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
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
