package board.event;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class EventService {

	@Autowired
	private EventDAO eventDao;
	
	public int[] count(EventVO vo) throws Exception {
		int rowCount = eventDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(EventVO vo) throws Exception {
		ArrayList list = eventDao.list(vo);
		return list;
	}

	public int insert(EventVO vo, HttpServletRequest request) throws Exception {
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			System.out.println("파일업로드 가나?");
			fu.upload(file, SiteProperty.NOTICE_UPLOAD_PATH, SiteProperty.REAL_PATH, "notice");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());
			vo.setFilesize(fu.getSrcSize());
		}
		
		int lastNo = (Integer)eventDao.insert(vo);
		
		return lastNo;
	}
	
	public EventVO read(EventVO vo, boolean userCon) throws Exception {
		EventVO data = eventDao.read(vo);
		if (userCon) {	// 사용자쪽 조회시만 update
			eventDao.updateReadno(vo);
		}
		return data;
	}

	public int update(EventVO vo, HttpServletRequest request) throws Exception {
		EventVO data = eventDao.read(vo);
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("filename_tmp");
		if (!file.isEmpty()) {
			System.out.println("파일업로드 가나?");
			fu.upload(file, SiteProperty.NOTICE_UPLOAD_PATH, SiteProperty.REAL_PATH, "notice");
			vo.setFilename(fu.getName());
			vo.setFilename_org(fu.getSrcName());
			vo.setFilesize(fu.getSrcSize());
		}
		
		int r = (Integer)eventDao.update(vo);
		if(r > 0){
			if("1".equals(vo.getFilename_chk()) || !"".equals(Function.checkNull(vo.getFilename()))){
				Function.fileDelete(vo.getUploadPath(), data.getFilename());
			}
		}
		return r;
	}

	
	public int delete(EventVO vo) throws Exception {
		EventVO data = eventDao.read(vo);
		int r = eventDao.delete(vo);
		if (r > 0) {
			Function.fileDelete(vo.getUploadPath(), data.getFilename());
		}
		return r;
	}
	
	public int groupDelete(EventVO vo, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				vo.setNo(Function.getIntParameter(nos[i]));
				EventVO data = eventDao.read(vo);
				int r = eventDao.delete(vo);
				if (r > 0) {
					delCount++;
					Function.fileDelete(vo.getUploadPath(), data.getFilename());
				}
			}
		}
		return delCount;
	}

	/*
	public ArrayList mainList(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
