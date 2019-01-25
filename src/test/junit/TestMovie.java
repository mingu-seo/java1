package test.junit;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import manage.admin.AdminVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/context-*.xml"})
@WebAppConfiguration
public class TestMovie {

	@Autowired
    private WebApplicationContext ctx;
    private MockMvc mockMvc;
    private MockHttpSession session;
    
    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
        AdminVO adminInfo = new AdminVO();
        adminInfo.setId("test");
        adminInfo.setName("test");
        session = new MockHttpSession();
        session.setAttribute("adminInfo", adminInfo);
            
        MockHttpServletRequest request = new MockHttpServletRequest();
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
        request.setSession(session);
    }

    @Test
    public void testSampleList() throws Exception {
    	// 사용자 영화(현재 상영작) 목록
    	RequestBuilder req = MockMvcRequestBuilders.get("/movie/index.do")
    			.param("reqPageNo", "1");
        mockMvc.perform(req);
    }
    
    @Test
    public void testSampleList2() throws Exception {
        // 관리자 영화(현재 상영작) 목록
        RequestBuilder req = MockMvcRequestBuilders.get("/manage/movie/index.do")
    			.session(session)
        		.param("reqPageNo", "1");
        mockMvc.perform(req);
    }
}
