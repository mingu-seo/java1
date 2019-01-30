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
	
	public ArrayList list(Ticket1VO param) throws SQLException {
		ArrayList list = ticket1Dao.list(param);
		return list;
	}
	public ArrayList date(Ticket1VO param) throws SQLException {
		ArrayList date = ticket1Dao.date(param);
		return date;
	}
	

	public ArrayList<Ticket1VO> aranMovieDate(int no) throws SQLException {
		ArrayList movieDate = ticket1Dao.aranMovieDate(no);
		return movieDate;
	}

	public Ticket1VO read(int no) throws Exception {
		Ticket1VO vo = ticket1Dao.read(no);
		return vo;
	}
	
	public int update(Ticket1VO vo) throws SQLException {
		int cnt = ticket1Dao.update(vo);
		return cnt;
	}
	
	public int delete(int no) throws SQLException {
		int cnt = ticket1Dao.delete(no);
		return cnt;
	}
	
}
