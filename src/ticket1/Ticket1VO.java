package ticket1;

import util.Parameter;
import java.sql.Timestamp;

import member.MemberVO;

public class Ticket1VO extends Parameter{
	private int no;
	private int movie_pk;			//영화 pk
	private int member_pk;			//회원번호 pk
	private Timestamp cancel_date;	//취소일
	private Timestamp res_date;		//예매일
	private String price;			//금액
	private int pay;				//결제
	private int tk_count;			//티켓수
	private int format;				//영화포멧
	private String screen_date;		//상영일
	private int screen_time;		//상영시간
	private int pay_state;			//결제상태
	private int res_state;			//예매상태
	private String res_num;			//예매번호
	private String today;
	private int yoil;
	private int usePoint;
	
	private String movie_poster;	//영화포스터
	public int getUsePoint() {
		return usePoint;
	}


	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	private String movie_title;
	private String movie_format;
	private String member_name;
	
	//검색조건
	private String dateType;		//날짜 타입
	private String sdate;			//시작일
	private String edate;			//종료일
	private int spay_state;			//결제상태
	private int sres_state;			//예매상태
	private int spay;				//결제수단
	private int prev_no;			// 이전글 no
	private int next_no;			// 다음글 no
	private String prev_title;		// 이전글 제목
	private String next_title;		// 다음글 제목
	
	public Ticket1VO() {
		super.setPageRows(10);
		this.setSdate("");
		this.setEdate("");
		this.setSres_state(0);
		this.setSpay_state(0);
		this.setSpay(0);
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
	public Timestamp getCancel_date() {
		return cancel_date;
	}
	public void setCancel_date(Timestamp cancel_date) {
		this.cancel_date = cancel_date;
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
	public String getRes_num() {
		return res_num;
	}
	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_format() {
		return movie_format;
	}
	public void setMovie_format(String movie_format) {
		this.movie_format = movie_format;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
		
	}
	
	public String getDateType() {
		return dateType;
	}
	public void setDateType(String dateType) {
		this.dateType = dateType;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	
	public int getSpay_state() {
		return spay_state;
	}
	public void setSpay_state(int spay_state) {
		this.spay_state = spay_state;
	}
	public int getSres_state() {
		return sres_state;
	}
	public void setSres_state(int sres_state) {
		this.sres_state = sres_state;
	}
	public int getSpay() {
		return spay;
	}
	public void setSpay(int spay) {
		this.spay = spay;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public int getYoil() {
		return yoil;
	}
	public void setYoil(int yoil) {
		this.yoil = yoil;
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
	
	}
