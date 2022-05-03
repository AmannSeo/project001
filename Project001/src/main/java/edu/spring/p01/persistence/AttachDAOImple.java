package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.AttachImageVO;

@Repository
public class AttachDAOImple implements AttachDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(AttachDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.AttachMapper";
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<AttachImageVO> getAttachList(int productNo) {
		logger.info("getAttachList() Call......................");
		return sqlSession.selectList(NAMESPACE + ".getAttachList", productNo);
	}

}
