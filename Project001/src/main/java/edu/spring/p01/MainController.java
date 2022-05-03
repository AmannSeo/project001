package edu.spring.p01;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	private static final Logger logger =
			LoggerFactory.getLogger(MainController.class);
	
	// main page
	@RequestMapping(value= "/main", method = RequestMethod.GET)
	public void mainPageGET() {
		logger.info("mainGET() Call");
	}
	
	// fine-fragrances 페이지 이동
	@GetMapping(value="/fine-fragrances")
	public void fineFragrancesGET() {
		logger.info("fineFragrancesGET() Call");
	}
	
	// home creations 페이지 이동
	@GetMapping(value="/home-creations")
	public void homeCreationsGET() {
		logger.info("homeCreationsGET() Call");
	}
	
	// body-hair-face 페이지 이동
	@GetMapping(value="/body-hair-face")
	public void bodyHairFaceGET() {
		logger.info("bodyHairFaceGET() Call");
	}
	
	// GROOMING 페이지 이동
	@GetMapping(value="/grooming")
	public void groomingGET() {
		logger.info("groomingGET() Call");
	}
	
	// ABOUT US Page
	@GetMapping(value="/about-us")
	public void aboutUsGET() {
		logger.info("aboutUs() Call");
	}
	
}
