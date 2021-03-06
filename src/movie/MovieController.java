package movie;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ticket1.Ticket1Service;
import ticket1.Ticket1VO;
import util.Function;
import util.Parameter;

@Controller
public class MovieController {

	@Autowired
	MovieService movieService;
	
	@Autowired
	private Ticket1Service ticket1Service;
	
	@RequestMapping("/manage/movie/index.do")
	public String index(Model model, MovieVo param) throws Exception {
		param.setTablename("movie");
		int[] rowPageCount = movieService.count(param);
		ArrayList<MovieVo> list = movieService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/movie/index";
	}
	
	@RequestMapping("/movie/index.do")
	public String movieIndex (Model model, MovieVo param) throws Exception {
		param.setTablename("movie");
		param.setPageRows(9);
		
		int[] rowPageCount = movieService.nowCount(param);
		ArrayList<MovieVo> list = movieService.nowList(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "movie/index";
	}
	
	@RequestMapping("/api/movie/index.do")
	public String apimovieIndex (Model model, MovieVo param) throws Exception {
		param.setTablename("movie");
		param.setPageRows(9);
		
		int[] rowPageCount = movieService.count(param);
		ArrayList<MovieVo> list = movieService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "api/movie/index";
	}
	
	@RequestMapping("/movie/next.do")
	public String movieNextList (Model model, MovieVo param) throws Exception {
		param.setTablename("movie");
		int[] rowPageCount = movieService.nextCount(param);
		ArrayList<MovieVo> list = movieService.nextList(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "movie/nextList";
	}
	@RequestMapping("/manage/movie/write.do")
	public String write(Model model, MovieVo param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/movie/write";
	}
	
	@RequestMapping("/movie/detail.do")
	public String detail(Model model, MovieVo param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		param.setTablename("movie");
		MovieVo data = movieService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		StillCutVo scv = movieService.readStillCut(data.getNo());
		

		model.addAttribute("scv", scv);
		TrailerVo tv = movieService.readTrailer(data.getNo());
		model.addAttribute("tv",tv);
		ActorVo av = movieService.readActor(data.getNo());
		model.addAttribute("av",av);
		
		return "movie/detail";
	}
	
	
	@RequestMapping("/manage/movie/edit.do")
	public String edit(Model model, MovieVo param, HttpServletRequest request) throws Exception {
		param.setTablename("movie");
		MovieVo data = movieService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		StillCutVo scv = movieService.readStillCut(data.getNo());
		
		
		model.addAttribute("scv", scv);
		TrailerVo tv = movieService.readTrailer(data.getNo());
		model.addAttribute("tv",tv);
		ActorVo av = movieService.readActor(data.getNo());		
		model.addAttribute("av", av);
		return "manage/movie/edit";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/movie/process.do")
	public String process(Model model, MovieVo param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("movie");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = movieService.insert(param, request);
			int r2 = movieService.insert2(r, request); 
			int r3 = movieService.insert3(r, request);
			int r4 = movieService.insertActor(r, request);
			
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
			
		
	//		model.addAttribute("code", "alertMessageUrl");
	//		model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
	//		model.addAttribute("url", "index.do");
			
			 
		//	model.addAttribute("code", "alertMessageUrl");
		//	model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
		//	model.addAttribute("url", "index.do");
		
		} else if ("edit".equals(param.getCmd())) {
			int r = movieService.update(param, request); // 리턴값이 업데이트 한 갯수 
			int r2 = movieService.stillCutUpdate(param.getNo(), request);
			int r3 = movieService.trailerUpdate(param.getNo(), request);
			int r4 = movieService.actorUpdate(param.getNo(), request);
			
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = movieService.groupDelete(param, request);
			
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = movieService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		
		
		return "include/alert";
	}
	//나영=예매페이지에날짜뿌리는중
		@RequestMapping("/ticket/index.do")
		public String ticketDate(Model model, Ticket1VO param, MovieVo vo) throws Exception {
			ArrayList<Ticket1VO> date = ticket1Service.date(param);
			model.addAttribute("date", date);
			
			ArrayList<MovieVo> list = movieService.tkmovielist(vo);
			int[] tkmovieCount = movieService.tkmoviecount(vo);
			
			
			model.addAttribute("totCount", tkmovieCount[0]);
			model.addAttribute("totPage", tkmovieCount[1]);
			model.addAttribute("param", param);
			model.addAttribute("vo", vo);
			model.addAttribute("list", list);
		
			
			return "ticket/index";
		}
	
	//나영=메인박스오피스에쓸예매율
		@RequestMapping("/index.do")
		public String ticketcount(Model model, MovieVo vo) throws Exception {
			
			ArrayList<MovieVo> tklist = movieService.ticketcount(vo);
			
			model.addAttribute("tklist", tklist);
		
			
			return "index";
		}
	//나영=헤더에서 영화검색
		@RequestMapping("/include/searchMovie.do")
		public String searchMovie(Model model, MovieVo vo, Parameter param) throws Exception {
			
			vo.setTablename("movie");
			ArrayList<MovieVo> list = movieService.list(vo);
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			model.addAttribute("param", param);
		
			
			return "include/searchMovie";
		}
	
}
