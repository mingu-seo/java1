package ticket1;

import util.Parameter;
import java.sql.Timestamp;

import member.MemberVO;

public class Ticket1VO extends Parameter{
	private int no;
	private int movie_pk;
	private int member_pk;
	private Timestamp cancle_date;
	private Timestamp res_date;
	private String price;
	private int pay;
	private int tk_count;
	private int format;
	private String screen_date;
	private int screen_time;
	private int pay_state;
	private int res_state;
	private String today;
	
	
	private int prev_no;			// 이전글 no
	private int next_no;			// 다음글 no
	private String prev_title;		// 이전글 제목
	private String next_title;		// 다음글 제목
	
	public Ticket1VO() {
		super.setPageRows(10);
	}
	public Ticket1VO(int pageRows) {
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
	public int getMovie_pk() {
		return movie_pk;
	}
	public void setMovie_pk(int movie_pk) {
		this.movie_pk = movie_pk;
	}
	public int getMember_pk() {
		return member_pk;
	}
	public void setMember_pk(int member_pk) {
		this.member_pk = member_pk;
	}
	public Timestamp getCancle_date() {
		return cancle_date;
	}
	public void setCancle_date(Timestamp cancle_date) {
		this.cancle_date = cancle_date;
	}
	public Timestamp getRes_date() {
		return res_date;
	}
	public void setRes_date(Timestamp res_date) {
		this.res_date = res_date;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getTk_count() {
		return tk_count;
	}
	public void setTk_count(int tk_count) {
		this.tk_count = tk_count;
	}
	public int getFormat() {
		return format;
	}
	public void setFormat(int format) {
		this.format = format;
	}
	public String getScreen_date() {
		return screen_date;
	}
	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}
	public int getScreen_time() {
		return screen_time;
	}
	public void setScreen_time(int screen_time) {
		this.screen_time = screen_time;
	}
	public int getPay_state() {
		return pay_state;
	}
	public void setPay_state(int pay_state) {
		this.pay_state = pay_state;
	}
	public int getRes_state() {
		return res_state;
	}
	public void setRes_state(int res_state) {
		this.res_state = res_state;
	}
	public int getPrev_no() {
		return prev_no;
	}
	public void setPrev_no(int prev_no) {
		this.prev_no = prev_no;
	}
	public int getNext_no() {
		return next_no;
	}
	public void setNext_no(int next_no) {
		this.next_no = next_no;
	}
	public String getPrev_title() {
		return prev_title;
	}
	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}
	public String getNext_title() {
		return next_title;
	}
	public void setNext_title(String next_title) {
		this.next_title = next_title;
		
	}
	
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	
	}
