package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class Test1 {
	
//	@Autowired
	PasswordEncoder encoder = new BCryptPasswordEncoder();

	@Test
	public void test() {
		log.info(encoder.encode("hello"));
		log.info(encoder.encode("hello"));
		
		String e = encoder.encode("hello");
		log.info(encoder.matches("hello", e));
	}

}
