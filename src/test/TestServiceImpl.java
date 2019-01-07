package test;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {
	
	@Autowired
	private TestDAO dao;

	@Override
	public ArrayList<TestVO> getList() throws Exception {
		ArrayList<TestVO> list = dao.getList();
		return list;
	}

}
