package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.CateVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.AdminDAO;
import edu.spring.p01.persistence.ProductDAO;

@Service
public class AdminServiceImple implements AdminService{
	private static final Logger logger =
			LoggerFactory.getLogger(AdminServiceImple.class);
	
	@Autowired
	private AdminDAO adminDao;

	// 상품 등록
	@Transactional
	@Override
	public void insert(ProductVO product) {
		
		logger.info("insert() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("product : " + product.toString());
		logger.info("=======================================================");
		
		adminDao.insert(product);
		
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		
		product.getImageList().forEach(attach ->{
			attach.setProductNo(product.getProductNo());
			adminDao.imageEnroll(attach);
		});
	}

	// 상품 전체 읽기
	@Override
	public List<ProductVO> readAll(PageCriteria criteria) {
		
		logger.info("readAll() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("criteria : " + criteria);
		logger.info("=======================================================");
		
		return adminDao.selectAll(criteria);
	}

	// 상품 리스트 불러오기
	@Override
	public List<ProductVO> selectAll(PageCriteria criteria) throws Exception{
		
		logger.info("SelectAll() Call >>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("SelectAll PageCriteria : " + criteria);
		logger.info("=======================================================");
		
		// (mapper에 쿼리가 없을 경우 2가지의 상황을 나눠서 실행시켜줘야함)
		// 모든 건 criteria에 있기 때문에 객체지향을 써줘서 if문을 만들어줘서
		// 실행시켜야 함.
		// 키워드가 있으면 키워드로 검색이 되는 메소드 입력 
		
		
		// 키워드가 없으면 원래 있는 목록만 불러오는 메소드 입력
		
		return adminDao.selectAll(criteria);
	}

	// 상품 총 수량
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		
		logger.info("getTotalNumsOfRecords() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("Total Nums : " + criteria);
		logger.info("=======================================================");
		
		return adminDao.getTotalNumsOfRecords(criteria);
	}

	
	
	// 상품 상세 페이지
	@Override
	public ProductVO read(int productNo) {
		logger.info("productRead() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("productNo : " + productNo);
		logger.info("=========================================================");
		
		return adminDao.read(productNo);
	}

	// 상품 수정
	@Transactional
	@Override
	public int update(ProductVO product) {
		logger.info("productUpdate() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("product : " + product.toString());
		logger.info("=======================================================");
//		return adminDao.update(product);
		
		int result = adminDao.update(product);
		
		if(result == 1 && product.getImageList() != null && product.getImageList().size() > 0) {
			adminDao.deleteImageAll(product.getProductNo());
			
			product.getImageList().forEach(attach -> {
				attach.setProductNo(product.getProductNo());
				adminDao.imageEnroll(attach);
			});
		}
		return result;
		
	}

	// 상품 삭제
	@Override
	@Transactional
	public int delete(int productNo) {
		
		logger.info("productDelete() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("productNo : " + productNo);
		logger.info("=======================================================");
		
		adminDao.deleteImageAll(productNo);
		
		return adminDao.delete(productNo);
	}

	// 카테고리 리스트
	@Override
	public List<CateVO> cateList() {
		logger.info("cateList() Call >>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("=======================================================");
		return adminDao.cateList();
	}

	// 지정 상품 이미지 정보 얻기
	@Override
	public List<AttachImageVO> getAttachInfo(int productNo) {
		logger.info("getAttachInfo() Call..............................");
		return adminDao.getAttchInfo(productNo);
	};

}












