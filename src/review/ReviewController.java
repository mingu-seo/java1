package review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import manage.admin.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.FileUtil;
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
//	@RequestMapping("/movie/review/index.do")
//	public String indexv(Model model, ReviewVO param) throws Exception {
//		param.setTablename("review");
//		int[] rowPageCount = reviewService.count(param);
//		ArrayList<AdminVO> list = reviewService.list(param);
//		
//		model.addAttribute("totCount", rowPageCount[0]);
//		model.addAttribute("totPage", rowPageCount[1]);
//		model.addAttribute("list", list);
//		model.addAttribute("vo", param);
//		
//		return "movie/review/index";
//	}
	
	
	

	
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
