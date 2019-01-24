package test.junit.member;

import java.io.File;
import java.io.FileInputStream;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.mock.web.MockMultipartFile;
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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/context-*.xml"})
@WebAppConfiguration
public class TestMember {

	@Autowired
    private WebApplicationContext ctx;
    private MockMvc mockMvc;
    private MockHttpSession session;
    
    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
//        MemberVO memberInfo = new MemberVO();
//        memberInfo.setEmail("tssu106@hanmail.net");
//        memberInfo.setPw("brood14");
//        memberInfo.setNo(2);
//        session = new MockHttpSession();
//        session.setAttribute("memberInfo", memberInfo);
            
        MockHttpServletRequest request = new MockHttpServletRequest();
        RequestContextHolder.setRequestAttributes(new ServletRequestAttributes(request));
//        request.setSession(session);
    }

    @Test	//사용자 테스트
    public void testSampleList() throws Exception {
    	// 첨부파일이 존재하는 경우
//    	File file = new File("E:\\workspace\\java1\\WebContent\\img\\poster1.jpg");
//    	FileInputStream fis = new FileInputStream(file);
//    	MockMultipartFile mmf = new MockMultipartFile("filename_tmp", file.getName(), "multipart/form-data", fis);
//    	
//    	RequestBuilder req = MockMvcRequestBuilders.fileUpload("/member/process.do").file(mmf)
//    			.param("cmd", "write.do")
//    			.param("name", "이상윤")
//    			.param("birth", "111111")
//    			.param("email", "tssu106@naver.com")
//    			.param("pw", "brood14")
//    			.param("gender", "1")
//    			.param("hp", "010-1111-1111");
//    	
    	// 첨부파일이 존재하지 않는 경우
    	
    	RequestBuilder req = MockMvcRequestBuilders.fileUpload("/member/process.do")
    			.param("cmd", "write.do")
    			.param("name", "이상윤")
    			.param("birth", "111111")
    			.param("email", "tssu106@naver.com")
    			.param("pw", "brood14")
    			.param("gender", "1")
    			.param("hp", "010-1111-1111");
    			
        mockMvc.perform(req);
        
    }
    
   @Test	//관리자 테스트
    public void testSampleList2() throws Exception {
    	
    
   }
}
