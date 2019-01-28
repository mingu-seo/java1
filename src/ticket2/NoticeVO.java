package ticket2;

import java.sql.Timestamp;

import util.Parameter;

public class NoticeVO extends Parameter {

	private int			no;						// 글 번호
	private int		 	type;					// 종류
	private String 		title;					// 제목
	private String		contents;				// 내용
	private Timestamp	cre_date;				// 작성일
	private int 		readno;					// 조회수
	private String		writer;					// 작성자
	private String		writer_name;
	private int			display;					// 노출여부
	private String 		filename_org;			// 첨부파일 이름 [사용자]
	private String 		filename;				// 첨부파일 이름 [시스템 처리용]
	private long 		filesize;				// 첨부파일 크기
	
	private String 		filename_chk;
	private String 		filename_org2;			// 첨부파일 이름 [사용자]
	private String 		filename2;				// 첨부파일 이름 [시스템 처리용]
	private long 		filesize2;				// 첨부파일 크기
	
	private String 		filename_chk2;
	private int 		prev_no;				// 이전글 no
	private int 		next_no;				// 다음글 no
	private String 		prev_title;				// 이전글 제목
	private String 		next_title;				// 다음글 제목
	
	//검색조건
	private int 		sdisplay;
	   
	public NoticeVO() {
		super.setPageRows(10);
		this.setSdisplay(-1);	// 검색기본값(전체)
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public Timestamp getCre_date() {
		return cre_date;
	}

	public void setCre_date(Timestamp cre_date) {
		this.cre_date = cre_date;
	}

	public int getReadno() {
		return readno;
	}

	public void setReadno(int readno) {
		this.readno = readno;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWriter_name() {
		return writer_name;
	}
	
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
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

	public String getFilename_chk() {
		return filename_chk;
	}

	public void setFilename_chk(String filename_chk) {
		this.filename_chk = filename_chk;
	}
	public String getFilename_org2() {
		return filename_org2;
	}
	
	public void setFilename_org2(String filename_org2) {
		this.filename_org2 = filename_org2;
	}
	
	public String getFilename2() {
		return filename2;
	}
	
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	
	public long getFilesize2() {
		return filesize2;
	}
	
	public void setFilesize2(long filesize2) {
		this.filesize2 = filesize2;
	}
	
	public String getFilename_chk2() {
		return filename_chk2;
	}
	
	public void setFilename_chk2(String filename_chk2) {
		this.filename_chk2 = filename_chk2;
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
	public int getSdisplay() {
		return sdisplay;
	}
	
	public void setSdisplay(int sdisplay) {
		this.sdisplay = sdisplay;
	}

	
	
	
}
