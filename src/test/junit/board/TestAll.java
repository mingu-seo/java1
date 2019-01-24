package test.junit.board;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({
	 TestNotice.class, TestEvent.class, TestFaq.class, TestReview.class
	})
public class TestAll {

}
