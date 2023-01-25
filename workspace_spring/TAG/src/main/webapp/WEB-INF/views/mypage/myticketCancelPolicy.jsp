<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<script src="https://kit.fontawesome.com/698fcd5feb.js" crossorigin="anonymous"></script>

<!-- 본문 시작 -->
<style>
	a {
		font-family: 'Noto Sans KR', sans-serif;
		color: black;
		font-size: 13px; }
		
	.clickInfo {
		text-align: center;
		margin: 10px;
		color: #000000;
		animation-name: blink;
		animation-duration: 3s;
		animation-iteration-count: infinite;
	}
	@keyframes blink {
		50% {opacity: 0;}
	}
	
	.clearfix::after {
	  content: "";
	  display: block;
	  clear: both;
	}
	
	
	
	.policytb {
		border-collapse:collapse;
		border: 1px solid black;
		width: 80%;
		margin-top:10px;
		margin-bottom:10px;
	}
	
	.policytb th,td {
	    border: 1px solid black;
	    line-height:25px;
	    padding:6px;
	}
	
	.policytb th{
		background:lightgrey;
	}

	.cancelPolicy ul{
		padding-left:10px;
		margin-left:10px;
		--list-style: none;
	}
	
	.btnDIV {
		text-align:center;
		padding-top:100px;
		padding-bottom:100px;
	}
	
	.clickInfo {
		color:#33FF33; 
		font-size:36px;
		font-weight: bold;
		margin: 10px;
		animation-name: blink;
		animation-duration: 3s;
		animation-iteration-count: infinite;
	}
	@keyframes blink {
		50% {opacity: 30%;}
	}
	
	.cnlBtn {
	  width: 100px;
	  padding-top: 12px;
	  padding-bottom: 12px;
	  margin: 0 10px 0 10px;
	  border: none;
	  background-color: black;
	  color: white;
	  opacity: 0.3;
	}
	
	.bckBtn {
	  width: 100px;
	  padding-top: 12px;
	  padding-bottom: 12px;
	  margin: 0 10px 0 10px;
	  border: none;
	  background-color: white;
	  color: black;
	  border: 1px solid black;
	}
	
	
	.side_liT {
	font-family: 'Noto Sans KR', sans-serif;
    font-weight: bold;
    font-size: 15px;
    padding-bottom: 10px;
}

</style>






<div class="clearfix">
<div class="title">
	<h3 style="text-align: center;">취소/환불 정책 안내</h3>
</div>

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

















<div class="rightcontent" style="float:right; width:80%;">
	<div class="cancelPolicy">
		<span style="border-bottom:1px solid black; font-size:20px;"><i class="fa-solid fa-pen"></i> 예매 취소 안내</span>
		<br><br>
		<b>취소 마감 시간</b>
		<p>관람일 전일 (평일/주말/공휴일 오후 5시, 토요일 오전 11시)<br>
			※ 관람일 전일 오후 5시 이후(토요일은 오전 11시) 또는 관람일 당일 예매하신 건에 대해서는 예매후 취소/변경/환불 불가<br>
			※ 토요일이 공휴일인 경우 토요일 오전 11시 기준으로 적용됩니다.<br>
		</p>
		
		<b>취소 수수료 안내</b>
		<table class="policytb">
		<tr>
			<th>구분</th>
			<th>취소수수료</th>
			<th>비고</th>
		</tr>
		<tr>
			<td>예매 후 7일 이내</td>
			<td>없음</td>
			<td rowspan="5">
				* 예매당일에 취소하는 경우 이외에는 <br>
				예매수수료가 환불되지 않음<br>
				* 예매 후 7일 이내라도 취소시점이 공연일로부터<br>
				10일 이내라면 그에 해당하는 취소수수료 부과
			</td>
		</tr>
		<tr>
			<td>예매 후 8일 ~ 관람일 10일 전</td>
			<td>공연권 : 4,000원</td>
		</tr>
		<tr>
			<td>관람일 9일 전 ~ 7일 전</td>
			<td>티켓금액의 10%</td>
		</tr>
		<tr>
			<td>관람일 6일 전 ~ 3일 전</td>
			<td>티켓금액의 20%</td>
		</tr>
		<tr>
			<td>관람일 2일 전 ~ 1일 전</td>
			<td>티켓금액의 30%</td>
		</tr>
		</table>

		<ul>
			<li>취소시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</li>
			<li>
				웹취소가능시간 이후에는 취소가 불가합니다.<br>
				단, 관람일 당일 취소가능한 상품의 경우 관람일 당일 취소시에는 티켓금액의 90%가 과금됩니다.
			</li>
			<li>상품의 특성에 따라서, 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매시 취소수수료 확인)</li>
		</ul>
		
		<br><hr><br><br>
		
		
		<span style="border-bottom:1px solid black; font-size:20px;"><i class="fa-solid fa-pen"></i> 배송방법별 취소 안내</span>
		<br><br>
		<b>현장수령으로 예매한 경우</b>
		<ul>
			<li>인터넷 예매 고객 : TAG 티켓 마이페이지 ‘예매 확인 / 예매 취소’ 메뉴에서 직접 취소 가능</li>
			<li>전화 예매 고객 : TAG 티켓 마이페이지 ‘예매 확인 / 예매 취소’ 메뉴에서 직접 취소 가능 또는 고객센터(+84 02.6255.8002) 연결을 통해 취소 가능</li>
		</ul>
		<b>배송으로 예매한 경우</b>
		<p>
			이미 배송 받은 티켓은 인터넷 및 전화로 취소할 수 없습니다.<br>
			반드시 취소마감 시간 이전에 티켓이 TAG 티켓 고객센터로 반송되어야 취소가능하며, 취소수수료는 도착일자 기준으로 부과됩니다.<br>
			<br>
			※ 단, 배송료는 환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해주시기 바랍니다.
		</p>
		
	</div><!-- cancelPolicy end -->
</div><!-- rightcontent end -->


</div><!-- clearfix end -->

	<div class="btnDIV">
		<input type="checkbox" id="check" >
		<label for="check">위 정책에 동의하며 환불을 진행합니다.</label><br>
		
		<button class="cnlBtn" disabled onclick="location.href='/mypage/myticket/delete/${tck_num}'">결제취소</button>
		<button class="bckBtn" onclick="location.href='javascript:history.back();'">돌아가기</button>
	</div><!-- 결제취소 / 목록으로 -->
<!-- 본문 끝 -->



<script>


$("#check").on("click", function () {
	var checked = $('#check').is(':checked');
	if(checked){ //체크하면
		$(".cnlBtn").attr("disabled", false);
		$(".cnlBtn").css("opacity", "1");
	}else{ //체크해제하면
		$(".cnlBtn").attr("disabled", true);
		$(".cnlBtn").css("opacity", "0.3");
	}//if end
	
});

</script>






<%@ include file="../footer.jsp" %>