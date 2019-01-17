package board.notice;

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
public class NoticeController {

	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/manage/board/notice/index.do")
	public String index(Model model, NoticeVO param) throws Exception {
		System.out.println(param.getSdisplay());
		param.setTablename("notice");
		int[] rowPageCount = noticeService.count(param);
		ArrayList<AdminVO> list = noticeService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/notice/index";
	}
	
	@RequestMapping("/board/notice/index.do")
	public String indexv(Model model, NoticeVO param) throws Exception {
		System.out.println(param.getSdisplay());
		param.setTablename("notice");
		param.setSdisplay(1);
		int[] rowPageCount = noticeService.count(param);
		ArrayList<AdminVO> list = noticeService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "board/notice/index";
	}
	
	@RequestMapping("/manage/board/notice/write.do")
	public String write(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/notice/write";
	}
	
	@RequestMapping("/manage/board/notice/edit.do")
	public String edit(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("notice");
		NoticeVO data = noticeService.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/notice/edit";
	}
	
	@RequestMapping("/board/notice/view.do")
	public String view(Model model, NoticeVO param) throws Exception {
		param.setTablename("notice");
		NoticeVO data = noticeService.read(param, true);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "board/notice/view";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/board/notice/process.do")
	public String process(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("notice");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = noticeService.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = noticeService.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = noticeService.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = noticeService.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		
		return "include/alert";
	}
}
