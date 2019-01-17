package board.reply1;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;
import manage.admin.AdminVO;
import util.Function;



@Controller
public class Reply1Controller {

	@Autowired
	Reply1DAO replyDao;
	
	@RequestMapping("/manage/board/qna1/index.do")
	public String index(Model model, Reply1VO param) throws Exception {
		param.setTablename("reply");
		int[] rowPageCount = replyDao.count(param);
		ArrayList<Reply1VO> list = replyDao.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/qna1/index";
	}
	
	@RequestMapping("/manage/board/qna1/read.do")
	public String read(Model model, Reply1VO param) throws Exception {
		param.setTablename("reply");
		Reply1VO data = replyDao.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna1/read";
	}
	
	@RequestMapping("/manage/board/qna1/edit.do")
	public String edit(Model model, Reply1VO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("reply");
		Reply1VO data = replyDao.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna1/edit";
	}
	
	@RequestMapping("/manage/board/qna1/write.do")
	public String write(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/qna1/write";
	}
	
	@RequestMapping("/manage/board/qna1/reply.do")
	public String reply(Model model, Reply1VO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("param", param);
		param.setTablename("reply");
		Reply1VO data = replyDao.read(param, false);
		model.addAttribute("data", data);
		
		return "manage/board/qna1/reply";
	}
	
	@RequestMapping("/manage/board/qna1/process.do")
	public String process(Model model, Reply1VO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("reply");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			int r = replyDao.insert(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = replyDao.update(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = replyDao.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = replyDao.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}else if("reply".equals(param.getCmd())) {
			int r = replyDao.reply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		}
		
		return "include/alert";
	}
}
