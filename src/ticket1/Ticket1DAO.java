package ticket1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class Ticket1DAO extends SqlMapClientDAOSupport{

	public int count(Ticket1VO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("ticket1.count", param);
	}
	
	public int mypageCount(Ticket1VO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("ticket1.mypageCount", param);
	}
	
	public ArrayList list(Ticket1VO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.list", param);
	}
	
	public ArrayList mypageTicketList(Ticket1VO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.mypageTicketList", param);
	}
	
	public Ticket1VO read(int no) throws SQLException {
		return (Ticket1VO)getSqlMapClient().queryForObject("ticket1.read", no);
	}
	
	public int update(Ticket1VO vo) throws SQLException {
		return getSqlMapClient().update("ticket1.update", vo);
	}
	
	public int stateChange(int ticket_no) throws SQLException {
		return getSqlMapClient().update("ticket1.stateChange", ticket_no);
	}
	
	
	
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("ticket1.delete", no);
	}
	
	public ArrayList date(Ticket1VO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.date", param);
	}


	public int book(Ticket1VO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("ticket1.book", vo);
	}
	
	
	
	public ArrayList aranMovieDate(int no) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.aranMovieDate", no);
	}


	public int minusPoint(PointVo pv) throws SQLException {
		return (Integer)getSqlMapClient().insert("ticket1.minusPoint", pv);
	}
	
	public int plusPoint(PointVo pv) throws SQLException {
		return (Integer)getSqlMapClient().insert("ticket1.plusPoint", pv);
	}
	public int memberplusPoint(PointVo vo) throws SQLException {
		return getSqlMapClient().update("ticket1.plusPoint", vo);
	}

	public int minusMemberPoint(PointVo pv) throws SQLException {
		return (Integer)getSqlMapClient().update("ticket1.minusMemberPoint", pv);
	}

	public int plusMemberPoint(PointVo pv) throws SQLException {
		return (Integer)getSqlMapClient().update("ticket1.plusMemberPoint", pv);
	}

	
	
	public static void main(String[] args) throws SQLException {
		Ticket1DAO td = new Ticket1DAO();
		Ticket1VO tv = new Ticket1VO();
		PointVo pv = new PointVo();
	pv.setPoint_no(10);
	td.minusPoint(pv);
		
	}


	
	



}
