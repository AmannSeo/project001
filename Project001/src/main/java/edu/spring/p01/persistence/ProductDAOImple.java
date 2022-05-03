package edu.spring.p01.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	// 상품 등록
	@Override
	public int insert(ProductVO product) {
		logger.info("insert() Call");
		logger.info("insert info : " + product.toString());
		return sqlSession.insert(NAMESPACE + ".insert", product);
	}

	// 상품 전체 읽기
	// 상품 전체 읽기만 함
	@Override
	public List<ProductVO> readAll(PageCriteria criteria) {
		logger.info("select() Call");
		return sqlSession.selectList(NAMESPACE + ".product_read_all");
	}
	// 상품 총 수량
	@Override
	public int getTotalNumsOfRecords(PageCriteria criteria) {
		logger.info("getToalNumOfRecords() Call");
		logger.info("criteria" + criteria.getKeyword());
		return sqlSession.selectOne(NAMESPACE + ".product_total_count");
	}
	
	// 상품 리스트 페이징
	// 키워드를 검색할 수 있음
	@Override
	public List<ProductVO> selectAll(PageCriteria criteria) {
		logger.info("read() call + PageCriteria = " + criteria);
		return sqlSession.selectList(NAMESPACE + ".product_select_all", criteria);
	}

	// 상품 상세 정보
	@Override
	public ProductVO read(int productNo) {
		logger.info("select() Call : productNo = " + productNo);
		return sqlSession.selectOne(NAMESPACE + ".select_by_productNo", productNo);
	}

	// 상품 정보 수정
	@Override
	public int update(ProductVO product) {
		logger.info("update() Call + product = " + product.toString());
		return sqlSession.update(NAMESPACE + ".update", product);
	}

	// 상품 정보 삭제
	@Override
	public int delete(int productNo) {
		logger.info("delete() Call + pno = " + productNo);
		return sqlSession.delete(NAMESPACE + ".delete", productNo);
	}
	
	


	// 상품명 선택
//	@Override
//	public List<ProductVO> select(String productName) {
//		logger.info("select() Call + productName = " + productName);
//		productName = "%" + productName + "%";
//		return sqlSession.selectList(NAMESPACE + ".select_by_product_name", productName);
//	}
	
	// 상품 키워드 검색
	@Override
	public List<ProductVO> selectByTitleOrContent(String keyword) {
		logger.info("select() Call + keyword = " + keyword);
		keyword = "%" + keyword + "%";
		return sqlSession.selectList(NAMESPACE + ".select_by_keyword", keyword);
	}


}
