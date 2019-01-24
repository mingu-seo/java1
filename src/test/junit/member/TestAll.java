package test.junit.member;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)	//만든 클래스들을 한번에 모두 테스트할수 있다.
@SuiteClasses({
	 TestMember.class // TestMember.class 모든 클래스 테스트 할때
	})
public class TestAll {

}
