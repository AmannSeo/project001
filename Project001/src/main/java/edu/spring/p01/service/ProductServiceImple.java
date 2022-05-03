package edu.spring.p01.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.ProductDAO;

@Service
public class ProductServiceImple implements ProductService{
	private static final Logger logger =
			LoggerFactory.getLogger(ProductServiceImple.class);
	
	@Autowired
	private ProductDAO productDao;

	// 상품 등록
	@Override
	public int insert(ProductVO product) throws Exception {
		logger.info("insert product : " + product.toString());
		return productDao.insert(product);
	}

	// 상품 전체 읽기
	@Override
	public List<ProductVO> readAll(PageCriteria criteria) {
		logger.info("selectAll() Call");
		return productDao.selectAll(criteria);
	}

	// 상품 전체 불러오기
	@Override
	public List<ProductVO> selectAll(PageCriteria criteria) throws Exception{
		logger.info("getList() Call : PageCriteria = " + criteria);
		// (mapper에 쿼리가 없을 경우 2가지의 상황을 나눠서 실행시켜줘야함)
		// 모든 건 criteria에 있기 때문에 객체지향을 써줘서 if문을 만들어줘서
		// 실행시켜야 함.
		// 키워드가 있으면 키워드로 검색이 되는 메소드 입력 
		
		
		// 키워드가 없으면 원래 있는 목록만 불러오는 메소드 입력
		
		return productDao.selectAll(criteria);
	}

	// 상품 총 수량
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getTotalNumsOfRecords() Call");
		return productDao.getTotalNumsOfRecords(criteria);
	}

	
	// 상품 목록에서 상품명 선택
//	@Override
//	public List<ProductVO> select(String productName) {
//		logger.info("select() Call");
//		return productDao.select(productName);
//	}

	// 상품 상세 페이지
	@Override
	public ProductVO read(int productNo) {
		logger.info("read() Call : productNo = " + productNo);
		return productDao.read(productNo);
	}

	// 상품 수정
	@Override
	public int update(ProductVO product) {
		logger.info("update() Call : product = " + product.toString());
		return productDao.update(product);
	}

	// 상품 삭제
	@Override
	public int delete(int productNo) {
		logger.info("delete() Call : pno = " + productNo);
		return productDao.delete(productNo);
	}


}












