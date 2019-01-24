package test.junit;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)	//만든 클래스들을 한번에 모두 테스트할수 있다.
@SuiteClasses({
	 TestNotice.class, TestMovie.class
	})
public class TestAll {

}
