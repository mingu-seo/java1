package board.faq;

import util.Parameter;

public class FaqVO extends Parameter {

	private int			no;						// 글 번호
	private int		 	type;					// 종류
	private String 		question;					// 제목
	private String		answer;				// 내용
	private int 		prev_no;				// 이전글 no
	private int 		next_no;				// 다음글 no
	
	//검색조건
	
	public FaqVO() {
		super.setPageRows(10);
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
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
	
}
