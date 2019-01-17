package board.reply;

import java.util.ArrayList;

import manage.admin.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


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
}
