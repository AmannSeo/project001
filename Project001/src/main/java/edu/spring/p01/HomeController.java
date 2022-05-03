package edu.spring.p01;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value= "")
public class HomeController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(HomeController.class);
	
	
	// Homepage link
	@GetMapping("/home")
	public void homePageGET() {
		logger.info("home() call");
		System.out.println(5/2);
	}
	
}
