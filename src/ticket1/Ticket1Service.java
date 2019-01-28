package ticket1;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import db.SqlMapClientDAOSupport;
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
	
	public ArrayList list(Ticket1VO param) throws SQLException {
		ArrayList list = ticket1Dao.list(param);
		return list;
	}

	public ArrayList<Ticket1VO> aranMovieDate(int no) throws SQLException {
		ArrayList movieDate = ticket1Dao.aranMovieDate(no);
		return movieDate;
	}

}
