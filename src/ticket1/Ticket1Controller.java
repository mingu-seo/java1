package ticket1;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class Ticket1Controller {

	@Autowired
	private Ticket1Service ticket1Service;
	
	
	@RequestMapping("/manage/ticket1/index.do")
	public String index(Model model, Ticket1VO param) throws Exception {
		int[] rowPageCount = ticket1Service.count(param);
		ArrayList<Ticket1VO> list = ticket1Service.list(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("list", list);
		model.addAttribute("vo", param);
		
		return "manage/ticket1/index";
	}
	
	//나영=예매페이지에날짜뿌리는중
	@RequestMapping("/ticket/index.do")
	public String ticketDate(Model model, Ticket1VO param) throws Exception {
		param.setTablename("ticket");
		param.setTablename("calender");
		int[] rowPageCount = ticket1Service.count(param);
		ArrayList<Ticket1VO> date = ticket1Service.date(param);
		
		model.addAttribute("totCount", rowPageCount[0]);
		model.addAttribute("totPage", rowPageCount[1]);
		model.addAttribute("date", date);
		model.addAttribute("vo", param);
		
		return "ticket/index";
	}
}
