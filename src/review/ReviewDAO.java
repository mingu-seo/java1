package review;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.notice.NoticeVO;
import db.SqlMapClientDAOSupport;

@Repository
public class ReviewDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(ReviewVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("review.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(ReviewVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.list", vo);
	}


	public int insert(ReviewVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("review.insert",vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(ReviewVO vo) throws SQLException {
		return getSqlMapClient().delete("review.delete", vo);
	}


	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(ReviewVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("review.mainList", vo);
	}
	
	public static void main(String[] args) throws Exception {
		ReviewDAO dao = new ReviewDAO();
		ReviewVO vo = new ReviewVO();
		vo.setTablename("review");
		
		dao.count(vo);
	}
}
