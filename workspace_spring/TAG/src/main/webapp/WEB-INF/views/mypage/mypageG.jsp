<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css); 

   * {
      font-family: 'Noto Sans KR', sans-serif; !important;
   }

   .leftcontent {
      float: left;
      width: 10%;
      /*margin-left:0px;
      border: 1px solid black;*/
      margin-right: 10%;
   }
   
   .rightcontent {
      float: right;
      width: 80%;
      /*margin-left: 100px;
      border: 1px solid black;*/
   }
   
   /*
   .container1 {
      width: 1400px;
      width: 100%;
      height: 100%;
      flex: 1 1 1px;
   }
   */
   
   .moS1 {
      width: 200px;
      height: 40px;
      position: relative;
      left: 175px;
      bottom: 145px;
      right: 50px;
      padding: 10px;
      text-align: center;
      display: none;
   }

   .moS2 {
      width: 200px;
      height: 40px;
      position: relative;
      left: 175px;
      bottom: 312px;
      right: 50px;
      padding: 10px;
      text-align: center;
      display: none;
   }
   
   .site-footer { padding-bottom: 0px;}
   
   
   
</style>


<script>
   function modalS1(){
      //alert("성공");
      $('.moS1').css("display", "inline-block");
   }//modalS() end
   
   function modalOut1(){
      $('.moS1').css("display", "none");
   }//modalOut() end
   
   function modalS2(){
      $('.moS2').css("display", "inline-block");
   }//modalS() end
   
   function modalOut2(){
      $('.moS2').css("display", "none");
   }//modalOut() end
</script>

<!-- 본문 시작 -->

<br>
   <h1 class="saem_title fontJ"><a href="/mypage/mypageG" style="color: black;" class="saem_title fontJ"> My Page </a></h1>
<br>

