package kr.co.itwill.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.QnA.QnADTO;
import kr.co.itwill.concert.ConcertDTO;
import kr.co.itwill.coupon.CouponDTO;
import kr.co.itwill.memberGeneral.MemberGeneralDTO;
import kr.co.itwill.mylike.MylikeDTO;
import kr.co.itwill.orderDetail.OrderDetailDTO;
import kr.co.itwill.productOrder.ProdcutOrderDTO;


@Repository
public class ProductDAO {
	
	public ProductDAO() {
		System.out.println("------- ProductDAO() 객체 생성됨 ");
	}//ProductDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
//  ---------------------------------------------------- [상품목록 - 전체]
	public List<Map<String, Object>> list(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("product.list", map);
	}//list() end	

//  ---------------------------------------------------- [상품목록 - 인기순]
	public List<Map<String, Object>> popularAll(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("product.popularAll", map);
	}//list() end
	
//  ---------------------------------------------------- [상품목록 - 좋아요순]
	public List<Map<String, Object>> likeAll(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("product.likeAll", map);
	}//list() end
	

//  ---------------------------------------------------- [상품목록 - 페이징 전체 글개수]	
	public int total() {
		return sqlSession.selectOne("product.total");
	}// list2() end

	
//  ---------------------------------------------------- [상품목록 - 페이징 카테고리별 글개수]	
	public int categoryTotal(String category) {
		return sqlSession.selectOne("product.categoryTotal", category);
	}// categoryTotal() end
	
	
//  ---------------------------------------------------- [상품목록 - 페이징 카테고리별리스트]	
	public List<Map<String, Object>> list2(Integer start, Integer end, String category) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("category", category);
		
		return sqlSession.selectList("product.list2", map);
	}// list2() end
	

//  ---------------------------------------------------- [상품목록 - 페이징 카테고리별리스트]	
	public List<Map<String, Object>> popularCateg(Integer start, Integer end, String category) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("category", category);
		
		return sqlSession.selectList("product.popularCateg", map);
	}// list2() end
	
//  ---------------------------------------------------- [상품목록 - 페이징 카테고리별리스트]	
	public List<Map<String, Object>> likeCateg(Integer start, Integer end, String category) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("category", category);
		
		return sqlSession.selectList("product.likeCateg", map);
	}// list2() end
	
	
	
//  ---------------------------------------------------- [상품목록 - 콘서트 리스트]	
	public List<ConcertDTO> concert() {
		return sqlSession.selectList("product.concert");
	}// concert() end	
	
//  ---------------------------------------------------- [상품목록 - 콘서트 개수]	
	public int concertTotal(String c_no) {
		return sqlSession.selectOne("product.concertTotal", c_no);
	}// categoryTotal() end
	
	
//  ---------------------------------------------------- [상품목록 - 콘서트별 상품 전체 + 페이징]
	public List<Map<String, Object>> concertList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return sqlSession.selectList("product.concertList", map);
	}//concertList() end
	

//  ---------------------------------------------------- [상품목록 - 해당 콘서트 상품만 묶음 + 페이징]
	public List<Map<String, Object>> concertList2(Integer start, Integer end, String c_no) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("c_no", c_no.toString());
		
		return sqlSession.selectList("product.concertList2", map);
	}// concertList2() end
	
	
//  ---------------------------------------------------- [상품목록 - 콘서트 리스트 + 페이징 - 인기순]	
	public List<Map<String, Object>> popularCon(Integer start, Integer end, String c_no) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("c_no", c_no.toString());
		
		return sqlSession.selectList("product.popularCon", map);
	}// list2() end
	
	
//  ---------------------------------------------------- [상품목록 - 콘서트 리스트 + 페이징 - 좋아요순]	
	public List<Map<String, Object>> likeCon(Integer start, Integer end, String c_no) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("start", start.toString());
		map.put("end", end.toString());
		map.put("c_no", c_no.toString());
		
		return sqlSession.selectList("product.likeCon", map);
	}// list2() end

	
	
//  ---------------------------------------------------- [상품목록 - 상품 개수]	
	public int searchcnt(String pro_name) {
		return sqlSession.selectOne("product.searchcnt", "%" + pro_name.toUpperCase() + "%");
	}// categoryTotal() end

	
//  ---------------------------------------------------- [상품검색] 원본
	public List<Map<String, Object>> search(String pro_name) {
		return sqlSession.selectList("product.search", "%" + pro_name.toUpperCase() + "%");
	}//search() end
	

//  ---------------------------------------------------- [상품검색] 페이징
//	public List<Map<String, Object>> search(Integer start, Integer end, String pro_name) {
//		
//		HashMap<String, String> map = new HashMap<>();
//		map.put("start", start.toString());
//		map.put("end", end.toString());
//		map.put("pro_name", "%" + pro_name.toUpperCase().toString() + "%");
//		
//		return sqlSession.selectList("product.search", map);
//	}//search() end	
	
	
	
//  ---------------------------------------------------- [상품목록 - 카테고리 전체]	
	public List<ProductDTO> categoryAll() {
		return sqlSession.selectList("product.categoryAll");
	}//search() end
	
	
	
// ---------------------------------------------------- [공연상세 좋아요 개수 증가]	
	public int likecntInc(ProductDTO pro_no) {
		//System.out.println("DAO 잘 들어옴.");
		return sqlSession.update("product.likecntInc", pro_no);
	}//likecntUpdate() end
	
	
