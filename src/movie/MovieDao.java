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

	public int nowCount(MovieVo vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("movie.nowCount", vo);
	}
	
	public int nextCount(MovieVo vo) throws SQLException {
		return (Integer)getSqlMapClient().queryForObject("movie.nextCount", vo);
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

	public ArrayList nowList(MovieVo vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("movie.nowList", vo);
	}

	public ArrayList nextList(MovieVo vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("movie.nextList", vo);
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
	 * 영화 스틸컷 저장 
	 * @param vo MovieVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert2(StillCutVo vo) throws SQLException {
		return (Integer)getSqlMapClient().insert("movie.insert2",vo);
	}

	/**
	 * 영화 트레일러 주소 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param tv MovieVO
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert3(TrailerVo tv) throws SQLException {
		return (Integer)getSqlMapClient().insert("movie.insert3",tv);
	}


	public int insertActor(ActorVo av) throws SQLException {
		return (Integer)getSqlMapClient().insert("movie.insertActor",av);
	}
	
	
	/**
	 * 수정
	 * @param vo
	 * @throws SQLException
	 */
	public int update(MovieVo vo) throws SQLException {
		return getSqlMapClient().update("movie.update", vo);
	}
	public int stillCutUpdate(StillCutVo scv) throws SQLException {
		return getSqlMapClient().update("movie.stillCutUpdate", scv);
	}
	public int trailerUpdate(TrailerVo tv) throws SQLException {
		return getSqlMapClient().update("movie.trailerUpdate", tv);
	}
	public int actorUpdate(ActorVo av) throws SQLException {
		return getSqlMapClient().update("movie.actorUpdate", av);
	}
	

	public MovieVo read(MovieVo vo) throws SQLException {
		return (MovieVo)getSqlMapClient().queryForObject("movie.read", vo);
	}
	
	//screen_date 가져오기
	public ArrayList scrDate(MovieVo vo) throws SQLException {
		return (ArrayList)getSqlMapClient().queryForList("movie.scrDate", vo);
	}
	
	public StillCutVo readStillCut(int vo) throws SQLException {
		// TODO Auto-generated method stub
		return (StillCutVo)getSqlMapClient().queryForObject("movie.readStillCut", vo);
	}
	public TrailerVo readTrailer(int vo) throws SQLException {
		// TODO Auto-generated method stub
		return (TrailerVo)getSqlMapClient().queryForObject("movie.readTrailer", vo);
	}
	
	public ActorVo readActor (int vo) throws SQLException {
		// TODO Auto-generated method stub
		return (ActorVo)getSqlMapClient().queryForObject("movie.readActor", vo);
	}
		/**
	 * 삭제
	 * @param vo
	 * @throws SQLException
	 */
	public int delete(MovieVo vo) throws SQLException {
		return getSqlMapClient().delete("movie.delete", vo);
	}

	public int stillCutDelete(int movie_no) throws SQLException {
		return getSqlMapClient().delete("movie.stillCutDelete",movie_no);
	}
	
	public int trailerDelete(int movie_no) throws SQLException {
		return getSqlMapClient().delete("movie.trailerDelete",movie_no);
	}
	
	public int actorDelete(int movie_no) throws SQLException {
		return getSqlMapClient().delete("movie.actorDelete",movie_no);
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
	
	public static void main(String[] args) throws Exception  {
		MovieDao dao = new MovieDao();
		MovieVo mv = new MovieVo();
		ActorVo av = new ActorVo();
	
		mv.setTablename("movie");
		//mv.setSdisplay(1);
//		mv.setStype("all");
//		mv.setSval("메리");
//		mv.setDateType("releaseDate");
//		mv.setSdate("2019-01-09");
//		mv.setEdate("2019-01-31");
//		mv.setSgenre("액션");
		mv.setSrating(19);
		dao.list(mv);
	}



	
}
