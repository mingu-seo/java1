package ticket1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import member.MemberVO;
import movie.MovieService;
import movie.MovieVo;
import review.ReviewVO;
import util.Function;

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
	
	/**
	 * 회원정보 상세페이지
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/ticket1/read.do")
	public String read(Model model, Ticket1VO param) throws Exception {
		Ticket1VO data = ticket1Service.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/ticket1/read";
		
	}
	/**
	 * 관리자 예매 상세페이지
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/ticket1/edit.do")
	public String edit(Model model, Ticket1VO param, MovieVo mparam, HttpServletRequest request) throws Exception {
		mparam.setTablename("movie");
		Ticket1VO data = ticket1Service.read(param.getNo());
		mparam.setNo(data.getMovie_pk());
		MovieVo mdata = movieService.read(mparam, false);
		ArrayList scrDate = movieService.read(mparam);
		model.addAttribute("data", data);
		model.addAttribute("mdata", mdata);
		model.addAttribute("scrDate", scrDate);
		model.addAttribute("vo", param);
		
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
	
	@RequestMapping("/ticket/book.do")
	public String book(Model model, Ticket1VO param, MovieVo mparam) throws Exception {
		
		int r = ticket1Service.book(param);
		
		model.addAttribute("book", r);
		
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
		model.addAttribute("url", "index.do");
		
		if(param.getPay()==2) {
			param.setPay_state(1);
		}
		
		return "ticket/ticketPayProcessing";
	}

	
	
	
		
}
