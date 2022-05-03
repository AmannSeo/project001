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

	


	// 고객센터 글 목록(관리자 페이지)
	@GetMapping("/admin/helpList")
	public void helpListGET(Model model, Integer page, Integer numsPerPage) {
		logger.info("list() Call");
		logger.info("list page = " + page + ", list numsPerPage =" + numsPerPage);
		
		// Paging 처리
		PageCriteria criteria = new PageCriteria();
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		List<HelpVO> helpList = helpService.readAll(criteria);
		if(!helpList.isEmpty()) {
			model.addAttribute("helpList", helpList); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(helpService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 고객센터 글 등록
	@GetMapping("/admin/helpInsert")
	public void insertHelpGET() {
		logger.info("insertHelpGET()");
	}
	
	@PostMapping("/admin/helpInsert")
	public String insertHelpPOST(HelpVO help, RedirectAttributes reAttr) {
		logger.info("insertHelpPOST() Call");
		logger.info("insert Help Board : " + help.toString());
		int result = helpService.insert(help);
		logger.info(result + "행 삽입");
		if(result == 1) {
			reAttr.addFlashAttribute("insert_result", "success");
			return "redirect:/admin/helpList";
		} else {
			reAttr.addFlashAttribute("insert_result", "fail");
			return "redirect:/admin/helpInsert";
			
		}
	}
	
	// 고객센터 글 보기
	@GetMapping("/admin/helpDetail")
	public void helpDetail(Model model, Integer helpNo, Integer page) {
		logger.info("help() Call");
		logger.info("help No : " + helpNo);
		HelpVO help = helpService.read(helpNo);
		model.addAttribute("help", help);
		model.addAttribute("page", page);
	}
	
	// 고객센터 글 수정
	@GetMapping("/admin/helpUpdate")
	public void updateGET(Model model, Integer helpNo, Integer page) {
		logger.info("updateGET() 호출 : helpNo = " + helpNo);
		HelpVO help = helpService.read(helpNo);
		model.addAttribute("help", help);
		model.addAttribute("page", page);
	} // end updateGET
	
	@PostMapping("/admin/helpUpdate")
	public String updatePUT(HelpVO help, Integer page) {
		logger.info("updatePUT() 호출 : helpNo = " + help.gethelpNo());
		int result = helpService.update(help);
		if(result == 1) {
			logger.info("help update success");
			return "redirect:/admin/helpDetail?helpNo=" + help.gethelpNo();
		} else {
			logger.info("help update fail");
			return "redirect:/admin/helpUpdate?helpNo=" + help.gethelpNo();
		}
	} // end updatePUT()
	
	// 고객센터 글 삭제
	@GetMapping("/admin/helpDelete")
	public String delete(Integer helpNo) {
		logger.info("delete() 호출 : helpNo =" + helpNo);
		int result = helpService.delete(helpNo);
		if(result == 1) {
			logger.info("update Success");
			return "redirect:/admin/helpList";
		} else {
			logger.info("update fail");
			return "redirect:/admin/helpDetail?helpNo=" + helpNo;
		}
	}

	
}












