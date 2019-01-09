package test;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;

	@RequestMapping("/test.do")
	public String test(Model model) throws Exception {
		model.addAttribute("test", "테스트");
		
		ArrayList<TestVO> list = testService.getList();
		model.addAttribute("testList", list);
		return "test";
	}
	
	public static void main(String[] args) {
		System.out.println("test");
	}
}
