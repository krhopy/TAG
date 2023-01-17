package kr.co.itwill.concert;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConcertCont {
	
	public ConcertCont() {
		System.out.println("------- ConcertCont() 객체 생성됨 ");
	}// ConcertCont()
	
	@Autowired
	ConcertDAO concertDao;
	
	
//  [콘서트 리스트 - 전체보기] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	@RequestMapping("/concert")
	public ModelAndView concertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/concert/concertList");
        
        int totalRowCount = concertDao.concertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.concertListLatest(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        		
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        mav.addObject("All", "a");
        mav.addObject("orderby", "r");
        
        return mav;
	}// concertList() end
	

//  [콘서트 리스트 - 인기순] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	@RequestMapping("/concert/popularAll")
	public ModelAndView popularAll(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.concertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.popularAll(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        		
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        mav.addObject("orderby", "p");
        
        return mav;
	}// concertList() end
	
	
//  [콘서트 리스트 - 좋아요순] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	
	@RequestMapping("/concert/likeAll")
	public ModelAndView likeAll(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.concertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.likeAll(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        		
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        mav.addObject("orderby", "p");
        mav.addObject("orderby", "l");
        
        return mav;
	}// concertList() end
	
	
	
	
	
	
//  [콘서트 리스트 - 지난공연] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/past")
	public ModelAndView pastConcertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.pastConcertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.pastConcertList(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        //System.out.println(list);
        
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        mav.addObject("past", "past");
        
        return mav;
	}//pastConcertList end
	
	
	
//  [콘서트 리스트 - 예정된 공연] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/scheduled")
	public ModelAndView yejungConcertList(HttpServletRequest req) {
		
        ModelAndView mav = new ModelAndView();
        mav.setViewName("concert/concertList");
        
        int totalRowCount = concertDao.yejungConcertTotal();
        
        
        // 페이징 파트
        int numPerPage = 9; // 한 페이지당 레코드(글) 갯수
        int pagePerBlock = 5; // 페이지 리스트 (블럭당 페이지 수)

        // 현재 페이지 번호 (문자형)
        String pageNum = req.getParameter("pageNum");
        //System.out.println(pageNum);
        
        if (pageNum == null) {
            pageNum = "1";
        } // if end

        int currentPage = Integer.parseInt(pageNum);
        int startRow = (currentPage - 1) * numPerPage + 1;
        int endRow = currentPage * numPerPage;
        double totcnt = (double) totalRowCount / numPerPage;
        int totalPage = (int) Math.ceil(totcnt);
        double d_page = (double) currentPage / pagePerBlock;
        int Pages = (int)Math.ceil(d_page)-1;
        int startPage = Pages * pagePerBlock+1;
        int endPage = startPage + pagePerBlock-1;
        
        List list = null;
        if (totalRowCount > 0) {
        	list = concertDao.yejungConcertList(startRow, endRow);//1, 5, M
        } else {
            list = Collections.emptyList(); // 안 넣어도 상관 없음
        } // if end
        
        //System.out.println(list);
        
        mav.addObject("list", list);
        
 	    mav.addObject("total", totalRowCount);
        mav.addObject("pageNum", currentPage);
        mav.addObject("count", totalRowCount);
        mav.addObject("totalPage", totalPage);
        mav.addObject("startPage", startPage);
        mav.addObject("endPage", endPage);
        
        return mav;
	}//pastConcertList end
	

//  [콘서트 리스트 - 검색] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/searchConcert")
	public ModelAndView search(@RequestParam(defaultValue = "") String title) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("concert/concertList");
		
		mav.addObject("list", concertDao.searchConcert(title));
		mav.addObject("total", concertDao.searchConcertCnt(title));
		
		mav.addObject("title", title);
		
		return mav;
	}//search() end
	
	
	
//  [콘서트 상세] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/{c_no}")
	public ModelAndView concertDetail(@PathVariable String c_no, HttpSession session) {
		//System.out.println("11111111" );
		//System.out.println("earlybirdCheck" + concertDao.earlybirdCheck(c_no));
		
		ModelAndView mav = new ModelAndView();
		
		String m_id = (String) session.getAttribute("s_m_id");
		
		
		mav.setViewName("concert/concertDetail");
		//System.out.println(concertDao.detailConcert(c_no));
		mav.addObject("concert", concertDao.detailConcert(c_no));
		mav.addObject("earlybird", concertDao.earlybirdCheck(c_no));
		mav.addObject("flagnumList", concertDao.getFlagnum(c_no));
		
		mav.addObject("likechk", concertDao.likechk(m_id, c_no));
		
		//System.out.println(concertDao.likechk(m_id, c_no));
		return mav;
	}//concertDetail() end
	
	
	
// [공연 상세 좋아요 증가] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/likecntInc")
	@ResponseBody
	private int likecntInc(@RequestParam int c_no) throws Exception {
		
		
		ConcertDTO concert = new ConcertDTO();
		concert.setC_no(c_no);
		
		//System.out.println("DTO concert 값" + concertDao.likecntUpdate(concert));
		return concertDao.likecntInc(concert);
		
	}//likecntInsert end
	
	
// [공연 상세 좋아요 마이페이지에 insert] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //	
	@RequestMapping("/concert/myLikeInsert")
	@ResponseBody
	private int myLikeInsert(@RequestParam Map<String, String> map) {
		//System.out.println("되는감 ?" + concertDao.myLikeInsert(map));
		
		
		return concertDao.myLikeInsert(map);	
	}//myLikeInsert() end
	
	
// [공연 상세 좋아요 감소] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
	@RequestMapping("/concert/likecntDec")
	@ResponseBody
	private int likecntDec(@RequestParam int c_no) throws Exception {
		
		
		ConcertDTO concert = new ConcertDTO();
		concert.setC_no(c_no);
		
		//System.out.println("DTO concert 값" + concertDao.likecntUpdate(concert));
		return concertDao.likecntDec(concert);
		
	}//likecntInsert end	
	
	
// [공연 상세 좋아요 마이페이지에 Delete] 시작 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //	
	@RequestMapping("/concert/myLikeDelete")
	@ResponseBody
	private int myLikeDelete(@RequestParam Map<String, String> map) {
		//System.out.println("되는감 ?" + concertDao.myLikeDelete(lno));
		
		
		return concertDao.myLikeDelete(map);	
	}//myLikeInsert() end	
	
	
}// class end
