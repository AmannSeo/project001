package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.spring.p01.domain.CateVO;
import edu.spring.p01.domain.ProductVO;
import edu.spring.p01.pageutil.PageCriteria;

// DAO, DAOImple 순서 맞게. 그리고 service 와 순서 같고 메소드 이름 동일하게!!
@Repository
public class ProductDAOImple implements ProductDAO{
	private static final Logger logger =
			LoggerFactory.getLogger(ProductDAOImple.class);
	private static final String NAMESPACE =
			"edu.spring.p01.ProductMapper";
	
	@Autowired
	public SqlSession sqlSession;

	// 상품 검색
	@Override
	public List<ProductVO> getProductList(PageCriteria criteria) {
		logger.info("getProductList() Call");
		return sqlSession.selectList(NAMESPACE + ".getProductList", criteria);
	}

	// 상품 총 갯수
	@Override
	public int productGetTotal(PageCriteria criteria) {
		logger.info("productGetTotal() Call");
		return sqlSession.selectOne(NAMESPACE + ".productGetTotal", criteria);
	}

	// 카테고리별 상품 리스트
	@Override
	public List<ProductVO> list(String cateCode) {
		logger.info("list() Call");
		return sqlSession.selectList(NAMESPACE + ".cateProList", cateCode);
	}

	@Override
	public ProductVO getProductInfo(int productNo) {
		logger.info("getProdcutInfo() Call");
		return sqlSession.selectOne(NAMESPACE + ".getProductInfo", productNo);
	}

	// FINE FRAGRANCES
	@Override
	public List<ProductVO> getCateCode1_1() {
		logger.info("FACE FRAGRANCES() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode1_1");
	}
	public List<ProductVO> getCateCode1_2() {
		logger.info("FACE FRAGRANCES() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode1_2");
	}
	public List<ProductVO> getCateCode1_3() {
		logger.info("FACE FRAGRANCES() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode1_3");
	}

	// HOME CREATIONS
	@Override
	public List<ProductVO> getCateCode2_1() {
		logger.info("HOME CREATIONS() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode2_1");
	}
	public List<ProductVO> getCateCode2_2() {
		logger.info("HOME CREATIONS() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode2_2");
	}
	public List<ProductVO> getCateCode2_3() {
		logger.info("HOME CREATIONS() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode2_3");
	}

	// BODY-HAIR-FACE
	@Override
	public List<ProductVO> getCateCode3_1() {
		logger.info("BODY-HAIR-FACE() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode3_1");
	}
	public List<ProductVO> getCateCode3_2() {
		logger.info("BODY-HAIR-FACE() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode3_2");
	}
	public List<ProductVO> getCateCode3_3() {
		logger.info("BODY-HAIR-FACE() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode3_3");
	}
	public List<ProductVO> getCateCode3_4() {
		logger.info("BODY-HAIR-FACE() Call");
		return sqlSession.selectList(NAMESPACE + ".getCateCode3_4");
	}

	
	



}
