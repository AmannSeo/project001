package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.NoticeVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.NoticeDAO;

@Service
public class NoticeServiceImple implements NoticeService{
	private static final Logger logger =
			LoggerFactory.getLogger(NoticeServiceImple.class);
	
	@Autowired
	private NoticeDAO noticeDao;

	// 질문 등록
	@Override
	public int insert(NoticeVO notice) {
		logger.info("(notice)insert() Call");
		logger.info("NoticeVO : " + notice.toString());
		return noticeDao.insert(notice);
	}

	// 질문 읽기
	@Override
	public NoticeVO read(int noticeNo) {
		logger.info("read() Call : noticeNo = " + noticeNo);
		return noticeDao.read(noticeNo);
	}

	// 질문 수정
	@Override
	public int update(NoticeVO notice) {
		logger.info("update() Call : notice = " + notice.toString());
		return noticeDao.update(notice);
	}

	// 질문 삭제
	@Override
	public int delete(int noticeNo) {
		logger.info("delete() Call : NoticeNo = " + noticeNo);
		return noticeDao.delete(noticeNo);
	}

	// 질문 전체 읽기
	@Override
	public List<NoticeVO> readAll(PageCriteria criteria) {
		logger.info("readAll() Call");
		return noticeDao.readAll(criteria);
	}

	// 질문 전체 불러오기
	@Override
	public List<NoticeVO> selectAll(PageCriteria criteria) {
		logger.info("select() Call");
		return noticeDao.selectAll(criteria);
	}
	
	// 질문 총 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getTotalNumsOfRecords() Call");
		return noticeDao.getTotalNumsOfRecords(criteria);
	}


	

}
