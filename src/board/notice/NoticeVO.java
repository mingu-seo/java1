package board.notice;

import java.sql.Timestamp;

import util.Parameter;

public class NoticeVO extends Parameter {

	private int			no;						// 글 번호
	private String	 	name;					// 작성자
	private String 		title;					// 글 제목
	private String		contents;				// 내용
	private Timestamp	registdate;				// 작성일
	private int 		readno;					// 조회수
	private String 		filename_org;			// 첨부파일 이름 [사용자]
	private String 		filename;				// 첨부파일 이름 [시스템 처리용]
	private long 		filesize;				// 첨부파일 크기
	private int			display;				// 노출여부
	
	private String 		filename_chk;
	private int 		prev_no;				// 이전글 no
	private int 		next_no;				// 다음글 no
	private String 		prev_title;				// 이전글 제목
	private String 		next_title;				// 다음글 제목
	
	//검색조건
	private int			sdisplay;				// 노출여부 (-1:전체, 0:미노출, 1:노출)
	
	public NoticeVO() {
		super.setPageRows(10);
		this.setSdisplay(-1);	// 검색기본값(전체)
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public int getSdisplay() {
		return sdisplay;
	}

	public void setSdisplay(int sdisplay) {
		this.sdisplay = sdisplay;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}

	public int getReadno() {
		return readno;
	}

	public void setReadno(int readno) {
		this.readno = readno;
	}

	public String getFilename_chk() {
		return filename_chk;
	}

	public void setFilename_chk(String filename_chk) {
		this.filename_chk = filename_chk;
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

	public String getFilename_org() {
		return filename_org;
	}

	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
}