// ---------------------------------------------------- [공연상세 좋아요 개수 감소]	
	public int likecntDec(ProductDTO pro_no) {
		//System.out.println("DAO 잘 들어옴.");
		return sqlSession.update("product.likecntDec", pro_no);
	}//likecntUpdate() end
	
	
	
	
	
	public Map<String, Object> proDetail(int pro_no){
		return sqlSession.selectOne("product.proDetail",pro_no);
	}
	
	public int pro_qnacnt (int pro_no) {
		return sqlSession.selectOne("product.pro_qnacnt",pro_no);
	}
	
	public int qnainsert (QnADTO dto) {
		return sqlSession.insert("product.qnainsert", dto);
	}
	
	public QnADTO qnadetail (int q_no, int passwd) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("q_no", q_no);
		map.put("passwd", passwd);
		
		return sqlSession.selectOne("product.qnadetail",map);
	}
	
	public List<QnADTO> qnalist (int start, int end, int pro_no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", start);
		map.put("end", end);
		map.put("pro_no", pro_no);
		
		return sqlSession.selectList("product.qnalist",map);
	}
	
	public int addcart (int cnt, int pro_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("cnt", cnt);
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.insert("product.addcart",map); 
	}
	
	public int like (int pro_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.insert("product.like",map);
	}//end
	
	public int pro_likecntIns(int pro_no) {
		return sqlSession.update("product.pro_likecntIns",pro_no);
	}
	
	public int unlike (int pro_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.delete("product.unlike",map);
	}//end
	
	public int pro_likecntDel (int pro_no) {
		return sqlSession.update("product.pro_likecntDel",pro_no);
	}
	
	public int likechk (String m_id, int pro_no) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.selectOne("product.likechk", map); 
	}// end
	
	public ProductDTO order_proinfo (int pro_no) {
		return sqlSession.selectOne("product.order_proinfo",pro_no);
	}
	
	public MemberGeneralDTO order_Minfo (String m_id) {
		return sqlSession.selectOne("product.order_Minfo",m_id);
	}
	
	public List<CouponDTO> mem_coupon (int pro_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.selectList("product.mem_coupon",map);
	}//end
	
	public int mem_couponCNT(int pro_no, String m_id) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("pro_no", pro_no);
		map.put("m_id", m_id);
		
		return sqlSession.selectOne("product.mem_couponCNT",map);
	}
	
	public int mem_couponTOTALCNT (String m_id) {
		return sqlSession.selectOne("product.mem_couponTOTALCNT",m_id);
	}
	
	public int productorderIns (Map<String, Object> map) {
		return sqlSession.insert("product.productorderIns", map);
	}
	
	public int orderdetailIns (OrderDetailDTO dto) {
		return sqlSession.insert("product.orderdetailIns", dto);
	}
	
	public int pointminusIns (Map<String, Object> map) {
		return sqlSession.insert("product.pointminusIns",map);
	}
	
	public MemberGeneralDTO holdingpoint (String m_id) {
		return sqlSession.selectOne("product.holdingpoint",m_id);
	}
	
	public int pointplusIns (Map<String, Object> map) {
		return sqlSession.insert("product.pointplusIns",map);
	}
	
	public int mempointUp (Map<String, Object> map) {
		return sqlSession.update("product.mempointUp",map);
	}
	
	public int cpstusUp (int cp_no) {
		return sqlSession.update("product.cpstusUp",cp_no);
	}
	
	
	public List<MylikeDTO> mem_like (String m_id) {
		Map<String, Object> map = new HashMap<>();
		map.put("m_id", m_id);
		
		return sqlSession.selectList("product.mem_like",m_id);
	}
	
	public int qnalistCNT (int pro_no) {
		return sqlSession.selectOne("product.qnalistCNT",pro_no);
	}
	
	
	// ----------------------------------------------[ 최근 주문 1건 가져오기 -다슬]		
	public ProdcutOrderDTO recentOrder (String m_id) {
		return sqlSession.selectOne("product.recentOrder",m_id);
	}//recentOrder end
	
	// ----------------------------------------------[ 최근 주문의 상품 개수 가져오기 -다슬]		
	public List<OrderDetailDTO> recentCnt (String m_id) {
		return sqlSession.selectList("product.recentCnt",m_id);
	}//recentCnt end
	
	// ----------------------------------------------[ 최근 주문의 상품 개수 가져오기 -다슬]		
	public List<ProductDTO> recentProduct (String m_id) {
		return sqlSession.selectList("product.recentProduct",m_id);
	}//recentProduct end
	
	// ----------------------------------------------[ 최근 주문의 상품의 공연정보 가져오기 -다슬]		
	public List<ConcertDTO> recentProductConcert (String m_id) {
		return sqlSession.selectList("product.recentProductConcert",m_id);
	}//recentProductConcert end
	
	public Map<String, Object> cartcntselect(int pro_no, String m_id) {
	      Map<String, Object> map = new HashMap<>();
	      
	      map.put("pro_no", pro_no);
	      map.put("m_id", m_id);
	      
	      return sqlSession.selectOne("product.cartcntselect",map);
	 }
	   
	public Integer updatecart(int pro_no, int cart_no, int cnt, String m_id) {
	      Map<String, Object> map = new HashMap<>();
	      
	      map.put("pro_no", pro_no);
	      map.put("cart_no", cart_no);
	      map.put("cnt", cnt);
	      map.put("m_id", m_id);
	      
	      
	      return sqlSession.update("product.updatecart",map);
	}
	
	
}//class end
