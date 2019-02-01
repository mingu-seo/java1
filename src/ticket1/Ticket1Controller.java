package ticket1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import movie.MovieService;
import movie.MovieVo;
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
	public String book(Model model, Ticket1VO param, MovieVo mparam, HttpServletRequest request) throws Exception {
		
		int r = ticket1Service.book(param); //예매 insert 부분
		model.addAttribute("book", r);
		if(param.getUsePoint()>0) {
			ticket1Service.minusPoint(param.getMember_pk(), request);
		}
		if(param.getPay()==2) {
			ticket1Service.plusPoint(param.getMember_pk(), request);
		}
	//	model.addAttribute("point", point);
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", Function.message(r, "정상적으로 예매되었습니다.", "등록실패"));
		model.addAttribute("url", "index.do");
		
		// r = 호출한 것에 대한 리턴값 
		
		if(param.getPay()==2) {
			param.setPay_state(1);
		}
		
		return "include/alert";
	}
	

	@RequestMapping("/ticket/cancel.do")
	public String ticketCancel(Model model, Ticket1VO tvo, PointVo pvo ) throws Exception{
		tvo.setRes_state(2);
		ticket1Service.resStateUpdate(tvo);
		
		return "";
	}

	@RequestMapping("/manage/ticket1/process.do")
	public String ticketProcess(Model model, Ticket1VO param, HttpServletRequest request) throws Exception {
		if ("edit.do".equals(param.getCmd())) {
			Ticket1VO r2 = ticket1Service.read(param.getNo());
			if(r2.getPay_state()==2 && param.getPay_state()==1) {
				ticket1Service.plusPoint(r2.getMember_pk(), request);
			}

			int r = ticket1Service.update(param);
			
			
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}else if ("delete.do".equals(param.getCmd())) {
			int r = ticket1Service.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		return "include/alert";
	}
	
		
}
