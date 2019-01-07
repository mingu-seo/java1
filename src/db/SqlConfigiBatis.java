package db;
  
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SqlConfigiBatis {

	public SqlMapClient sqlMapper = null;
	private static SqlConfigiBatis instance = null;

	/**
	 * 생성자 sqlMapConfig.xml 세팅
	 * @throws Exception
	 */
    private SqlConfigiBatis() throws Exception {
    	Reader reader = null;
    	Charset charset = Charset.forName("UTF-8");
    	Resources.setCharset(charset);  // 케릭터셋 생성.
    	try {
    		if (sqlMapper == null) {
    			reader = Resources.getResourceAsReader("config/sqlMapConfig.xml");    			
    			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); 
    			reader.close();
    		}
    	} catch (IOException e) {
    		throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
    	} finally {
    		if (reader != null)
    			reader.close();
    		reader = null;
    	}
    }
   
    /**
     * instance 생성
     * @return SqlConfigiBatis
     */
    public static SqlConfigiBatis getInstance() {
        try {
        	if (instance == null) {
        		instance = new SqlConfigiBatis();
        	}
        } catch (Exception e) {
            System.out.println(e);
        }
        return instance;
    }
    
    /**
     * get sqlMapper SqlMapClient객체
     * @return SqlMapClient
     */
    public SqlMapClient getSqlMapper() {
        return sqlMapper;
    }
}
