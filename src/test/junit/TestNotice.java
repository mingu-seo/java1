package test.junit;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/context-*.xml"})
@WebAppConfiguration
public class TestNotice {

	@Autowired
    private WebApplicationContext ctx;
    private MockMvc mockMvc;
    
    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
    }
    
    @Test
    public void testSampleList() throws Exception {
    	RequestBuilder req = MockMvcRequestBuilders.fileUpload("/board/notice/index.do").fi
    			.param("reqPageNo", "1").param("stype", "all").param("sval", "노출");
        mockMvc.perform(req);
        
    }
}
