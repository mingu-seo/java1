package board.reply3;

import java.sql.Timestamp;

import property.SiteProperty;
import util.Parameter;

public class ReplyVO3 extends Parameter {

	private int no;
	private int member_fk;
	private int gno;
	private int ono;
	private int nested;
	private String password;
	private String name;
	private String email;
	private String title;
	private String contents;
	private String relation_url;
	private String imagename;
	private String imagename_org;
	private String imagename_alt;
	private String filename;
	private String filename_org;
	private long filesize;
	private Timestamp registdate;
	private String top;
	private String main;
	private String newicon;
	private int readno;
	private int secret;
	
	// DB
	private String member_name;
	private int prev_no;			// 이전글 no
	private int next_no;			// 다음글 no
	private String prev_title;		// 이전글 제목
	private String next_title;		// 다음글 제목
	private String filename_chk;
	private String imagename_chk;

	

	public ReplyVO3() {
		super.setPageRows(10);
	}
	/**
	 * 생성자 페이지로우수 세팅
	 * @param pageRows 페이지 로우수
	 */
	public ReplyVO3(int pageRows, String tablename) {
		super.setPageRows(pageRows);
		super.setTablename(tablename);
		super.setDb_encryption(SiteProperty.DB_ENCRYPTION);
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMember_fk() {
		return member_fk;
	}
	public void setMember_fk(int member_fk) {
		this.member_fk = member_fk;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getNested() {
		return nested;
	}
	public void setNested(int nested) {
		this.nested = nested;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getRelation_url() {
		return relation_url;
	}
	public void setRelation_url(String relation_url) {
		this.relation_url = relation_url;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public String getImagename_org() {
		return imagename_org;
	}
	public void setImagename_org(String imagename_org) {
		this.imagename_org = imagename_org;
	}
	public String getImagename_alt() {
		return imagename_alt;
	}
	public void setImagename_alt(String imagename_alt) {
		this.imagename_alt = imagename_alt;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilename_org() {
		return filename_org;
	}
	public void setFilename_org(String filename_org) {
		this.filename_org = filename_org;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public Timestamp getRegistdate() {
		return registdate;
	}
	public void setRegistdate(Timestamp registdate) {
		this.registdate = registdate;
	}
	public String getTop() {
		return top;
	}
	public void setTop(String top) {
		this.top = top;
	}
	public String getMain() {
		return main;
	}
	public void setMain(String main) {
		this.main = main;
	}
	public String getNewicon() {
		return newicon;
	}
	public void setNewicon(String newicon) {
		this.newicon = newicon;
	}
	public int getReadno() {
		return readno;
	}
	public void setReadno(int readno) {
		this.readno = readno;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
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
	public String getFilename_chk() {
		return filename_chk;
	}
	public void setFilename_chk(String filename_chk) {
		this.filename_chk = filename_chk;
	}
	public String getImagename_chk() {
		return imagename_chk;
	}
	public void setImagename_chk(String imagename_chk) {
		this.imagename_chk = imagename_chk;
	}

	
}