<div class="container1">
   <div class="leftcontent">
      <div class="stickyP" style="height: 5%">
         <p class="fontJ" style="font-size: 20px; font-weight: 500;">
            ${s_m_id}&nbsp;님 <!-- 세션 아이디 -->
         </p>
      <br>
      <div class="stickyC" style="position: sticky; top: 100px; padding-bottom: 100px;">
         <ul style="font-size:13px; list-style-type: none; padding-left:0px;">
            <li class="side_liT">My ticket
               <li>&nbsp;<a href="/mypage/myticket" style="color:black; font-size: 12px;">- 예매 확인 / 취소</a></li>
            </li>
            <br>
            <li class="side_liT">My product
               <li>&nbsp;<a href="/mypage/myproduct" style="color:black; font-size: 12px;">- 상품 구매내역</a></li>
               <li>&nbsp;<a href="/mypage/myqna" style="color:black; font-size: 12px;">- 나의 문의내역</a></li>
            </li>
            <br>
            <li class="side_liT">My like
               <li>&nbsp;<a href="/mypage/mylike" style="color:black; font-size: 12px;">- 관심 공연 / 관심 상품</a></li>
            </li>
            <br>
            <li class="side_liT">My coupon
               <li>&nbsp;<a href="/couponDetail/detail" style="color:black; font-size: 12px;">- 보유 쿠폰</a></li>
            </li>
            <br>
            <li class="side_liT">My point
               <li>&nbsp;<a href="/pointDetail/detail" style="color:black; font-size: 12px;">- 보유 포인트</a></li>
            </li>
            <br>
            <li style="font-size: 12px; font-weight: 400;"><a href="/mypage/memberupdateG" style="color: #bcbcbc;">회원 정보 수정</a></li>
         </ul>
      </div><!-- stickyC end -->
      </div><!-- stickyP end -->
   </div><!-- leftcontent end -->
   
   
   <div class="rightcontent" id="rightcontent">
      <div style="background-color:black; width: 100%; height: 150px; padding: 20px 20px 20px 20px; margin-top: 10px;">
         
         <div style="border-right:1px solid #d5d5d5; width: 49.5%; height: 100%; display: inline-block;">
            <p style="margin-top: 0; font-size:13px; font-weight: 300; color:#d5d5d5;">보유 쿠폰</p>
            <br>
            <p style="font-size:30px; text-align: right; padding-right: 20px; font-weight: 600; margin-top: 15px; color:white;">
               <a href="/couponDetail/detail">${couponCnt}장</a>
            </p>
         </div><!-- 보유 쿠폰 박스 end -->
         
         <div style="width: 49.5%; height: 100%; display: inline-block; padding-left: 10px;" >
            <p style="margin-top: 0; font-size:13px; font-weight: 300; color:#d5d5d5; ">보유 포인트</p>
            <br> 
            <p style="font-size:30px; text-align: right; padding-right: 20px; font-weight: 600; margin-top: 15px; color:white;">
               <a href="/pointDetail/detail">${ptTotal}P</a>   
            </p>
         </div><!-- 보유 포인트 박스 end -->
         
      </div><!-- 쿠폰/포인트 상태 박스 end -->
      <br>
      <br>
   
      <table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;">         
         <tr style="border-bottom:3px solid black; font-size: 16px;">
            <td colspan='3' style="padding-bottom: 8px; font-weight: 600; /*border: 1px solid red;*/ text-align: left;">최근 티켓 예매내역 <a onmouseover="modalS2()" onmouseout="modalOut2()">ⓘ</a></td>
         </tr>
         
         <c:if test="${tckCount == 0}">
            <tr>
               <td colspan="9" style="padding-top: 20px;">
                  최근 티켓 예매내역이 없습니다.
               </td>
            </tr>
         </c:if>
         
         <c:if test="${tckCount != 0}">
            <tr style=" border-bottom:0.1px solid black; font-size: 12px;">
               <td style="padding:10px 10px 10px 10px;">예매일</td>
               <td style="padding:10px 10px 10px 10px;">예매번호</td>
               <td colspan="4" style="padding:0 10px 5px 10px; width: 550px;">공연명</td>
               <td style="padding:10px 10px 10px 10px;">관람일시</td>
               <td style="padding:10px 10px 10px 10px;">매수</td>
               <td style="padding:10px 10px 10px 10px;">예매상태</td>
            </tr>
            
            <c:forEach var="row" items="${list_t}" varStatus="vs">
            <tr>
               <td style="border-bottom:1px solid #ededed;">
                  <fmt:parseDate value="${row.orderDate}" var="datefmt" pattern="yyyyMMdd"/>
                  <fmt:formatDate value="${datefmt}" pattern="yyyy.MM.dd"/>
               </td>
               <td style="border-bottom:1px solid #ededed;">
                  <a href="/mypage/myticket/${row.tck_num}">${row.tck_num}</a>
               </td>
               <td colspan="4" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all;">${row.title}</td>
               <td style="border-bottom:1px solid #ededed;">${row.date}</td>
               <td style="border-bottom:1px solid #ededed;">${row.cnt}</td>
               <td style="border-bottom:1px solid #ededed;">${row.stus}</td>
            </tr>
            </c:forEach>
         </c:if>
      </table><!-- 최근 티켓 테이블 end -->
      <br>
      <br>
      
      <table style="width:100%; text-align:center; vertical-align: middle; table-layout: fixed; font-size: 14px;">
         <tr style=" border-bottom:3px solid black; font-size: 16px;">
             <td colspan='1' style="padding-bottom: 8px; font-weight: 600; /*border: 1px solid red;*/ text-align: left;">최근 상품 구매내역 <a onmouseover="modalS1()" onmouseout="modalOut1()">ⓘ</a></td>
         </tr>
         
         <c:if test="${orderCount == 0}">
            <tr>
               <td>최근 상품 구매내역이 없습니다.</td>
            </tr>
         </c:if>
         
         <c:if test="${orderCount != 0}">
         <table class="table table-hover">
            <tr style=" border-bottom:0.1px solid black; font-size: 12px; text-align: center;">
               <td style="padding:10px 10px 10px 10px;">구매일</td>
               <td style="padding:10px 10px 10px 10px;">주문번호</td>
               <td colspan="5" style="padding:0 10px 5px 10px; width: 550px;">상품</td>
               <!-- <td style="padding:10px 10px 10px 10px;">수량</td> -->
               <td style="padding:10px 10px 10px 10px;">배송상태</td>
            </tr>
            
            <c:forEach var="row" items="${list_p}" varStatus="vs">
            <tr style="font-size: 14px;">
               <td style="border-bottom:1px solid #ededed; text-align: center;">
                  <fmt:parseDate value="${row.orderDate}" var="datefmt" pattern="yyyyMMdd"/>
                  <fmt:formatDate value="${datefmt}" pattern="yyyy.MM.dd"/>
               </td>
               <td style="border-bottom:1px solid #ededed; text-align: center;">
                  <a href="pDetail/${row.order_num}">${row.order_num}</a>
               </td>
               <td colspan="5" style="border-bottom:1px solid #ededed; text-align: left; padding:5px 0px 5px 30px; word-break:break-all; ">
                  ${row.pro_name} 포함 ${row.detail_cnt}개
               </td>
               <!-- <td style="border-bottom:1px solid #ededed; text-align: center;">${row.detail_cnt}개</td> -->
               <td style="border-bottom:1px solid #ededed; text-align: center;">${row.stus}</td>
            </tr>
            </c:forEach>
         </table>
         </c:if>
      </table><!-- 최근 상품 테이블 end -->
      
       <div class="moS1">최근 2건만 표시됩니다.</div>
       <div class="moS2">최근 2건만 표시됩니다.</div>
      
   </div><!-- rightcontent end -->
</div><!-- container1 end -->

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>