package board.reply2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import manage.admin.AdminVO;
import util.Function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.notice.NoticeVO;




@Controller
public class Reply2Controller {

	@Autowired
	Reply2Dao reply2Dao;
	
	@RequestMapping("/manage/board/qna2/index.do")
	public String index(Model model, Reply2Vo param) throws Exception {
		param.setTablename("reply");
		int[] rowPageCount = reply2Dao.count(param);
		ArrayList<AdminVO> list = reply2Dao.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/qna2/index";
	}
	
	@RequestMapping("/manage/board/qna2/write.do")
	public String write(Model model, Reply2Vo param, HttpServletRequest request) throws Exception {
		
		model.addAttribute("vo", param);
		
		return "manage/board/qna2/write";
	}
	
	@RequestMapping("/manage/board/qna2/view.do")
	public String view(Model model, Reply2Vo param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("reply");
		Reply2Vo data = reply2Dao.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna2/view";
	}
	
	@RequestMapping("/manage/board/qna2/edit.do")
	public String edit(Model model, Reply2Vo param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("reply");
		Reply2Vo data = reply2Dao.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna2/edit";
	}
	
	@RequestMapping("/manage/board/qna2/process.do")
	public String process(Model model, Reply2Vo param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("reply");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			int r = reply2Dao.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		}  else if ("edit".equals(param.getCmd())) {
			int r = reply2Dao.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = reply2Dao.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		
		return "include/alert";
	} 
		
	
}
