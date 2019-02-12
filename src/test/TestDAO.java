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
	
	public static String getStringBuffer() {
		StringBuffer sb = new StringBuffer();
		sb.append("1");
		sb.append("2");
		sb.append("3");
		sb.append("4");
		return sb.toString();
	}
	
	public static void main(String[] args) throws Exception {
		TestDAO dao = new TestDAO();
		ArrayList<TestVO> list = dao.getList();
		
		
		for (int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getNo() + " " + list.get(i).getId() + " " +list.get(i).getName());
		}
		
//		System.out.println(getStringBuffer());
	}

}
