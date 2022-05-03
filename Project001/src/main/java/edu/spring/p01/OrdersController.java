package edu.spring.p01;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.p01.domain.OrderVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.service.OrderService;

@Controller
public class OrdersController {
	private static final Logger logger =
			LoggerFactory.getLogger(OrdersController.class);
	
	@Autowired
	private OrderService orderService;

	@GetMapping("/member/order")
	public void orderGET(Model model, Integer page, Integer numsPerPage) {
		logger.info("orderGET() Call");
		
	}
	
	@PostMapping("/member/order")
	public String orderPOST(OrderVO order, RedirectAttributes reAttr) {
		logger.info("orderGET() Call");
		logger.info("order : " + order.toString());
		int result = orderService.order(order);
		
		if(result == 1) {
			reAttr.addFlashAttribute("insert_result", "success");
			return "redirect:/member/mypage?memberNo=" + order.getMemberNo() ;
		} else {
			reAttr.addFlashAttribute("insert_result", "Fail");
			return "redirect:/product/order";
		}
	}
	

}













