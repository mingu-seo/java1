package movie;

import util.Parameter;

public class MovieVo extends Parameter {

	private int			no;						// 영화 일련번호
	private String	 	title;					// 영화 제목 
	private String 		director;				// 감독
	private String		genre;					// 장르
	private int			rating;					// 관람가
	private int			runtime;				// 상영시간
	private String		releaseDate;			// 개봉일
	private String		endDate;				// 상영종료일
	private String		poster;					// 포스터(메인)
	private int			display;				// 노출여부
	private String 		contents;				// 줄거리
	private String		registDate;				// 영화 DB 등록일 
	private String		poster_chk;				// 삭제할 때 받아올 파일이름값 		
	//검색조건
	private int			sdisplay;				// 노출여부 (-1:전체, 0:미노출, 1:노출)
	

	
	public MovieVo() {
		super.setPageRows(10);
		this.setSdisplay(-1);	// 검색기본값(전체)
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getSdisplay() {
		return sdisplay;
	}

	public void setSdisplay(int sdisplay) {
		this.sdisplay = sdisplay;
	}
	public String getPoster_chk() {
		
		return poster_chk ;
	}
	
	public void setPoster_chk(String poster_chk) {
		this.poster_chk = poster_chk;
	}
	

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	
}
