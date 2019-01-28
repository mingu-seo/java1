package ticket1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import member.MemberVO;

@Repository
public class Ticket1DAO extends SqlMapClientDAOSupport{

	public int count(Ticket1VO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("ticket1.count", param);
	}
	
	
	public ArrayList list(Ticket1VO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.list", param);
	}
	public ArrayList date(Ticket1VO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("ticket1.date", param);
	}
}
