package review;

import java.sql.Timestamp;

import util.Parameter;

public class ReviewVO extends Parameter {

	private int			no;						// 글 번호
	private String		movie_pk;					// 종류
	private String 		member_pk;					// 제목
	private String		contents;				// 내용
	private Timestamp	cre_date;				// 작성일
	private int			score;					// 점수
	
	private int 		prev_no;				// 이전글 no
	private int 		next_no;				// 다음글 no
	private int			smovie_pk;
	private String 		member_name;
	
	//검색조건
	
	public ReviewVO() {
		super.setPageRows(10);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getMovie_pk() {
		return movie_pk;
	}

	public void setMovie_pk(String movie_pk) {
		this.movie_pk = movie_pk;
	}

	public String getMember_pk() {
		return member_pk;
	}

	public void setMember_pk(String member_pk) {
		this.member_pk = member_pk;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getCre_date() {
		return cre_date;
	}

	public void setCre_date(Timestamp cre_date) {
		this.cre_date = cre_date;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
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

	public int getSmovie_pk() {
		return smovie_pk;
	}

	public void setSmovie_pk(int smovie_pk) {
		this.smovie_pk = smovie_pk;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	
	
	
}
