package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.NoticeVO;
import edu.spring.p01.pageutil.PageCriteria;

@Repository
public class NoticeDAOImple implements NoticeDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(NoticeDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.NoticeMapper";
	
	@Autowired
	private SqlSession noticeSqlSession;

	// 질문 작성
	@Override
	public int insert(NoticeVO notice) {
		logger.info("notice_insert() Call");
		logger.info("insert info : " + notice.toString());
		return noticeSqlSession.insert(NAMESPACE + ".notice_insert", notice);
	}

	// 전체 질문 읽기
	@Override
	public List<NoticeVO> readAll(PageCriteria criteria) {
		logger.info("noticeGetList() Call - criteria" + criteria);
		return noticeSqlSession.selectList(NAMESPACE + ".notice_read_all");
	}
	
	// 전체 질문 불러오기
	@Override
	public List<NoticeVO> selectAll(PageCriteria criteria) {
		logger.info("read() call + PageCriteria = " + criteria);
		return noticeSqlSession.selectList(NAMESPACE + ".notice_select_all", criteria);
	}

	// 전체 질문 총 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getTotalNumsOfRecords() Call");
		logger.info("criteria : " + criteria.getKeyword());
		return noticeSqlSession.delete(NAMESPACE + ".notice_total_count");
	}

	// 질문 보기
	@Override
	public NoticeVO read(int noticeNo) {
		logger.info("read() Call");
		logger.info("read noticeNo" + noticeNo);
		return noticeSqlSession.selectOne(NAMESPACE + ".notice_select_no", noticeNo);
	}

	// 질문 수정
	@Override
	public int update(NoticeVO notice) {
		logger.info("update() Call - notice : " + notice.toString());
		return noticeSqlSession.update(NAMESPACE + ".notice_update", notice);
	}

	// 질문 삭제
	@Override
	public int delete(int noticeNo) {
		logger.info("delete() Call - noticeNo : " + noticeNo);
		return noticeSqlSession.delete(NAMESPACE + ".notice_delete", noticeNo);
	}


	


}


















