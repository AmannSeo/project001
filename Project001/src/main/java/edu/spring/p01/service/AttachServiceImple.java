package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.persistence.AttachDAO;

@Service
public class AttachServiceImple implements AttachService{
	private static final Logger logger =
			LoggerFactory.getLogger(AttachServiceImple.class);
	
	@Autowired
	private AttachDAO attachDao;

	/* 이미지 데이터 변환 */
	@Override
	public List<AttachImageVO> getAttachList(int productNo) {

		logger.info("getAttachList() Call .....................");
		return attachDao.getAttachList(productNo);
	}

}
