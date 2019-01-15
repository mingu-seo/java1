package board.faq;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class FaqDAO extends SqlMapClientDAOSupport {

	/**
	 * 총글수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(FaqVO vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("faq.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(FaqVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("faq.list", vo);
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo NoticeVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(FaqVO vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("faq.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(FaqVO vo) throws SQLException {
		return getSqlMapClient().update("faq.update", vo);
	}

	/**
	 * 상세 (readno 수정을 위해 테이블명 필요)
	 * @param vo
	 * @param userCon(조회수)
	 * @return
	 * @throws SQLException
	 */
	public FaqVO read(FaqVO vo) throws SQLException {
		return (FaqVO)getSqlMapClient().queryForObject("faq.read", vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(FaqVO vo) throws SQLException {
		return getSqlMapClient().delete("faq.delete", vo);
	}


	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(FaqVO vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("faq.mainList", vo);
	}
	
	public static void main(String[] args) throws Exception {
		FaqDAO dao = new FaqDAO();
		FaqVO vo = new FaqVO();
		vo.setTablename("faq");
		
		dao.count(vo);
	}
}
