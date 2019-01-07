package manage.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Function;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/manage/admin/index")
	public String index(Model model, AdminVO param) throws Exception {
		int[] rowPageCount = adminService.count(param);
		ArrayList<AdminVO> list = adminService.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/admin/index";
	}
	
	@RequestMapping("/manage/admin/read")
	public String read(Model model, AdminVO param) throws Exception {
		AdminVO data = adminService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/admin/read";
	}
	
	@RequestMapping("/manage/admin/edit")
	public String edit(Model model, AdminVO param) throws Exception {
		AdminVO data = adminService.read(param.getNo());
		model.addAttribute("data", data);
		model.addAttribute("vo", param);
		
		return "manage/admin/edit";
	}
	
	@RequestMapping("/manage/admin/write")
	public String write(Model model, AdminVO param) throws Exception {
		model.addAttribute("vo", param);
		
		return "manage/admin/write";
	}
	
	/**
	 * 관리자 아이디 중복체크
	 * 사용자에서 저장시 ajax로 체크
	 * @param model
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/admin/idcheck")
	public String idcheck(Model model, AdminVO param) throws Exception {
		model.addAttribute("vo", param);
		int value = adminService.idcheck(param);

		model.addAttribute("value", value);
		
		return "include/return";
	}
	
	/**
	 * 등록, 수정, 삭제 cmd값으로 구분해서 처리
	 * @param model
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/manage/admin/process")
	public String process(Model model, AdminVO param, HttpServletRequest request) throws Exception {
		model.addAttribute("vo", param);
		
		if ("write".equals(param.getCmd())) {
			int r = adminService.insert(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 등록되었습니다.", "등록실패"));
			model.addAttribute("url", "index");
		} else if ("edit".equals(param.getCmd())) {
			int r = adminService.update(param);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 수정되었습니다.", "수정실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("groupDelete".equals(param.getCmd())) {
			int r = adminService.groupDelete(request);
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "총 "+r+"건이 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		} else if ("delete".equals(param.getCmd())) {
			int r = adminService.delete(param.getNo());
			model.addAttribute("code", "alertMessageUrl");
			model.addAttribute("message", Function.message(r, "정상적으로 삭제되었습니다.", "삭제실패"));
			model.addAttribute("url", param.getTargetURLParam("index", param, 0));
		}
		
		return "include/alert";
	}
	
	@RequestMapping("/manage/admin/loginHistory")
	public String loginHistory(Model model, AdminVO param) throws Exception {
		int[] rowPageCount = adminService.countLoginHistory(param);
		ArrayList<AdminVO> list = adminService.listLoginHistory(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/admin/loginHistory";
	}
}
