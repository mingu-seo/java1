package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import db.SqlMapClientDAOSupport;
import board.reply1.Reply1VO;
import mail.SendMail;
import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class MemberService extends SqlMapClientDAOSupport{
	
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

	public int insert(MemberVO vo, HttpServletRequest request) throws Exception {
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (file != null && !file.isEmpty()) {
			fu.upload(file, SiteProperty.MEMBER_UPLOAD_PATH, SiteProperty.REAL_PATH, "member");
			vo.setFilename(fu.getName());
		}
		
		int no = memberDao.insert(vo, request);
		return no;
	}
	
	public int update(MemberVO vo, HttpServletRequest request) throws Exception {
		MemberVO data = (MemberVO)getSqlMapClient().queryForObject("member.filenames", vo);
		if(data != null){
			System.out.println("체크:"+vo.getFilename_chk());
			if("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))){
				Function.fileDelete(SiteProperty.REAL_PATH+SiteProperty.MEMBER_UPLOAD_PATH, data.getFilename());
			}
		}
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MEMBER_UPLOAD_PATH, SiteProperty.REAL_PATH, "reply");
			vo.setFilename(fu.getName());
		}
		
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
	
	public boolean loginCheck(MemberVO param) throws SQLException {
		int cnt = memberDao.loginCheck(param);
		boolean result = false;
		if (cnt == 1) {
			result = true;
		}
		return result;
	}
	
	public int secession(MemberVO vo) throws SQLException{
		int cnt = memberDao.secession(vo);
		if(cnt==1) {
			return cnt;
		}else {
			cnt=0;
			return cnt;
		}
	}
	
	public MemberVO getLoginSessionInfo(MemberVO param) throws SQLException {
		MemberVO vo = memberDao.getLoginSessionInfo(param);
		vo.setIp(param.getIp());	// 아이피 추가
		return vo;
	}
	
	public int tempPw(MemberVO vo) throws SQLException {
		int cnt = memberDao.update(vo);
		return cnt;
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
	//이메일 체크
	public int emailcheck(MemberVO param) throws SQLException {
		return memberDao.emailcheck(param);
	}
	
	//이메일 찾기
	public MemberVO searchemail(MemberVO param) throws SQLException {
		return memberDao.searchemail(param);
	}
	
	//비밀번호 찾기
	public boolean searchpw(MemberVO param) throws Exception {
		boolean success = false;
		MemberVO vo = memberDao.searchpw(param);
		if (vo == null) {
			success = false;
		} else {
			success = true;
			String tmpPwd = Function.randomNumber("");
			param.setPw(tmpPwd);
			memberDao.updatePw(param);
			SendMail.sendEmail("zebra_yun@naver.com", param.getEmail(), "GIGABOX 비밀번호 찾기 서비스입니다.", "회원님의 임시 비밀번호는  "+tmpPwd+"입니다.");
		}
		return success;
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
