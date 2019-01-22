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
	
	public int[] nowCount(MovieVo vo) throws Exception {
		int rowCount = movieDao.nowCount(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}
	
	public int[] nextCount(MovieVo vo) throws Exception {
		int rowCount = movieDao.nextCount(vo);
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
	
	public ArrayList nowList(MovieVo vo) throws Exception {
		ArrayList nowlist = movieDao.nowList(vo);
		return nowlist;
	}
	
	public ArrayList nextList(MovieVo vo) throws Exception {
		ArrayList nextList = movieDao.nextList(vo);
		return nextList;
	}
	
	public int insert(MovieVo vo, HttpServletRequest request) throws Exception {
		
		String[] genreArr = request.getParameterValues("genre");
		String genreVal = "";
		for (int i=0; i<genreArr.length; i++) {
			if (i>0) genreVal += ",";
			genreVal += genreArr[i];
		}
		
		String[] formatArr = request.getParameterValues("format");
		String formatVal = "";
		if (formatArr != null) {
			for (int i=0; i<formatArr.length; i++) {
				if (i>0) formatVal += ",";
				formatVal += formatArr[i];
			}
		}
		
		System.out.println(genreVal);	// insert/update할때
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("poster_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "movie");
			vo.setPoster(fu.getName());
			vo.setPosterSize(fu.getSrcSize());
		}
		int lastNo = (Integer)movieDao.insert(vo);
		return lastNo;
	}
	
	public int insert2(int movie_no, HttpServletRequest request) throws Exception {

		StillCutVo scv = new StillCutVo();
		scv.setMovie_no(movie_no);
		scv.setStillCut1(request.getParameter("stillcut1"));
		scv.setStillCut2(request.getParameter("stillcut2"));
		scv.setStillCut3(request.getParameter("stillcut3"));
		scv.setStillCut4(request.getParameter("stillcut4"));
		scv.setStillCut5(request.getParameter("stillcut5"));
		scv.setStillCut6(request.getParameter("stillcut6"));
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("stillCut1_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut1(fu.getName());
		}
		MultipartFile file2= (MultipartFile)fileMap.get("stillCut2_tmp");
		if (!file2.isEmpty()) {
			fu.upload(file2, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut2(fu.getName());
		}
		MultipartFile file3= (MultipartFile)fileMap.get("stillCut3_tmp");
		if (!file3.isEmpty()) {
			fu.upload(file3, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut3(fu.getName());
		}
		MultipartFile file4= (MultipartFile)fileMap.get("stillCut4_tmp");
		if (!file4.isEmpty()) {
			fu.upload(file4, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut4(fu.getName());
		}
		MultipartFile file5= (MultipartFile)fileMap.get("stillCut5_tmp");
		if (!file5.isEmpty()) {
			fu.upload(file5, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut5(fu.getName());
		}
		MultipartFile file6= (MultipartFile)fileMap.get("stillCut6_tmp");
		if (!file6.isEmpty()) {
			fu.upload(file6, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut1(fu.getName());
		}
		int r = movieDao.insert2(scv);
		return r;	
	}
	
	public int insert3(int movie_no, HttpServletRequest request) throws Exception {
		
		
		TrailerVo tv = new TrailerVo();
		tv.setMovie_no(movie_no); 
		tv.setTrailer1(request.getParameter("trailer1"));
		tv.setTrailer2(request.getParameter("trailer2"));
		tv.setTrailer3(request.getParameter("trailer3"));
		tv.setTrailer4(request.getParameter("trailer4"));
		tv.setTrailer5(request.getParameter("trailer5"));
		tv.setTrailer6(request.getParameter("trailer6"));
	
		
		int r = movieDao.insert3(tv);
		return r;
	}
	
	public int insertActor(int movie_no, HttpServletRequest request) throws Exception {
		
		ActorVo av = new ActorVo();
		av.setMovie_no(movie_no);
		av.setActor1(request.getParameter("actor1"));
		av.setActor2(request.getParameter("actor2"));
		av.setActor3(request.getParameter("actor3"));
		av.setActor4(request.getParameter("actor4"));
		av.setActor5(request.getParameter("actor5"));
		av.setActor6(request.getParameter("actor6"));
		
		int r = movieDao.insertActor(av);
		return r;
		
	}
	public MovieVo read(MovieVo vo, boolean userCon) throws Exception {
		MovieVo data = movieDao.read(vo);
		return data;
	}
	
	public StillCutVo readStillCut(int movie_no) throws Exception {
		StillCutVo data = movieDao.readStillCut(movie_no);
		return data;
	}
	public TrailerVo readTrailer(int movie_no) throws Exception {
		TrailerVo data = movieDao.readTrailer(movie_no);
		return data;
	}
	
	public ActorVo readActor(int movie_no) throws Exception {
		ActorVo data = movieDao.readActor(movie_no);
		return data;
	}

	public int update(MovieVo vo, HttpServletRequest request) throws Exception {
		MovieVo data = movieDao.read(vo);
		
		
		String[] genreArr = request.getParameterValues("genre");
		String genreVal = "";
		for (int i=0; i<genreArr.length; i++) {
			if (i>0) genreVal += ",";
			genreVal += genreArr[i];
		}
		
		String[] formatArr = request.getParameterValues("format");
		String formatVal = "";
		if(formatArr!=null) {
			for (int i=0; i<formatArr.length; i++) {
				if (i>0) formatVal += ",";
				formatVal += formatArr[i];
			}
		}
	
		
		int r = (Integer)movieDao.update(vo);
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("poster_tmp");
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
	public int stillCutUpdate(int movie_no, HttpServletRequest request) throws Exception {
		StillCutVo scv = new StillCutVo();
		scv.setMovie_no(movie_no);
				
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("stillCut1_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut1(fu.getName());
		}
		MultipartFile file2= (MultipartFile)fileMap.get("stillCut2_tmp");
		if (!file2.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut2(fu.getName());
		}
		MultipartFile file3= (MultipartFile)fileMap.get("stillCut3_tmp");
		if (!file3.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut3(fu.getName());
		}
		MultipartFile file4= (MultipartFile)fileMap.get("stillCut4_tmp");
		if (!file4.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut4(fu.getName());
		}
		MultipartFile file5= (MultipartFile)fileMap.get("stillCut5_tmp");
		if (!file5.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut5(fu.getName());
		}
		MultipartFile file6= (MultipartFile)fileMap.get("stillCut6_tmp");
		if (!file6.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "stillCut");
			scv.setStillCut6(fu.getName());
		}
		
		return movieDao.stillCutUpdate(scv);
	}
	
	public int trailerUpdate(int movie_no, HttpServletRequest request) throws Exception {
		
		TrailerVo tv = new TrailerVo();
		tv.setMovie_no(movie_no); 
		tv.setTrailer1(request.getParameter("trailer1"));
		tv.setTrailer2(request.getParameter("trailer2"));
		tv.setTrailer3(request.getParameter("trailer3"));
		tv.setTrailer4(request.getParameter("trailer4"));
		tv.setTrailer5(request.getParameter("trailer5"));
		tv.setTrailer6(request.getParameter("trailer6"));
	
		
		int r = movieDao.trailerUpdate(tv);
		return r;
		
	}
	
public int actorUpdate (int movie_no, HttpServletRequest request) throws Exception {
		
		ActorVo av = new ActorVo();
		av.setMovie_no(movie_no); 
		av.setActor1(request.getParameter("actor1"));
		av.setActor2(request.getParameter("actor2"));
		av.setActor3(request.getParameter("actor3"));
		av.setActor4(request.getParameter("actor4"));
		av.setActor5(request.getParameter("actor5"));
		av.setActor6(request.getParameter("actor6"));
	
		
		int r = movieDao.actorUpdate(av);
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
