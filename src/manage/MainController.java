package manage;

import javax.servlet.http.HttpSession;

import manage.admin.AdminService;
import manage.admin.AdminVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import property.SiteProperty;

@Controller
public class MainController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/manage")
	public String main(Model model) throws Exception {

		return "manage/index";
	}
	
	@RequestMapping("/manage/login")
	public String login(Model model, @RequestParam(value="login_url", required=false) String login_url, @RequestParam(value="login_param", required=false) String login_param, AdminVO vo, HttpSession session) throws Exception {
		if (adminService.loginCheck(vo)) {
			
			AdminVO adminInfo = adminService.getLoginSessionInfo(vo);
			adminInfo.setIp(vo.getIp());
			adminService.insertLoginHistory(adminInfo);		// 로그인히스토리 저장
			session.setAttribute("adminInfo", adminInfo);	// 세션 저장
			String redirectUrl = SiteProperty.INDEX_PAGE; // 시작페이지
			
			// 로그인 이전페이지 존재하는 경우
			if(login_url != null && !"".equals(login_url)) {
				redirectUrl = login_url;
				
				if(login_param != null && !"".equals(login_param)) {
					redirectUrl = redirectUrl + "?" + login_param;					
				}
			}
			
			return "redirect:"+redirectUrl;
		} else {
			model.addAttribute("code", "alertMessageBack");
			model.addAttribute("message", "아이디, 비밀번호가 올바르지 않습니다.");
			return "include/alert";
		}
	}
	
	/**
	 * 로그아웃 처리
	 * @param model
	 * @return
	 */
	@RequestMapping("/manage/logout")
	public String logout(Model model) {
		//loginInfoProvider.get().remove();
		
		model.addAttribute("code", "alertMessageUrl");
		model.addAttribute("message", "정상적으로 로그아웃 되었습니다.");
		model.addAttribute("url", "/manage");
		
		return "include/alert";		
	}
}
