package com.fitper.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fitper.domain.BoardVO;
import com.fitper.service.BoardService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board -> {
			log.info(board);
		});
	}
	
	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트제목1");
		vo.setContent("테스트내용1");
		vo.setWriter("테스트작성자1");
		
		log.info("return: " + service.register(vo));
	}
	
	@Test
	public void testRegisterKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트제목2");
		vo.setContent("테스트내용2");
		vo.setWriter("테스트작성자2");
		
		log.info("return: " + service.registerKey(vo));
	}

}










