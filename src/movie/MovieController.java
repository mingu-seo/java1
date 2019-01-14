package movie;

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
public class MovieController {

	@Autowired
	MovieService movieService;
	
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
	
	@RequestMapping("/manage/movie/write.do")
	public String write(Model model, MovieVo param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/movie/write";
	}
	
	@RequestMapping("/manage/movie/edit.do")
	public String edit(Model model, MovieVo param) throws Exception {
		param.setTablename("movie");
		MovieVo data = movieService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
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
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = movieService.update(param, request);
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
}
