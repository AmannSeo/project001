package edu.spring.p01.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.ProductDAO;
import edu.spring.p01.persistence.ProductDAOImple;

@Service
public class ProductServiceImple implements ProductService{
	private static final Logger logger =
			LoggerFactory.getLogger(ProductServiceImple.class);
	
	@Autowired
	private ProductDAO dao;

	// 상품 검색(상품명)
	@Override
	public List<ProductVO> getProductList(PageCriteria criteria) {
		logger.info("getProductList() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		String type = criteria.getType();
		String[] typeArr = type.split("");
		
		return dao.getProductList(criteria);
	}
	
	// 상품 총 갯수
	@Override
	public int productGetTotal(PageCriteria criteria) {
		logger.info("productGetTotal() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return dao.productGetTotal(criteria);
	}

	// 카테고리별 상품 리스트
	@Override
	public List<ProductVO> list(String cateCode) {
		logger.info("list() Call");
		return dao.list(cateCode);
	}

	
}












