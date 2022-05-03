package edu.spring.p01;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class LoginController {
	private static final Logger logger =
			LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 페이지
	@GetMapping(value = "/login")
	public void loginGET() {
		logger.info("loginGET() Call");
	}
	
	// 로그인
	@PostMapping(value="/login")
	public String loginPOST(HttpServletRequest request, MemberVO vo, RedirectAttributes attr) throws Exception{
		logger.info("login Method 진입");
		logger.info("전달된 데이터 : " + vo);
		
		HttpSession session = request.getSession();
		MemberVO member = memberService.login(vo);
		
		if(member == null) {
			int result = 0;
			attr.addFlashAttribute("result", result);
			return "redirect:/member/login";
		}
		
		session.setAttribute("vo", member);
		
		return "redirect:/main";
	}
	
	// 로그아웃
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		logger.info("logout() 호출");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/main";
	}

	// 비동기방식 로그아웃 메소드
	@PostMapping(value="/logout")
	@ResponseBody
	public void logoutPOST(HttpServletRequest request) throws Exception{
		logger.info("logout() Call");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
	}
	

}






