package edu.spring.p01;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.spring.p01.domain.MemberVO;
import edu.spring.p01.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	private static final Logger logger =
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		logger.info("joinGET() Call");
	}
	
	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO vo) throws Exception{
		logger.info("joinPOST() Call");
		
		// 회원가입 서비스 실행
		memberService.insert(vo);
		
		logger.info("insert success");
		
		/*
		 * String rawPw = ""; // 인코딩 전 비밀번호 String encodePw = ""; // 인코딩 후 비밀번호
		 * 
		 * rawPw = vo.getMemberPw(); // 비밀번호 데이터 얻음 encodePw = pwEncoder.encode(rawPw);
		 * // 비밀번호 인코딩 vo.setMemberPw(encodePw); // 인코딩 된 비밀번호 vo객체에 다시 저장
		 */		
		/* 회원가입 쿼리 실행 */
		memberService.insert(vo);
		
		
		return "redirect:/main";
	
	}
	
	// 마이페이지 이동
	@GetMapping(value="/mypage")
	public void mypageGET(Model model, int memberNo) {
		logger.info("mypageGET() Call - memberNo : " + memberNo);
		MemberVO vo = memberService.select(memberNo);
		model.addAttribute("vo", vo);
	}
	
	
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
		logger.info("memberIdChk() Call");
		
		int result = memberService.idCheck(memberId);
		
		logger.info("result = " + result);
		if(result != 0) {
			return "fail"; // 중복 아이디가 존재
		} else {
			return "success";
		}
		
	} // memberIdChkPOST()
	
	
	// 이메일 인증
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String mail) throws Exception{
		
		// 뷰(view)로부터 넘어온 데이터 확인
		logger.info("Email Data Check");
		logger.info("인증번호 : " + mail);
		
		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 : " + checkNum);
		
		// 이메일 보내기
		String setFrom = "yeacome@naver.com";
		String toMail = mail;
		String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
        try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        String num = Integer.toString(checkNum);
        
        return num;
	}
	
	// 회원 정보 수정
	@GetMapping("/update")
	public void updateGET(Model model, Integer memberNo) {
		logger.info("updateGET() Call");
		logger.info("Member No : " + memberNo);
		MemberVO member = memberService.select(memberNo);
		model.addAttribute("memberNo", member);
	}
	
	@PostMapping("/update")
	public String updatePOST(MemberVO member) {
		logger.info("updatePOST() Call");
		logger.info("member : " + member);
		int result = memberService.update(member);
		if(result == 1) {
			logger.info("member ID update Success");
			return "redirect:/member/mypage?memberNo=" + member.getMemberNo();
		} else {
			logger.info("member ID update Fail");
			return "redirect:/member/update?memberNo=" + member.getMemberNo();
		}
	}
	
	// 회원 정보 삭제
	@GetMapping("/delete")
	public String deleteGET(Integer memberNo) {
		logger.info("delete() Call");
		logger.info("delete member No : " + memberNo);
		int result = memberService.delete(memberNo);
		if(result == 1) {
			logger.info("member Delete success");
			return "redirect:/main";
		} else {
			logger.info("member Delete Fail");
			return "redirect:/member/mypage?memberNo=" + memberNo;
		}
	}
	

	
}










