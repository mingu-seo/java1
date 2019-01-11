package board.notice;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class NoticeDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(NoticeVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("notice.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(NoticeVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("notice.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(NoticeVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("notice.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(NoticeVO vo) throws SQLException {
		return getSqlMapClient().update("notice.update", vo);
	}
	
	public int updateReadno(NoticeVO vo) throws SQLException {
		return getSqlMapClient().update("notice.updateReadno", vo);
	}

	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public NoticeVO read(NoticeVO vo) throws SQLException {
		return (NoticeVO)getSqlMapClient().queryForObject("notice.read", vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(NoticeVO vo) throws SQLException {
		return getSqlMapClient().delete("notice.delete", vo);
	}


	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(NoticeVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("notice.mainList", vo);
	}
	
	public static void main(String[] args) throws Exception {
		NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = new NoticeVO();
		vo.setTablename("notice");
		
		dao.count(vo);
	}
}
