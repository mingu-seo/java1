package ticket1;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import db.SqlMapClientDAOSupport;
import util.Function;
import util.Page;

@Service
public class Ticket1Service extends SqlMapClientDAOSupport{
	
	@Autowired
	private Ticket1DAO ticket1Dao;
	
	public int[] count(Ticket1VO param) throws SQLException {
		int rowCount = ticket1Dao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public int[] mypageCount(Ticket1VO vo) throws SQLException{
		int rowCount = ticket1Dao.mypageCount(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	
	public ArrayList list(Ticket1VO param) throws SQLException {
		ArrayList list = ticket1Dao.list(param);
		return list;
	}
	public ArrayList date(Ticket1VO param) throws SQLException {
		ArrayList date = ticket1Dao.date(param);
		return date;
	}
	
	public ArrayList mypageTicketList(Ticket1VO param) throws SQLException {
		ArrayList mypageTicketList = ticket1Dao.mypageTicketList(param);
		return mypageTicketList;
	}
	

	public ArrayList<Ticket1VO> aranMovieDate(int no) throws SQLException {
		ArrayList movieDate = ticket1Dao.aranMovieDate(no);
		return movieDate;
	}
	
	
	public Ticket1VO read(int no) throws Exception {
		Ticket1VO vo = ticket1Dao.read(no);
		return vo;
	}


	public int book(Ticket1VO param) throws SQLException {
		long num = System.currentTimeMillis();
		param.setRes_num(Long.toString(num));
		int lastNo = (Integer)ticket1Dao.book(param);
		return lastNo;
	}
	
	public int plusPoint2(int member_pk, HttpServletRequest request) throws SQLException {
		PointVo pv = new PointVo();
		pv.setMember_pk(member_pk);
		pv.setMemo("<" + request.getParameter("title") + ">"+ " 예매 포인트 적립");
		pv.setUsePoint(Function.getIntParameter((request.getParameter("price")))*10/100);
		
		int r = ticket1Dao.plusPoint2(pv);
		int r2 = ticket1Dao.plusMemberPoint(pv);
		
		return r;
	}
	
	public int minusPoint(int member_pk, HttpServletRequest request) throws SQLException {
		PointVo pv = new PointVo();
		pv.setMember_pk(member_pk);
		pv.setMemo("<" + request.getParameter("title") + ">" + " 예매 시 포인트 사용");
		pv.setUsePoint((-1)*Function.getIntParameter((request.getParameter("usePoint"))));
		
		int r = ticket1Dao.minusPoint(pv);
		int r2 = ticket1Dao.minusMemberPoint(pv);
		
		return r;
	}
	
	
//	public int update(Ticket1VO vo) throws SQLException {
//		int cnt = ticket1Dao.update(vo);
//		return cnt;
//	}

	public int update(Ticket1VO vo) throws SQLException {
		int cnt = ticket1Dao.update(vo);
		return cnt;
	}
	
	// 예매 취소 처리
	public void cancel(Ticket1VO vo, PointVo pvo) throws SQLException {
		Ticket1VO data = ticket1Dao.read(vo.getNo());
		
		// 무조건 실행
		ticket1Dao.stateChange(data);	// 상태변경
		
		
		// 사용포인트가 존재하는 경우에만
		if (data.getUsePoint() > 0) {
			pvo.setMemo("영화 취소로 인한 사용포인트 환불");
			ticket1Dao.minusMemberPoint(pvo);							//예매시 사용한 포인트 환불 (member테이블 + 사용포인트)
			ticket1Dao.minusPoint(pvo);
		}
		
		if(data.getPay_state()==1) {	// 결제완료상태일때만
			pvo.setMemo("영화 취소로 인한 적립포인트 회수");
			pvo.setUsePoint((data.getPrice()*10)/100);
			ticket1Dao.plusMemberPoint(pvo);		//결제시 결제금액의 10% 차감 (member테이블 - 적립포인트)
			pvo.setUsePoint(pvo.getUsePoint()*-1);
			ticket1Dao.minusPoint(pvo);									//포인트 기록
		}
	}
	
	/*
	public int plusPoint(Ticket1VO vo) throws SQLException{
		int cnt = ticket1Dao.plusPoint(vo);
		return cnt;
	}
	*/
	
	public int delete(int no) throws SQLException {
		int cnt = ticket1Dao.delete(no);
		return cnt;
	}


	
	public int aranplusMemberPoint(int member_pk, HttpServletRequest request) throws SQLException {
		PointVo pv = new PointVo();
		pv.setMember_pk(member_pk);
		pv.setMemo("<" + request.getParameter("title") + ">"+ " 예매 포인트 적립");
		pv.setUsePoint(Function.getIntParameter((request.getParameter("price")))*10/100);
		
		int r = ticket1Dao.plusPoint2(pv);
		int r2 = ticket1Dao.aranplusMemberPoint(pv);
		
		return r;
	}
}
