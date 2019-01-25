package board.reply3;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import manage.admin.AdminVO;
import member.MemberVO;
import util.Function;

@Controller
public class ReplyController3 {

	@Autowired
	ReplyDAO3 replyDao;
	
	@RequestMapping("/manage/board/qna3/index.do")
	public String index(Model model, ReplyVO3 param) throws Exception {
		param.setTablename("reply");
		int[] rowPageCount = replyDao.count(param);
		ArrayList<AdminVO> list = replyDao.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/board/qna3/index";
	}
	@RequestMapping("/board/qna/index.do")
	public String indexv(Model model, ReplyVO3 param) throws Exception {
		param.setTablename("reply");
		int[] rowPageCount = replyDao.count(param);
		ArrayList<AdminVO> list = replyDao.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "board/qna/index";
	}
	@RequestMapping("/board/qna/view.do")
	public String view(Model model, ReplyVO3 param) throws Exception {
		param.setTablename("reply");
		ReplyVO3 data = replyDao.read(param, true);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "board/qna/view";
	}
	@RequestMapping("/manage/board/qna3/edit.do")
	public String edit(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		param.setTablename("reply");
		ReplyVO3 data = replyDao.read(param, false);
		model.addAttribute("data", data);
		model.addAttribute("param", param);
		
		return "manage/board/qna3/edit";
		
	}
	@RequestMapping("/manage/board/qna3/write.do")
	public String write(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
		AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "manage/board/qna3/write";
	}
	
	@RequestMapping("/board/qna/swrite.do")
	public String swrite(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
		//AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
		//model.addAttribute("admin_no", adminInfo.getNo());
		model.addAttribute("vo", param);
		
		return "board/qna/swrite";
	}
	
		@RequestMapping("/manage/board/qna3/reply.do")
		public String reply(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
			AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
			model.addAttribute("admin_no", adminInfo.getNo());
			param.setTablename("reply");
			model.addAttribute("vo", param);
			ReplyVO3 data = replyDao.read(param, false);
			model.addAttribute("data", data);
			
			return "manage/board/qna3/reply";
		
	}
		@RequestMapping("/board/qna/sreply.do")
		public String sreply(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
			//AdminVO adminInfo = (AdminVO)request.getSession().getAttribute("adminInfo");
			//model.addAttribute("admin_no", adminInfo.getNo());
			param.setTablename("reply");
			model.addAttribute("vo", param);
			ReplyVO3 data = replyDao.read(param, false);
			model.addAttribute("data", data);
			
			return "board/qna/sreply";
			
		}
	@RequestMapping("/manage/board/qna3/process.do")
	public String process(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("reply");
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			
			int r = replyDao.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = replyDao.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("reply".equals(param.getCmd())) {
			int r = replyDao.reply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 답변되었습니다.", "답변실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = replyDao.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = replyDao.groupDelete(param, request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		return "include/alert";
	}
	@RequestMapping("/board/qna/sprocess.do")
	public String sprocess(Model model, ReplyVO3 param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		param.setTablename("reply");
		//MemberVO memberInfo = (MemberVO)request.getSession().getAttribute("memberInfo");
		//param.setMember_fk(memberInfo.getNo());
		System.out.println(param.getCmd());
		if ("write".equals(param.getCmd())) {
			int r = replyDao.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index.do");
		} else if ("edit".equals(param.getCmd())) {
			int r = replyDao.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("reply".equals(param.getCmd())) {
			int r = replyDao.reply(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 답변되었습니다.", "답변실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = replyDao.delete(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index.do", param, 0));
		}
		
		return "include/alert";
	}	

}
