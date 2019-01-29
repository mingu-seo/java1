package ticket1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.ActorVo;
import movie.MovieVo;
import movie.StillCutVo;
import movie.TrailerVo;
import movie.MovieService;

@Controller
public class Ticket1Controller {

	@Autowired
	private Ticket1Service ticket1Service;
	
	@Autowired
	private MovieService movieService;
	
	
	@RequestMapping("/manage/ticket1/index.do")
	public String index(Model model, Ticket1VO param) throws Exception {
		int[] rowPageCount = ticket1Service.count(param);
		ArrayList<Ticket1VO> list = ticket1Service.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/ticket1/index";
	}
	
	@RequestMapping("/manage/ticket1/edit.do")
	public String edit(Model model, Ticket1VO param, HttpServletRequest request) throws Exception {
		Ticket1VO data = ticket1Service.read(param, false);
		
		
		return "manage/ticket1/edit";
		
	}
	
	
	@RequestMapping("/ticket/ticket_form.do")
	public String ticket_form(Model model, MovieVo param) throws Exception {
	
		param.setTablename("movie");
		MovieVo data = movieService.read(param, false);
		ArrayList<Ticket1VO> movieDate = ticket1Service.aranMovieDate(data.getNo());
		model.addAttribute("data", data);
		model.addAttribute("movieDate",movieDate);
	
		return "ticket/ticket_form";
	}
	
	
	
		
}
