package board.reply;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

<<<<<<< HEAD
=======
import manage.admin.AdminVO;

>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;


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
<<<<<<< HEAD
	@RequestMapping("/manage/board/qna/write.do")
	public String write(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write";
	}
=======
	
	
	@RequestMapping("/manage/board/qna/write.do")
	public String write(Model model, NoticeVO param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/qna/write";
	}
	
>>>>>>> branch 'master' of https://github.com/mingu-seo/java1.git
}

