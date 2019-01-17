package board.reply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeService;
import board.notice.NoticeVO;
import manage.admin.AdminVO;

@Controller
public class ReplyController {

	@Autowired
	ReplyDAO replyDao;
	
	@RequestMapping("/manage/board/qna/index.do")
	public String index(Model model, ReplyVO param) throws Exception {
		param.setTablename("reply");
		int[] rowPageCount = replyDao.count(param);
		ArrayList<AdminVO> list = replyDao.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/qna/index";
	}
	@RequestMapping("/manage/board/qna/write.do")
	public String write(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write";
	}
}
