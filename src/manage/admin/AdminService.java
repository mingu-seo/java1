package manage.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDao;
	
	public int[] count(AdminVO param) throws SQLException {
		int rowCount = adminDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(AdminVO param) throws SQLException {
		ArrayList list = adminDao.list(param);
		return list;
	}

	public int insert(AdminVO vo) throws SQLException {
		int no = adminDao.insert(vo);
		return no;
	}

	public int update(AdminVO vo) throws SQLException {
		int cnt = adminDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = adminDao.delete(no);
		return cnt;
	}

	public AdminVO read(int no) throws SQLException {
		AdminVO vo = adminDao.read(no);
		return vo;
	}

	public boolean loginCheck(AdminVO param) throws SQLException {
		int cnt = adminDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}

	public AdminVO getLoginSessionInfo(AdminVO param) throws SQLException {
		AdminVO vo = adminDao.getLoginSessionInfo(param);
		vo.setIp(param.getIp());	// 아이피 추가
		return vo;
	}

	public int[] countLoginHistory(AdminVO param) throws SQLException {
		int rowCount = adminDao.countLoginHistory(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList listLoginHistory(AdminVO param) throws SQLException {
		ArrayList list = adminDao.listLoginHistory(param);
		return list;
	}

	public void insertLoginHistory(AdminVO param) throws SQLException {
		adminDao.insertLoginHistory(param);
	}

	public int idcheck(AdminVO param) throws SQLException {
		return adminDao.idcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += adminDao.delete(nos);
		}
		return r;
	}
	
}
