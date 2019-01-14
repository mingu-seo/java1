package test;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import db.SqlMapClientDAOSupport;
import mail.SendMail;

@Repository
public class TestDAO extends SqlMapClientDAOSupport {
	
	public ArrayList getList() throws SQLException {
		ArrayList list = (ArrayList) getSqlMapClient().queryForList("test.select");
		return list;
	}
	
	public static void main(String[] args) throws Exception {
//		TestDAO dao = new TestDAO();
//		ArrayList<TestVO> list = dao.getList();
		
		SendMail.sendEmail("withsky@sanggong.co.kr", "tssu106@naver.com","제목", "내용");
		
//		for (int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getNo() + " " + list.get(i).getId() + " " +list.get(i).getName());
//		}
	}

}
