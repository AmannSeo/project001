package edu.spring.p01;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.persistence.AdminDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
@WebAppConfiguration
public class AdminControllerTest {
	private static final Logger logger =
	         LoggerFactory.getLogger(AdminControllerTest.class);

	
	@Autowired
//	private WebApplicationContext wac; // 웹 어플리케이션 객체
	private AdminDAO dao;
	
	/*
	 * // MVC 패턴의 앱을 테스트 하는 mock-up 객체 private MockMvc mock;
	 * 
	 * @Before // 실제 JUnit 테스트를 실행하기 전에 초기화 작업을 수행하는 메소드 public void beforeTest() {
	 * logger.info("beforTest() 호출"); logger.info("wac : " + wac);
	 * logger.info("mock : " + mock); // 컨트롤러 메소드에게 요청을 보낼 수 있는 mock-up 객체 생성 mock =
	 * MockMvcBuilders.webAppContextSetup(wac).build(); }
	 * 
	 * @Test public void test() throws Exception { testList(); }
	 * 
	 * private void testList() throws Exception { logger.info("testList() 호출"); //
	 * get(uri) : GET 요청에 대한 mock 객체 생성 // post(uri) : POST 요청에 대한 mock 객체 생성 //
	 * put(uri) : PUT 요청에 대한 mock 객체 생성 // delete(uri) : DELETE 요청에 대한 mock 객체 생성 //
	 * param(key, value) : 파라미터 데이터 전송 // parms(params) : 파라미터(map 형식) 데이터 전송
	 * 
	 * MultiValueMap<String, String> params = new LinkedMultiValueMap<String,
	 * String>(); params.add("page", "1"); params.add("numsPerPage", "5");
	 * 
	 * 
	 * mock.perform(get("/admin/productList").params(params)); }
	 * 
	 * @After // JUnit 테스트 수행 후 호출되는 메소드 public void afterTest() {
	 * logger.info("afterTest() 호출"); }
	 */
	
	/*
	 * @Test public void imageEnrollTest() { AttachImageVO vo = new AttachImageVO();
	 * 
	 * vo.setProductNo(1); vo.setFileName("test"); vo.setUploadPath("test");
	 * vo.setUuid("test1");
	 * 
	 * dao.imageEnroll(vo); }
	 */

	@Test
	public void productRegTest() throws Exception{
		ProductVO product = new ProductVO();
		
		product.setProductNo(101);
		product.setProductName("imageTest");
		product.setCateCode("10");
		product.setProductPrice(100);
		product.setProductAmount(1);
		product.setProductIntro("test");
		
		System.out.println("Berfore ProductVO : " + product);
		
		dao.insert(product);
		
		System.out.println("After ProductVO : " + product);
		
	}
	
}






