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
			scv.setStillCut6(fu.getName());
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
	
	public ArrayList read(MovieVo vo) throws Exception {
		ArrayList data = movieDao.scrDate(vo);
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
		
		FileUtil fu = new FileUtil();
		Map fileMap = fu.getFileMap(request);
		MultipartFile file= (MultipartFile)fileMap.get("poster_tmp");
		if (!file.isEmpty()) {
			fu.upload(file, SiteProperty.MOVIE_UPLOAD_PATH, SiteProperty.REAL_PATH, "movie");
			vo.setPoster(fu.getName());
			
		}
	
			
		int r = (Integer)movieDao.update(vo);
		return r;
	}
	public int stillCutUpdate(int movie_no, HttpServletRequest request) throws Exception {
		
		StillCutVo data = movieDao.readStillCut(movie_no);
		StillCutVo scv = new StillCutVo();
		scv.setMovie_no(movie_no);
		
		if(Function.getIntParameter(request.getParameter("stillCut1_chk"))==1) {
			scv.setStillCut1_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut1());
		}  
		if(Function.getIntParameter(request.getParameter("stillCut2_chk"))==1) {
			scv.setStillCut2_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut2());
		}
		if(Function.getIntParameter(request.getParameter("stillCut3_chk"))==1) {
			scv.setStillCut3_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut3());
		}
		if(Function.getIntParameter(request.getParameter("stillCut4_chk"))==1){
			scv.setStillCut4_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut4());
		}
		if(Function.getIntParameter(request.getParameter("stillCut5_chk"))==1) {
			scv.setStillCut5_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut5());
		}
		if(Function.getIntParameter(request.getParameter("stillCut6_chk"))==1) {
			scv.setStillCut6_chk(1);
			Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getStillCut6());
		}
		
				
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
				nvo.setTablename("movie");
				nvo.setNo(Function.getIntParameter(nos[i]));
				MovieVo data = movieDao.read(nvo);   // 데이터를 가져오고 나서 파일을 삭제할 때. 
				StillCutVo scv = movieDao.readStillCut(nvo.getNo());
				int r = movieDao.delete(nvo);
				if (r>0) {
					movieDao.stillCutDelete(nvo.getNo());
					movieDao.trailerDelete(nvo.getNo());
					movieDao.actorDelete(nvo.getNo());
					
					// movie에 있는 포스터이미지 삭제
					if (data.getPoster() != null && !"".equals(data.getPoster())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, data.getPoster());
					}
					
					if(scv.getStillCut1()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut1());
					}
					
					if(scv.getStillCut2()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut2());
					}
					
					if(scv.getStillCut3()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut3());
					}
					
					if(scv.getStillCut4()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut4());
					}
					
					if(scv.getStillCut5()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut5());
					}
					
					if(scv.getStillCut6()!=null && !"".equals(scv.getStillCut1())) {
						Function.fileDelete(SiteProperty.REAL_PATH + SiteProperty.MOVIE_UPLOAD_PATH, scv.getStillCut6());
					}
					
				}

				
			}
		}

		
		return delCount;
	}

	
	public ArrayList mainList(MovieVo vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	//나영=예매페이지에영화리스트
	public ArrayList tkmovielist(MovieVo vo) throws Exception {
		ArrayList list = movieDao.tkmovielist(vo);
		return list;
	}
		public int[] tkmoviecount(MovieVo vo) throws Exception {
		int rowCount = movieDao.tkmoviecount(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	//나영=메인박스오피스에예매율
	public ArrayList ticketcount(MovieVo vo) throws Exception {
		ArrayList list = movieDao.ticketcount(vo);
		return list;
	}

}
