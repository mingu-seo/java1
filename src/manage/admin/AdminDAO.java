package manage.admin;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class AdminDAO extends SqlMapClientDAOSupport {

	public int count(AdminVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("admin.count", param);
	}
	

	/**
	 * 관리자 목록 조회
	 * @param param
	 * @return ArrayList<AdminVO>
	 * @throws SQLException
	 */
	
	public ArrayList list(AdminVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("admin.list", param);
	}

	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(AdminVO vo) throws SQLException {
		return (Integer) getSqlMapClient().insert("admin.insert", vo);
	}

	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(AdminVO vo) throws SQLException {
		return getSqlMapClient().update("admin.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("admin.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public AdminVO read(int no) throws SQLException {
		return (AdminVO)getSqlMapClient().queryForObject("admin.read", no);
	}

	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
	public int loginCheck(AdminVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("admin.loginCheck", param);
	}
	
	/**
	 * 관리자 아이디체크
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public int idcheck(AdminVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("admin.idcheck", param);
	}

	public AdminVO getLoginSessionInfo(AdminVO param) throws SQLException {
		return (AdminVO) getSqlMapClient().queryForObject("admin.loginSessionInfo", param);
	}

	/**
	 * 관리자 접속 기록 rowPageCount
	 * @param param
	 * @return rowPageCount배열 (전체로우수, 페이지수)
	 * @throws SQLException
	 */
	public int countLoginHistory(AdminVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("admin.countLoginHistory", param);
	}

	/**
	 * 관리자 접속기록 리스트
	 * @param param
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList listLoginHistory(AdminVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("admin.listLoginHistory", param);
	}

	/**
	 * 로그인 시 히스토리 저장
	 * @param param
	 * @return int
	 * @throws SQLException
	 */
	public void insertLoginHistory(AdminVO param) throws SQLException {
		getSqlMapClient().insert("admin.insertLoginHistory", param);
	}

	
	public static void main(String[] args) throws Exception {
		AdminDAO ad = new AdminDAO();
		AdminVO av = new AdminVO(10);
		av.setId("test");
		int a = ad.idcheck(av);
		System.out.println(a);
	}
}
