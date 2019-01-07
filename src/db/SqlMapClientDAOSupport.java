package db;

import com.ibatis.sqlmap.client.SqlMapClient;

public class SqlMapClientDAOSupport {

	private SqlConfigiBatis scb = SqlConfigiBatis.getInstance();
	private SqlMapClient sqlMapper;
	
	public final SqlMapClient getSqlMapClient() {
		this.sqlMapper = scb.getSqlMapper();
		return this.sqlMapper;
	}
	
}
