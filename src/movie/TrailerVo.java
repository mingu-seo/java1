package movie;

public class TrailerVo {
	private int no;  // 트레일러 일련번호 
	private int movie_no;  // 영화 일련번호
	private String trailer1; // 트레일러 - Youtube url 주소가 db에 들어감.
	private String trailer2;
	private String trailer3;
	private String trailer4;
	private String trailer5;
	private String trailer6;
	
	public TrailerVo() {}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getTrailer1() {
		return trailer1;
	}
	public void setTrailer1(String trailer1) {
		this.trailer1 = trailer1;
	}
	public String getTrailer2() {
		return trailer2;
	}
	public void setTrailer2(String trailer2) {
		this.trailer2 = trailer2;
	}
	public String getTrailer3() {
		return trailer3;
	}
	public void setTrailer3(String trailer3) {
		this.trailer3 = trailer3;
	}
	public String getTrailer4() {
		return trailer4;
	}
	public void setTrailer4(String trailer4) {
		this.trailer4 = trailer4;
	}
	public String getTrailer5() {
		return trailer5;
	}
	public void setTrailer5(String trailer5) {
		this.trailer5 = trailer5;
	}
	public String getTrailer6() {
		return trailer6;
	}
	public void setTrailer6(String trailer6) {
		this.trailer6 = trailer6;
	}
	
}
