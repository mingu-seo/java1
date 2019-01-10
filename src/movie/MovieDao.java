package movie;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;

@Repository
public class MovieDao extends SqlMapClientDAOSupport {

	/**
	 * 총 영화 갯수 구하기
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int count(MovieVo vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("movie.count", vo);
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(MovieVo vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("movie.list", vo);
	}

	/**
	 * 영화 db 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo MovieVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(MovieVo vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("movie.insert",vo);
	}

	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MovieVo vo) throws SQLException {
		return getSqlMapClient().update("movie.update", vo);
	}

	public MovieVo read(MovieVo vo) throws SQLException {
		return (MovieVo)getSqlMapClient().queryForObject("movie.read", vo);
	}

	/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(MovieVo vo) throws SQLException {
		return getSqlMapClient().delete("movie.delete", vo);
	}


	/**
	 * 메인목록 조회
	 * @param tablename 테이블명
	 * @param number 로우수
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList mainList(MovieVo vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("movie.mainList", vo);
	}
	
	public static void main(String[] args) throws Exception {
		MovieDao dao = new MovieDao();
		MovieVo vo = new MovieVo();
		vo.setTablename("movie");
		dao.count(vo);
	}
}
