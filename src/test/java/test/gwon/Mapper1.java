package test.gwon;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration( {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"}) 
@Log4j 
public class Mapper1 {
	
	@Setter(onMethod_ = @Autowired) private MemberMapper mapper; 
	@Setter(onMethod_ = @Autowired) private PasswordEncoder encoder;



	@Test public void textUpdate() { 
	 

		MemberVO vo = mapper.read("kim"); 
		String newpw = "111"; 
		vo.setUserpw(encoder.encode(newpw)); 
		assertEquals(1, mapper.update(vo));
	}
}
