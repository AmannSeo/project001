package edu.spring.p01;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.spring.p01.domain.NoticeVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.pageutil.PageMaker;
import edu.spring.p01.service.NoticeService;

@Controller
public class NoticeController {
	private static final Logger logger =
			LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;

	
	// 공지사항 페이지 이동
	@GetMapping("/notice")
	public void noticePageGET() {
		logger.info("noticePageGET() Call");
	}
	


	// 고객센터 글 목록(관리자 페이지)
	@GetMapping("/admin/noticeList")
	public void noticeListGET(Model model, Integer page, Integer numsPerPage) {
		logger.info("noticeListGET() Call");
		logger.info("noticeListGET page = " + page + ", list numsPerPage =" + numsPerPage);
		
		// Paging 처리
		PageCriteria criteria = new PageCriteria();
		if(page != null) {
			criteria.setPage(page);
		}
		
		if(numsPerPage != null) {
			criteria.setNumsPerPage(numsPerPage);
		}
		
		List<NoticeVO> noticeList = noticeService.readAll(criteria);
		if(!noticeList.isEmpty()) {
			model.addAttribute("noticeList", noticeList); // 상품 존재
		} else {
			model.addAttribute("listCheck", "empty"); // 상품 존재 안 할 경우
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(noticeService.getTotalNumsOfRecords(criteria));
		pageMaker.setPageData();
		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	// 고객센터 글 등록
	@GetMapping("/admin/noticeInsert")
	public void insertNoticeGET() {
		logger.info("notice insertnoticeGET()");
	}
	
	@PostMapping("/admin/noticeInsert")
	public String insertNoticePOST(NoticeVO notice, RedirectAttributes reAttr) {
		logger.info("insertnoticePOST() Call");
		logger.info("insert notice Board : " + notice.toString());
		int result = noticeService.insert(notice);
		logger.info(result + "행 삽입");
		if(result == 1) {
			reAttr.addFlashAttribute("insert_result", "success");
			return "redirect:/admin/noticeList";
		} else {
			reAttr.addFlashAttribute("insert_result", "fail");
			return "redirect:/admin/noticeInsert";
			
		}
	}
	
	// 고객센터 글 보기
	@GetMapping("/admin/noticeDetail")
	public void noticeDetail(Model model, Integer noticeNo, Integer page) {
		logger.info("noticeDetail() Call");
		logger.info("noticep No : " + noticeNo);
		NoticeVO notice = noticeService.read(noticeNo);
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	}
	
	// 고객센터 글 수정
	@GetMapping("/admin/noticeUpdate")
	public void updateGET(Model model, Integer noticeNo, Integer page) {
		logger.info("notice updateGET() 호출 : noticeNo = " + noticeNo);
		NoticeVO notice = noticeService.read(noticeNo);
		model.addAttribute("notice", notice);
		model.addAttribute("page", page);
	} // end updateGET
	
	@PostMapping("/admin/noticeUpdate")
	public String updatePUT(NoticeVO notice, Integer page) {
		logger.info("updatePUT() 호출 : noticeNo = " + notice.getnoticeNo());
		int result = noticeService.update(notice);
		if(result == 1) {
			logger.info("notice update success");
			return "redirect:/admin/noticeDetail?noticeNo=" + notice.getnoticeNo();
		} else {
			logger.info("notice update fail");
			return "redirect:/admin/noticeUpdate?noticeNo=" + notice.getnoticeNo();
		}
	} // end updatePUT()
	
	// 고객센터 글 삭제
	@GetMapping("/admin/noticeDelete")
	public String delete(Integer noticeNo) {
		logger.info("delete() 호출 : noticeNo =" + noticeNo);
		int result = noticeService.delete(noticeNo);
		if(result == 1) {
			return "redirect:/admin/noticeList";
		} else {
			return "redirect:/admin/noticeDetail?noticeNo=" + noticeNo;
		}
	}
}
