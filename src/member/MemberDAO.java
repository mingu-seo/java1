package member;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import ticket1.PointVo;
import ticket1.Ticket1VO;
@Repository
public class MemberDAO extends SqlMapClientDAOSupport {

	public int count(MemberVO param) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("member.count", param);
	}
	
	public int mypageCount(Ticket1VO param) throws SQLException{
		return (Integer)getSqlMapClient().queryForObject("ticket1.mypageCount", param);
	}

	/**
	 * 관리자 목록 조회
	 * @param param
	 * @return ArrayList<MemberVO>
	 * @throws SQLException
	 */
	public ArrayList list(MemberVO param) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("member.list", param);
	}

	
	public int getPoint(int vo) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.getPoint", vo);
	}

	public ArrayList myPointList(PointVo pv) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("member.myPointList",pv);
	}

	
	/**
	 * 관리자 등록
	 * @param vo
	 * @return no 마지막 등록된 no
	 * @throws SQLException
	 */
	public int insert(MemberVO vo, HttpServletRequest request) throws SQLException {
		return (Integer) getSqlMapClient().insert("member.insert", vo);
	}
	
	/**
	 * 관리자 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.update", vo);
	}

	/**
	 * 관리자 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(int no) throws SQLException {
		return getSqlMapClient().delete("member.delete", no);
	}

	/**
	 * 관리자 상세
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	public MemberVO read(int no) throws SQLException {
		return (MemberVO)getSqlMapClient().queryForObject("member.read", no);
	}
	
	public MemberVO scrDate(int no) throws SQLException {
		return (MemberVO)getSqlMapClient().queryForObject("member.srcDate", no);
	}
	
	
	public int loginCheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.loginCheck", param);
	}

	public int secession(MemberVO vo) throws SQLException{
		return getSqlMapClient().update("member.secession", vo);
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", param);
	}
	
	
	/**
	 * 관리자 로그인체크
	 * id, password로 조회 후 존재하면 true 리턴
	 * @param id
	 * @param password
	 * @return boolean
	 * @throws SQLException
	 */
//	public int loginCheck(MemberVO param) throws SQLException {
//		return (Integer) getSqlMapClient().queryForObject("member.loginCheck", param);
//	}
//	
//	/**
//	 * 관리자, 회원 이메일체크
//	 * @param param
//	 * @return
//	 * @throws SQLException
//	 */
	public int emailcheck(MemberVO param) throws SQLException {
		return (Integer) getSqlMapClient().queryForObject("member.emailcheck", param);
	}
	
	/**
	 * 이메일 찾기
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public MemberVO searchemail(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.searchemail", param);
	}
	
	/**
	 * 비밀번호 찾기
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	public MemberVO searchpw(MemberVO param) throws SQLException {
		return (MemberVO) getSqlMapClient().queryForObject("member.searchpw", param);
	}
	
	public int updatePw(MemberVO vo) throws SQLException {
		return getSqlMapClient().update("member.updatePw", vo);
	}
	
	
//	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
//		return (MemberVO) getSqlMapClient().queryForObject("member.loginSessionInfo", param);
//	}
//
//	/**
//	 * 관리자 접속 기록 rowPageCount
//	 * @param param
//	 * @return rowPageCount배열 (전체로우수, 페이지수)
//	 * @throws SQLException
//	 */
//	public int countLoginHistory(MemberVO param) throws SQLException {
//		return (Integer)getSqlMapClient().queryForObject("member.countLoginHistory", param);
//	}
//
//	/**
//	 * 관리자 접속기록 리스트
//	 * @param param
//	 * @return ArrayList
//	 * @throws SQLException
//	 */
//	public ArrayList listLoginHistory(MemberVO param) throws SQLException {
//		return (ArrayList)getSqlMapClient().queryForList("member.listLoginHistory", param);
//	}
//
//	/**
//	 * 로그인 시 히스토리 저장
//	 * @param param
//	 * @return int
//	 * @throws SQLException
//	 */
//	public void insertLoginHistory(MemberVO param) throws SQLException {
//		getSqlMapClient().insert("member.insertLoginHistory", param);
//	}

	
	public static void main(String[] args) throws Exception {
		MemberVO mv = new MemberVO();
		MemberDAO dao = new MemberDAO();
		PointVo pv = new PointVo();
		
		pv.setMember_pk(10);
		
		
		
		int r = dao.getPoint(3);
		System.out.println(r);
		
			
		
		
	}




}
