package member;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.Page;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDao;
	
	public int[] count(MemberVO param) throws SQLException {
		int rowCount = memberDao.count(param);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MemberVO param) throws SQLException {
		ArrayList list = memberDao.list(param);
		return list;
	}

	public int insert(MemberVO vo) throws SQLException {
		int no = memberDao.insert(vo);
		return no;
	}
	
	public int update(MemberVO vo) throws SQLException {
		int cnt = memberDao.update(vo);
		return cnt;
	}

	public int delete(int no) throws SQLException {
		int cnt = memberDao.delete(no);
		return cnt;
	}

	public MemberVO read(int no) throws SQLException {
		MemberVO vo = memberDao.read(no);
		return vo;
	}

//	public boolean loginCheck(MemberVO param) throws SQLException {
//		int cnt = memberDao.loginCheck(param);
//		boolean result = false;
//		if (cnt == 1) {
//			result = true;
//		}
//		return result;
//	}
//
//	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
//		MemberVO vo = memberDao.getLoginSessionInfo(param);
//		vo.setIp(param.getIp());	// 아이피 추가
//		return vo;
//	}
//
//	public int[] countLoginHistory(MemberVO param) throws SQLException {
//		int rowCount = memberDao.countLoginHistory(param);
//		int[] rowPageCount = new int[2];
//		int pageCount = Page.getPageCount(param.getPageRows(), rowCount);
//		rowPageCount[0] = rowCount;
//		rowPageCount[1] = pageCount;
//		return rowPageCount;
//	}
//
//	public ArrayList listLoginHistory(MemberVO param) throws SQLException {
//		ArrayList list = memberDao.listLoginHistory(param);
//		return list;
//	}
//
//	public void insertLoginHistory(MemberVO param) throws SQLException {
//		memberDao.insertLoginHistory(param);
//	}
//
	public int emailcheck(MemberVO param) throws SQLException {
		return memberDao.emailcheck(param);
	}

	public int groupDelete(HttpServletRequest request) throws SQLException {
		String[] no = request.getParameterValues("no");
		int r = 0;
		for (int i=0; i<no.length; i++) {
			int nos = Integer.parseInt(no[i]);
			r += memberDao.delete(nos);
		}
		return r;
	}
	
}