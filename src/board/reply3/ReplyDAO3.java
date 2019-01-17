package board.reply3;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import util.Function;
import util.Page;

@Repository
public class ReplyDAO3 extends SqlMapClientDAOSupport {

	/**
	 * 총 글 수, 총 글 페이지
	 * @param vo
	 * @return rowPageCount Integer[]
	 * @throws SQLException
	 */
	public int[] count(ReplyVO3 vo) throws SQLException {
		int rowCount = (Integer)getSqlMapClient().queryForObject("reply.count", vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	/**
	 * 목록 조회
	 * @param vo
	 * @return ArrayList
	 * @throws SQLException
	 */
	public ArrayList list(ReplyVO3 vo) throws SQLException {
		ArrayList list = (ArrayList)getSqlMapClient().queryForList("reply.list", vo);
		return list;
	}

	/**
	 * 게시글 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * @param vo
	 * @param request 
	 * @return no Integer
	 * @throws SQLException
	 */
	public int insert(ReplyVO3 vo) throws SQLException {
		vo.setFilesize(Function.getFileSize(vo.getUploadPath(), vo.getFilename()));	// 파일 사이즈 구하기
		int maxGno = (Integer)getSqlMapClient().queryForObject("reply.getMaxGno",vo);
		vo.setGno(maxGno);
		int no = (Integer)getSqlMapClient().insert("reply.insert",vo);
		return no;
	}

	/**
	 * 답변 저장 [게시글 저장 후 게시글의 번호를 가져옴]
	 * 그룹내 gno, ono 처리
	 * minOno가 0이면 ono = maxOno+1
	 * minOno가 0보다 크면 ono = minOno, minOno보다 크거나 같은 ono=ono+1로 수정
	 * nested +1
	 * @param vo
	 * @return no Integer
	 * @throws SQLException
	 */
	public int reply(ReplyVO3 vo) throws SQLException {
		vo.setFilesize(Function.getFileSize(vo.getUploadPath(), vo.getFilename()));	// 파일 사이즈 구하기
		int maxOno = (Integer)getSqlMapClient().queryForObject("reply.getMaxOno",vo);
		int minOno = (Integer)getSqlMapClient().queryForObject("reply.getMinOno",vo);
		if (minOno == 0) {
			vo.setOno(maxOno+1);
		} else {	// minOno가 0보다 크면 같은 그룹내 minOno보다 큰 ono를 +1
			HashMap hm = new HashMap();
			hm.put("tablename", vo.getTablename());
			hm.put("gno", vo.getGno());
			hm.put("minOno", minOno);
			getSqlMapClient().update("reply.updateOno", hm);
			vo.setOno(minOno);
		}
		vo.setNested(vo.getNested()+1);		// 뎁스 1추가
		int no = (Integer)getSqlMapClient().insert("reply.insert",vo);
		return no;
	}


	/**
	 * 수정
	 * @param vo
	 * @param request 
	 * @throws SQLException
	 */
	public int update(ReplyVO3 vo) throws SQLException {
		vo.setFilesize(Function.getFileSize(vo.getUploadPath(), vo.getFilename()));	// 파일 사이즈 구하기
		int r = getSqlMapClient().update("reply.update", vo);
		ReplyVO3 data = (ReplyVO3)getSqlMapClient().queryForObject("reply.filenames", vo);
		if(r > 0){
			if("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))){
				Function.fileDelete(vo.getUploadPath(), data.getFilename());
			}
			if("1".equals(vo.getImagename_chk()) || !"".equals(Function.checkNull(vo.getImagename()))){
				Function.fileDelete(vo.getUploadPath(), data.getImagename());
			}
		}	
		return r;
	}

	/**
	 * 상세
	 * userCon true시 조회수 +1
	 * @param vo
	 * @param userCon 사용자 접속여부
	 * @return
	 * @throws SQLException
	 */
	public ReplyVO3 read(ReplyVO3 vo, boolean userCon) throws SQLException {
		ReplyVO3 data = (ReplyVO3)getSqlMapClient().queryForObject("reply.read", vo);
		
		vo.setRownum((Integer)getSqlMapClient().queryForObject("reply.getRowNum", vo));			// 해당no rownum구하기
		ReplyVO3 prev = (ReplyVO3)getSqlMapClient().queryForObject("reply.getPrevRowNum", vo);	// 이전글 no, title 구하기
		ReplyVO3 next = (ReplyVO3)getSqlMapClient().queryForObject("reply.getNextRowNum", vo);	// 다음글 no, title 구하기
		
		if (prev != null) {
			data.setPrev_no(prev.getPrev_no());			// 이전글 번호		
			data.setPrev_title(prev.getPrev_title());	// 이전글 제목
		}
		if (next != null) {
			data.setNext_no(next.getNext_no());			// 다음글 번호
			data.setNext_title(next.getNext_title());	// 다음글 제목
		}
		
		if (userCon) {
			getSqlMapClient().update("reply.updateReadno", vo);
		}
		return data;
	}

	/**
	 * 삭제
	 * no로 해당글 첨부파일명 조회해서 삭제
	 * @param no
	 * @throws SQLException
	 */
	public int delete(ReplyVO3 vo) throws SQLException {
		ReplyVO3 data = (ReplyVO3)getSqlMapClient().queryForObject("reply.read", vo);
		int r = getSqlMapClient().delete("reply.delete", vo);
		if (r > 0) {
			Function.fileDelete(vo.getUploadPath(), data.getFilename());
			Function.fileDelete(vo.getUploadPath(), data.getImagename());
		}
		return r;
	}


	/**
	 * 비밀번호 확인
	 * @param tablename 테이블명
	 * @param no 해당글 no
	 * @param password 비밀번호
	 * @param db_encryption 암호화방식
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean checkPassword(ReplyVO3 vo) throws SQLException {
		Integer cnt = (Integer)getSqlMapClient().queryForObject("reply.checkPassword", vo);
		if (cnt > 0) {
			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) throws Exception {
		ReplyDAO3 rd = new ReplyDAO3();
		ReplyVO3 vo = new ReplyVO3(10, "reply");
		
		
		// 등록
//		vo.setPassword("111");
//		vo.setName("서민구");
//		vo.setTop("0");
//		vo.setMain("0");
//		vo.setNewicon("0");
//		vo.setEmail("withsky999@gmail.com");
//		vo.setTitle("답변게시판 테스트2");
//		vo.setContents("내용내용");
//		System.out.println(rd.insert(vo));

//		int[] cnt = rd.count(vo);
//		System.out.println(cnt[0]+"   "+cnt[1]);
//
//		vo.setNo(7);
//		ReplyVO data = rd.read(vo, false);
//		System.out.println(data.getNo()+"\t"+data.getTitle()+"\t"+data.getContents());
//
		// 답변
		vo.setPassword("111");
		vo.setName("답변자");
		vo.setEmail("test@test.com");
		vo.setTitle("답변");
		vo.setContents("답변");
		vo.setGno(1);
		vo.setTop("0");
		vo.setMain("0");
		vo.setNewicon("0");
		
		vo.setOno(2);
		vo.setNested(2);
		System.out.println(rd.reply(vo));

		//목록
//		ArrayList<ReplyVO> list = rd.list(vo);
//		for (int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getNo()+"\t"+list.get(i).getTitle()+"\t"+list.get(i).getContents());
//		}

		// 삭제
//		System.out.println(rd.delete(2, "reply", "D:/workspace/hospital/www/upload/reply/"));

		// 비밀번호 체크
//		System.out.println(rd.checkPassword("reply", 1, "111", SiteProperty.DB_ENCRYPTION));

		/*ArrayList<ReplyVO> list = rd.mainList("reply", "reply_comment", 5);
		for (int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getNo()+"\t"+list.get(i).getTitle()+"\t"+list.get(i).getComment_count());
		}*/

	}
}
