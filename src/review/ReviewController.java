package review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.event.EventVO;
import manage.admin.AdminVO;
import member.MemberVO;
import util.Function;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/manage/movie/review/index.do")
	public String index(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<AdminVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/movie/review/index";
	}
	
	//리뷰 사용자
	@RequestMapping("/movie/reviewList.do")
	public String indexv(Model model, ReviewVO param) throws Exception {
		param.setTablename("review");
		int[] rowPageCount = reviewService.count(param);
		ArrayList<AdminVO> list = reviewService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "movie/reviewList";
	}
	
	@RequestMapping("/movie/review/insert.do")
	public String insert(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		MemberVO memberInfo = (MemberVO)request.getSession().getAttribute("memberInfo");
		param.setMember_pk(memberInfo.getNo()+"");
		model.addAttribute("vo", param);
		
		int r = reviewService.insert(param);
		model.addAttribute("value", r);
		
		return "include/return";
	}
	
	@RequestMapping("/movie/review/delete.do")
	public String delete(Model model, ReviewVO param) throws Exception {
		model.addAttribute("vo", param);
		int d = reviewService.delete(param);
		model.addAttribute("value" , d);
		return "include/return";
	}
	
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/manage/movie/review/process.do")
	public String process(Model model, ReviewVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("review");
		System.out.println(param.getCmd());
		 if ("groupDelete".equals(param.getCmd())) {
			int r = reviewService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reviewService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} 
	
		return "include/alert";
	}
	
	
	
	
	
	
}
