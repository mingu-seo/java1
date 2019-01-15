package board.faq;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import property.SiteProperty;
import util.FileUtil;
import util.Function;
import util.Page;

@Service
public class FaqService {

	@Autowired
	private FaqDAO faqDao;
	
	public int[] count(FaqVO vo) throws Exception {
		int rowCount = faqDao.count(vo);
		int[] rowPageCount = new int[2];
		int pageCount = Page.getPageCount(vo.getPageRows(), rowCount);
		rowPageCount[0] = rowCount;
		rowPageCount[1] = pageCount;
		return rowPageCount;
	}

	public ArrayList list(FaqVO vo) throws Exception {
		ArrayList list = faqDao.list(vo);
		return list;
	}

	public int insert(FaqVO vo,HttpServletRequest request) throws Exception {
		int lastNo = (Integer)faqDao.insert(vo);
		return lastNo;
	}
	
	public FaqVO read(FaqVO vo) throws Exception {
		FaqVO data = faqDao.read(vo);
		return data;
	}

	public int update(FaqVO vo, HttpServletRequest request) throws Exception {
		int r = (Integer)faqDao.update(vo);
		return r;
	}

	
	public int delete(FaqVO vo) throws Exception {
		int r = faqDao.delete(vo);
		return r;
	}
	
	public int groupDelete(FaqVO vo, HttpServletRequest request) throws Exception {
		String[] nos = request.getParameterValues("no");
		int delCount = 0;
		if (nos.length > 0) {
			for (int i=0; i<nos.length; i++) {
				vo.setNo(Function.getIntParameter(nos[i]));
				int r = faqDao.delete(vo);
				if (r > 0) {
					delCount++;
				}
			}
		}
		return delCount;
	}

	/*
	public ArrayList mainList(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
