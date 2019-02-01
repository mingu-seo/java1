package ticket1;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import db.SqlMapClientDAOSupport;
import member.MemberVO;
import movie.MovieVo;
import property.SiteProperty;
import util.FileUtil;
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
	
//	public int plusPoint(int member_pk, HttpServletRequest request) throws SQLException {
//		PointVo pv = new PointVo();
//		pv.setMember_pk(member_pk);
//	}
	
	public int minusPoint(int member_pk, HttpServletRequest request) throws SQLException {
		PointVo pv = new PointVo();
		pv.setMember_pk(member_pk);
		pv.setMemo(request.getParameter("title")+ " 예매시 포인트 사용");
		pv.setUsePoint((-1)*Function.getIntParameter((request.getParameter("usePoint"))));
		
		int r = ticket1Dao.minusPoint(pv);
		int r2 = ticket1Dao.minusMemberPoint(pv);
		
		return r;
	}
	
	public int plusPoint(int member_pk, HttpServletRequest request) throws SQLException {
		PointVo pv = new PointVo();
		pv.setMember_pk(member_pk);
		pv.setMemo("매표 포인트 적립");
		pv.setUsePoint(Function.getIntParameter((request.getParameter("price")))*10/100);
		
		int r = ticket1Dao.plusPoint(pv);
		int r2 = ticket1Dao.plusMemberPoint(pv);
		
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
	
	public int resStateUpdate(Ticket1VO vo) throws SQLException {
		int cnt = ticket1Dao.resStateUpdate(vo);
		return cnt;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = ticket1Dao.delete(no);
		return cnt;
	}
}
