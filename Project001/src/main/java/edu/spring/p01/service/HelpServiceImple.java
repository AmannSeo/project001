package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.HelpDAO;

@Service
public class HelpServiceImple implements HelpService{
	private static final Logger logger =
			LoggerFactory.getLogger(HelpServiceImple.class);
	
	@Autowired
	private HelpDAO helpDao;

	// 질문 등록
	@Override
	public int insert(HelpVO help) {
		logger.info("(help)insert() Call");
		logger.info("helpVO : " + help.toString());
		return helpDao.insert(help);
	}

	// 질문 읽기
	@Override
	public HelpVO read(int helpNo) {
		logger.info("read() Call : helpNo = " + helpNo);
		return helpDao.read(helpNo);
	}

	// 질문 수정
	@Override
	public int update(HelpVO help) {
		logger.info("update() Call : help = " + help.toString());
		return helpDao.update(help);
	}

	// 질문 삭제
	@Override
	public int delete(int helpNo) {
		logger.info("delete() Call : pno = " + helpNo);
		return helpDao.delete(helpNo);
	}

	// 질문 전체 읽기
	@Override
	public List<HelpVO> readAll(PageCriteria criteria) {
		logger.info("readAll() Call");
		return helpDao.readAll(criteria);
	}

	// 질문 전체 불러오기
	@Override
	public List<HelpVO> selectAll(PageCriteria criteria) {
		logger.info("select() Call");
		return helpDao.selectAll(criteria);
	}
	
	// 질문 총 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getTotalNumsOfRecords() Call");
		return helpDao.getTotalNumsOfRecords(criteria);
	}


	

}
