package board.event;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class EventDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(EventVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("event.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(EventVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("event.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(EventVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("event.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(EventVO vo) throws SQLException {
		return getSqlMapClient().update("event.update", vo);
	}
	
	public int updateReadno(EventVO vo) throws SQLException {
		return getSqlMapClient().update("event.updateReadno", vo);
	}

	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public EventVO read(EventVO vo) throws SQLException {
		return (EventVO)getSqlMapClient().queryForObject("event.read", vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(EventVO vo) throws SQLException {
		return getSqlMapClient().delete("event.delete", vo);
	}


	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(EventVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("event.mainList", vo);
	}
	
	public static void main(String[] args) throws Exception {
		EventDAO dao = new EventDAO();
		EventVO vo = new EventVO();
		vo.setTablename("event");
		
		dao.count(vo);
	}
}
