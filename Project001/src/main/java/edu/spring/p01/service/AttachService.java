package edu.spring.p01.service;

import java.util.List;

import edu.spring.p01.domain.AttachImageVO;

public interface AttachService {
	
	/* 이미지 데이터 변환 */
	public List<AttachImageVO> getAttachList(int productNo);

}
