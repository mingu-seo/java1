package movie;

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
public class MovieService {

	@Autowired
	private MovieDao movieDao;
	
	public int[] count(MovieVo vo) throws Exception {
		int rowCount = movieDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(MovieVo vo) throws Exception {
		ArrayList list = movieDao.list(vo);
		return list;
	}

	public int insert(MovieVo vo, HttpServletRequest request) throws Exception {
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("poster");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "movie");
			vo.setPoster(fu.getName());
			
		}
		
		int lastNo = (Integer)movieDao.insert(vo);
		
		return lastNo;
	}
	
	public MovieVo read(MovieVo vo, boolean userCon) throws Exception {
		MovieVo data = movieDao.read(vo);
		
		return data;
	}

	public int update(MovieVo vo, HttpServletRequest request) throws Exception {
		MovieVo data = movieDao.read(vo);
		int r = (Integer)movieDao.update(vo);
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("poster");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "movie");
			vo.setPoster(fu.getName());
			
		}
		if(r > 0){
			if("1".equals(vo.getPoster_chk()) || !"".equals(Function.checkNull(vo.getPoster()))){
				Function.fileDelete(vo.getUploadPath(), data.getPoster());
			}
		}
		return r;
	}

	
	public int delete(MovieVo vo) throws Exception {
		MovieVo data = movieDao.read(vo);
		int r = movieDao.delete(vo);
		if (r > 0) {
			Function.fileDelete(vo.getUploadPath(), data.getPoster());
		}
		return r;
	}
	
	public int groupDelete(MovieVo vo, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				MovieVo nvo = new MovieVo();
				nvo.setNo(Function.getIntParameter(nos[i]));
				MovieVo data = movieDao.read(vo);
				int r = movieDao.delete(vo);
				
			}
		}
		return delCount;
	}

	
	public ArrayList mainList(MovieVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
