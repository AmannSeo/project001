package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.HelpVO;
import edu.spring.p01.pageutil.PageCriteria;

@Repository
public class HelpDAOImple implements HelpDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(HelpDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.HelpMapper";
	
	@Autowired
	private SqlSession helpSqlSession;

	// 질문 작성
	@Override
	public int insert(HelpVO help) {
		logger.info("Help_insert() Call");
		logger.info("insert info : " + help.toString());
		return helpSqlSession.insert(NAMESPACE + ".help_insert", help);
	}

	// 전체 질문 읽기
	@Override
	public List<HelpVO> readAll(PageCriteria criteria) {
		logger.info("helpGetList() Call - criteria" + criteria);
		return helpSqlSession.selectList(NAMESPACE + ".help_read_all");
	}
	
	// 전체 질문 불러오기
	@Override
	public List<HelpVO> selectAll(PageCriteria criteria) {
		logger.info("read() call + PageCriteria = " + criteria);
		return helpSqlSession.selectList(NAMESPACE + ".help_select_all", criteria);
	}

	// 전체 질문 총 개수
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getTotalNumsOfRecords() Call");
		logger.info("criteria : " + criteria.getKeyword());
		return helpSqlSession.selectOne(NAMESPACE + ".help_total_count");
	}

	// 질문 보기
	@Override
	public HelpVO read(int helpNo) {
		logger.info("read() Call");
		logger.info("read helpNo" + helpNo);
		return helpSqlSession.selectOne(NAMESPACE + ".help_select_no", helpNo);
	}

	// 질문 수정
	@Override
	public int update(HelpVO help) {
		logger.info("update() Call - help : " + help.toString());
		return helpSqlSession.update(NAMESPACE + ".help_update", help);
	}

	// 질문 삭제
	@Override
	public int delete(int helpNo) {
		logger.info("delete() Call - helpNo : " + helpNo);
		return helpSqlSession.delete(NAMESPACE + ".help_delete", helpNo);
	}


	


}


















