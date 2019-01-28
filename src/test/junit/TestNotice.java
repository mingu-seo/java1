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

@ContextConfiguration(locations= {"classpath:config/context-*.xml"})   // classpath -> 클래스파일이 위치한 경로. 


@WebAppConfiguration
public class TestNotice {

	@Autowired //서버가 실행될 때 자동으로 객체를 실행해줌 
    private WebApplicationContext ctx;
    private MockMvc mockMvc;  // 목업의 그 목. 가상. 
    // 어디서든 쓸 수 있게 전역변수로 선언해준 것. 
    



    @Before	//junit의 실행순서는 before, test, after순으로 실행된다.

    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
        //test 하기 전에 before에서 기본적인 설정을 해줌. 지금은 초기값을 넣어준 것. 
    }
    
    @Test
    public void testSampleList() throws Exception {
    	RequestBuilder req = MockMvcRequestBuilders.get("/board/notice/index.do") // 가상의 mvc requestBuilders - get 방식으로 url 호출 
    			.param("reqPageNo", "1");  // 메소드를 연달아서 쓸 수 있는 이유는 리턴타입이 해당 객체이기 때문. 
        mockMvc.perform(req);
        
        
        req = MockMvcRequestBuilders.get("/manage/board/notice/index.do")
        		.param("reqPageNo", "1");
        mockMvc.perform(req);
    }
}
