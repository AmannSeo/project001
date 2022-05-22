package edu.spring.p01.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.spring.p01.domain.AttachImageVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;
import edu.spring.p01.persistence.AdminDAO;
import edu.spring.p01.persistence.AttachDAO;
import edu.spring.p01.persistence.ProductDAO;
import edu.spring.p01.persistence.ProductDAOImple;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImple implements ProductService{
	private static final Logger logger =
			LoggerFactory.getLogger(ProductServiceImple.class);
	
	@Autowired
	private ProductDAO dao;
	
	@Autowired
	private AttachDAO attachDao;
	
	@Autowired
	private AdminDAO adminDao;

	// 상품 검색(상품명)
	@Override
	public List<ProductVO> getProductList(PageCriteria criteria) {
		logger.info("getProductList() Call >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		List<ProductVO> list = dao.getProductList(criteria);
		
		list.forEach(product -> {
			int productNo = product.getProductNo();
			
			List<AttachImageVO> imageList = attachDao.getAttachList(productNo);
			product.setImageList(imageList);
		});
		
		return list;
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

	// FINE FRAGRANCES
	@Override
	public List<ProductVO> getCateCode1_1() {
		logger.info("FACE FRAGRANCES() Call");
		return dao.getCateCode1_1();
	}
	@Override
	public List<ProductVO> getCateCode1_2() {
		logger.info("FACE FRAGRANCES() Call");
		return dao.getCateCode1_2();
	}
	@Override
	public List<ProductVO> getCateCode1_3() {
		logger.info("FACE FRAGRANCES() Call");
		return dao.getCateCode1_3();
	}

	// HOME CREATIONS
	@Override
	public List<ProductVO> getCateCode2_1() {
		logger.info("HOME CREATIONS() Call");
		return dao.getCateCode2_1();
	}
	@Override
	public List<ProductVO> getCateCode2_2() {
		logger.info("HOME CREATIONS() Call");
		return dao.getCateCode2_2();
	}
	@Override
	public List<ProductVO> getCateCode2_3() {
		logger.info("HOME CREATIONS() Call");
		return dao.getCateCode2_3();
	}

	// BODY-HAIR-FACE
	@Override
	public List<ProductVO> getCateCode3_1() {
		logger.info("BODY-HAIR-FACE() Call");
		return dao.getCateCode3_1();
	}
	@Override
	public List<ProductVO> getCateCode3_2() {
		logger.info("BODY-HAIR-FACE() Call");
		return dao.getCateCode3_2();
	}
	@Override
	public List<ProductVO> getCateCode3_3() {
		logger.info("BODY-HAIR-FACE() Call");
		return dao.getCateCode3_3();
	}
	@Override
	public List<ProductVO> getCateCode3_4() {
		logger.info("BODY-HAIR-FACE() Call");
		return dao.getCateCode3_4();
	}

	/* 상품 정보 */
	@Override
	public ProductVO getProductInfo(int productNo) {
		
		ProductVO productInfo = dao.getProductInfo(productNo);
		productInfo.setImageList(adminDao.getAttchInfo(productNo));
		
		return productInfo;
	}

	
}












