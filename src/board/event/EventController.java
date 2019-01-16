package board.event;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import manage.admin.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import util.FileUtil;
import util.Function;

@Controller
public class EventController {

	@Autowired
	EventService eventService;
	
	@RequestMapping("/manage/board/event/index.do")
	public String index(Model model, EventVO param) throws Exception {
		System.out.println(param.getSdisplay());
		param.setTablename("event");
		int[] rowPageCount = eventService.count(param);
		ArrayList<AdminVO> list = eventService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/event/index";
	}
	@RequestMapping("/board/event/index.do")
	public String indexv(Model model, EventVO param) throws Exception {
		System.out.println(param.getSdisplay());
		param.setTablename("event");
		int[] rowPageCount = eventService.count(param);
		ArrayList<AdminVO> list = eventService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "board/event/index";
	}
	@RequestMapping("/manage/board/event/write.do")
	public String write(Model model, EventVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/event/write";
	}
	
	@RequestMapping("/manage/board/event/edit.do")
	public String edit(Model model, EventVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("event");
		EventVO data = eventService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/event/edit";
	}
	@RequestMapping("/board/event/view.do")
	public String view(Model model, EventVO param) throws Exception {
		param.setTablename("event");
		EventVO data = eventService.read(param, true);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "board/event/view";
	}
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/board/event/process.do")
	public String process(Model model, EventVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("event");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = eventService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = eventService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = eventService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = eventService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		
		return "include/alert";
	}
}
