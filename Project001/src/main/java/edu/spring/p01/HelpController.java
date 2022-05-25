package edu.spring.p01;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.service.HelpService;

@Controller
public class HelpController {
	private static final Logger logger =
			LoggerFactory.getLogger(HelpController.class);
	
	@Autowired
	private HelpService helpService;

	


	
	
}












