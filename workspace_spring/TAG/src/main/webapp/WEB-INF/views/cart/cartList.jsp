<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700;800;900&family=Mulish:wght@200;300;400;500;600;700;800;900;1000&display=swap" rel="stylesheet">

<style>

/* 전체 가로 너비 */
.container {max-width: 1350px; !important;} 

/* 상품 테이블 전체박스 */
#product_box {
  width: 355px;
  padding: 0 25px 0 25px;
  --padding-right: 50px;
  padding-bottom: 70px;
}


/* 좋아요, 카트 hover 되면 보이게 */
#cart{display: none;}


/* 상품마다 밑에 라인넣기 */
#list_line{
  padding-top: 28px;
  border-bottom: 1px solid black;
}

/* 상품 이름 밑에 여백주기 */
#product_price{margin-top: 3px;}


/* 바디 전체 폰트 설정 */
body {
  font-family: 'Jost', sans-serif;
  letter-spacing: 0.25px;
}

/* 링크 컬러 */
a{color: black; !important;}

/* 상품명 위에 공연명 */
#concert_name {
  font-size: 13px;
  margin-bottom: 3px;
  font-weight: 300;
}

/* 상품명 */
#product_name{font-size: 18px;}

/* 제목 (Merchandise) */
h2{
  font-size: 60px; !important;
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
  padding: 50px 0 70px 0;
}

/* 검색기능 오른쪽으로 */
#product_search {float: right;}

/* 최신순 카테고리 오른쪽으로 */
#catergory {float: right;}

/* aside 네비바 큰 카테고리 (All, Concert) */
h3{
  font-family: 'Jost', sans-serif; !important;
  font-weight: 600;
}

/* 선택박스(최신순, 인기순, 좋아요순) 디자인 */
select {
  width: 80px;
  border: none; 
  border-bottom: 2px solid black;
  font-size: 14px;
}

/* aside 네비바 텍스트 디자인 */
#pro_name {
  border: none; 
  border-bottom: 2px solid black;
}

/* aisde 네비바 큰 카테고리 밑에 여백 */
.h3_title{padding-bottom: 10px;}

/* 검색기능까지 영역 아래 여백 */
#intro_wrap{padding-bottom: 70px;}

/* ul 점 제거 */
ul{
  list-style:none;
  margin:0px; padding:0px;
  font-size: 20px;
}

   
/* 상품 이미지 꽉차게 */
img{object-fit: contain;}


/* 네비바 + 상품 전체 영역 */
.list_container {
  width: 100%;
  margin: 0 auto;
  --background-color: lightgrey;
}

.list_container:after {  /* after를 이용하여 float해제하기 */
  display: block;
  clear: both;
  content: '';
}


/* 상품의 네비바 영역 */
.list_aside {
  background-color: #F2F3F4;
  position: sticky;
  top: 100px;
  width: 30%;
  --padding-top: 20px;
  --margin-bottom: 20px;
  float: right;
}

/* 상품 영역 */
.list_content {
  --background-color: lightgreen;
  width: 67%;
  margin-right: 25px;
  margin-bottom: 20px;
  float: left;
}
 
/* 푸터 */
.footer {
    clear: both;
}

/* Go to top */
#myBtn {
  position: fixed;
  bottom: 10px;
  right: 10px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  color: black;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  background: transparent;
}
#myBtn:hover {color: #B3B6B7;}


/* 상품마다 화살표 아이콘 띄우기 */
#arrow-icon {display: none;}
#product_box:hover #arrow-icon {display: block;}

/* 상품안에 아이콘 */
.product-imageandicon {
  width: 100%;
  position: relative;
}
.product-image img{
  width: 100%;
  vertical-align: middle;
}
.heart-icon{
  display: none;
  position: absolute;
  top: 10px;
  left: 0px;
}

.cart-icon{
  display: none;
  position: absolute;
  top: 11px;
  right: 0px;
}

#product_box:hover .heart-icon {display: block;}
#product_box:hover .cart-icon {display: block;}





.order-arrow {color: #D7DBDD;}
.order-check{font-weight: 400;}



  .listCheckTable {
    width: 100%;
    --border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  
   th, td {
    --border-bottom: 1px solid #444444;
    --border-left: 1px solid #444444;
    padding: 10px;
  } 
  
  
  
  th:first-child, td:first-child {
    border-left: none;
  }
  
  .cartorder, .orderconfirm{
  color: #D7DBDD;
  }
  
  #inform-table td{
  padding: 0 0 0 20px;
  }
  
  
  
/* 체크박스 css 시작 --------------------------------------------- */
input[type="checkbox"] { display: none; }
 
input[type="checkbox"] + label {
  display: block;
  position: relative;
  --padding-left: 35px;
  font: 14px/20px 'Open Sans', Arial, sans-serif;
  color: black;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}

input[type="checkbox"] + label:last-child { margin-bottom: 0; }

input[type="checkbox"] + label:before {
  content: '';
  display: block;
  width: 18px;
  height: 18px;
  border: 1px solid black;
  --position: absolute;
  left: 0;
  top: 0;
  opacity: .6;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

input[type="checkbox"]:checked + label:before {
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity: 1;
  border-top-color: transparent;
  border-left-color: transparent;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}
/* 체크박스 css 종료  ---------------------------------------------  */
	
	.cartTableBox td {
	--border-bottom: 1px solid grey;
	}
	
	.cart-delete-btn {
	 background:none;
 	 border:none;
	}
	
	.li_title{
	padding: 35px;
	}
	
	.summary{
	display: inline-block;
	padding-bottom: 10px;
	}
	
	.summaryList{
	padding-bottom: 15px;
	color: #A6ACAF;
	font-weight: thin;
	}
	
	.summaryDataList{
	padding-bottom: 15px;
	}
	
	.totalCheck{
	font-size: 24px;
	display: block;
	padding-bottom: 40px;
	}
	
	.checkoutBtn{
	background-color: black;
 	border:none;
 	color: white;
	position: relative;
	float: bottom;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	font-size: 20px;
	}
	
	.selectDeleteBtn{
	 width: 80px;
	 height: 40px;
	 background-color: white;
 	 border: 1px solid #F2F3F4 ;
 	 font-size: 15px;
 	 --padding-left: 0;
	}


/* 수량버튼 */
.count-wrap {position: relative;padding: 0 20px;overflow: hidden;}
.count-wrap > button {border: 0;background-color: white;color: #000;width: 30px;height: 30px;position: absolute;top: 0;font-size: 12px;}
.count-wrap > button.minus {left: 2;}
.count-wrap > button.plus {right: 7;}
.count-wrap .inp {border: 0;width: 20px;height: 30px;text-align: center;display: block;width: 100%;}

.concert-name{padding-bottom: 6px; font-size: 15px;}
.product-name{padding-bottom: 12px; font-size: 18px;}
.product-option{font-size: 14px;}







</style>


<script>
/* Go to top */
function scrollFunction() {
	let mybutton = document.getElementById("myBtn");

	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	$('html, body').animate({scrollTop:0}, '200');
}//scrollFunction() end



</script>



<!-- 본문영역 -->
<h2>Shopping Cart</h2>
<div class="order-check">
<span class="listcheck"> 01 LIST CHECK </span> <span class="order-arrow"> &nbsp; > &nbsp; </span> 
<span class="cartorder"> 02 ORDER </span> <span class="order-arrow"> &nbsp; > &nbsp; </span>  
<span class="orderconfirm"> 03 ORDER CONFIRM </span> 
</div>

<button onclick="topFunction()" id="myBtn" title="Go to top" style="font-size: 26px;">Go to top ↑</button>

<div class="wrapAll">
	
		<!-- intro_wrap 시작 -->
		<div id="intro_wrap">
		    
			 
		</div><!-- intro_wrap 끝 -->	
		
		
		
		<!-- list_container 시작 -->
		<div class="list_container">
		
			<!-- list_aside 시작 -->
			<div class="list_aside">
			
				<div class="li_title" id="li_title">
					<div style="font-size: 24px; font-weight: bold; padding-bottom: 30px;">주문 요약</div>
					
					<div class="summary catefory" style="float: left;">
						<div class="summaryList">총 주문금액</div>
						<div class="summaryList">총 배송비</div>
						<div class="summaryList">할인금액</div>
						<div class="summaryList" style="padding-top: 70px; padding-bottom: 30px;">총 결제금액</div>
						<div class="summaryList">적립 포인트</div>
					</div>    
					<div class="summary data" style="float: right; text-align: right;">
						<div class="summaryDataList" id="summaryOrder">총 주문금액</div>
						<div class="summaryDataList" id="summaryDelivery">총 배송비</div>
						<div class="summaryDataList" id="summarySale">0</div>						
						<div class="summaryDataList" id="summaryTotal" style="padding-top: 70px; font-size: 26px; font-weight: bold;">총 결제금액</div>
						<div class="summaryDataList" id="summarPoint">적립 포인트</div>
					</div>   
				
					<div>
						 <form name="frm" method="post" action="/cart/cartOrder" >   
						 <div id="hiddenplace">
						
						 </div>
							<button type="submit" class="checkoutBtn" onclick="return checkoutBtn()">Checkout</button>
						 </form>
					</div>
				
				</div><!-- li_title 끝 -->
				
			</div><!-- list_aside 끝 -->
	
	<c:if test="${empty mycart}"> 
       
          <p style="padding-top: 20px; font-size: 16px; padding-left: 60px;">
             장바구니가 비었습니다.
          </p>
       
    </c:if>
	
	<c:if test="${not empty mycart}"> 			
			<!-- list_content 시작 -->
			<div class="list_content">
				
				<!-- checkbox_group 시작 -->
				<div class="checkbox_group">			
				
				<table class="cartTableBox">
					<thead>
					  <tr>
					  	<th style="width: 40px; padding-left: 0;"><!-- 선택박스 -->
							<div class="agreeAll">
							<input type="checkbox" id="check_all" value="${mycart}" checked="checked">
							<label for="check_all"></label>
							</div>
					  	</th>
					    <th>상품정보</th>
					    <th style="text-align: center;">가격</th>
					    <th style="text-align: center;">수량</th>
					    <!-- <th>배송비</th> -->
					    <th></th>
					  </tr>
					</thead>
					
					
					
 					<c:forEach var="row" items="${mycart}" varStatus="vs">
 					
 					<div class="cart-info">
	 					<input type="hidden" class="cartPrice" value="${row.price}">
	 					<input type="hidden" class="cartCnt" value="${row.cnt}">
 					</div>
 					
 					
 					<tbody>
				      <tr id="mycartTable${row.cart_no}" >
				       	
				       	<td style="width: 30px; padding-left: 0;">
				       	

							<input type="checkbox" id="check${row.cart_no}" value="${row.cart_no}" name="selectcheck" class="normal" onchange="chkbox(this)" checked="checked">

							<label for="check${row.cart_no}"></label>
			       		
						</td>
				   
				      	<!-- 상품정보 -->
				        <td style="width: 500px; padding-bottom: 30px;">
					        <table id="inform-table"> 
							    <tr>
								    <td style="padding:0;">
								    	<div class="product-imageandicon">
											<a href="/product/${row.pro_no}">
											<img src="/storage/${row.postername}" width="140">
											</a>
										</div>
								    </td>
								    <td>
								    	<div class="concert-name">${row.title}</div>
								    	<div class="product-name">${row.pro_name}</div>
								    	<div class="product-option">
								    	색상:${row.color} / 사이즈: ${row.size}
								    	</div>
								    </td>
							    </tr>
						    </table> 
			 
						    
				        </td>

				        <!-- 가격 -->
				        <td style="width: 130px; text-align: center;">
				        <input type="hidden" id="product_price${row.cart_no}" name="product_price" value="${row.price}">
					        ￦
					        <span id="totalAmount${row.cart_no}">
					        <fmt:formatNumber value="${row.price * row.cnt}" pattern="#,###" />
					        </span>
				        </td>
				        
				        <!-- 수량 증가 감소 버튼 -->
				        <td style="width: 130px; padding-left: 0px;">
				        <div class="count-wrap _count">
				        	<c:set var="cart_no" value="${row.cart_no}" />
						    <button onclick="countminus(this)" type="button" id="count-minus${row.cart_no}" class="minus" value="${row.cart_no}"><img src="/images/minus.svg"></button>
						    <input  type="text"   id="product-qty${row.cart_no}" class="inp"   value="${row.cnt}" readonly="readonly"/>
						    <button onclick="countplus(this)" type="button" id="count-plus${row.cart_no}"  class="plus"  value="${row.cart_no}"><img src="/images/plus.svg"></button>
						</div>
				        </td>
				        
				        <!-- 삭제버튼 -->
				        <td style="width: 80px; text-align: center;">
				        	<button onclick="cartdelete(this)" value="${row.cart_no}" type="button" id="cartdeleteBtn${row.cart_no}" class="cart-delete-btn"><img src="/images/xbutton.svg"></button>
				        </td>
				        <!-- 삭제버튼 끝! -->
				      </tr>
				    </tbody>
					</c:forEach>
				</table>   
				</div><!-- checkbox_group end -->
				
				<div class="tablepadding" style="padding-bottom: 40px;"></div>
				
				<button onclick="delbtn()" class="selectDeleteBtn">선택삭제</button>
					
			</div><!-- list_content -->
		</div><!-- list_container -->
</div><!-- wrapAll end -->
</c:if> <!-- not empty mtcart -->


<script>


// 장바구니 비어있으면 주문요약 숨기기
<c:if test="${empty mycart}"> 
	//alert('--');
	$('#li_title').css('display','none');
</c:if>


//----------------------------------------------------------- 수량옵션
$('._count :button').on({
 'click' : function(e){
     e.preventDefault(); // a태그나 submit 태그를 눌렀을 때 페이지를 이동하거나 새로고침되는 동작을 막아준다.
     var $count = $(this).parent('._count').find('.inp');
     var now = parseInt($count.val());
     var min = 1;
     var max = 999;
     var num = now;

     
     if($(this).hasClass('minus')){
         var type = 'm';
     }else{
         var type = 'p';
     }
     if(type=='m'){
     	var idx = $('count-minus').index();
         if(now>min){
             num = now - 1;
             //가격가져오고
             //가격*num
         }
     }else{
         if(now<max){
             num = now + 1;
             //가격가져오고
             //가격*num
         }
     }
     if(num != now){
         $count.val(num);
     }
 }
});



//기본 총 상품가격(가격 * 수량)
var cart_price = 0; //계산용 금액 30000
var cart_price_text = ""; //표시용 금액 (콤마 찍어주기위함) 30,000
var cart_point = 0;
var select_priceAll = 0;


//foreach문으로 mycart 테이블에 있는 가격과 수량을 곱한다. 
<c:forEach var="row" items="${mycart}" varStatus="status">
	cart_price += ${row.price} * ${row.cnt};
</c:forEach>



var is_checked = $('#check_all').is(':checked');
console.log("체크되어있는지? is_checked : " + is_checked);

let cartnoList = [];
//console.log(cartnoList);

<c:forEach var="row" items="${mycart}" varStatus="status">
	cartnoList.push("${row.cart_no}");
	console.log("cartnoList" + cartnoList);
</c:forEach>

console.log("cartnoList 초기값 chkArray에 들어감 " + chkArray);




/* //체크박스 전체선택 시 담아줄 변수
let cartnoList = [];
console.log("전체선택 pk 넘버 cartnoList : " + cartnoList);

//jstl에 있는 ${row.cart_no} 변수를 모두 담는다.
<c:forEach var="row" items="${mycart}" varStatus="status">
	cartnoList.push("${row.cart_no}");
</c:forEach> */



select_priceAll = cart_price;
caculate(cart_price);

//함수 사용 (기본 총 상품가격 cart_price) 넣는다. 밑에 함수를 사용
deliveryPrice(cart_price);



//----------------------------------------------------------------- 체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
 var checked = $(this).is(":checked");
 
	// 전체삭제 금액
	var price_all = cart_price ;
	
	//선택한 금액 초기화 
	select_priceAll = 0;

if(checked){
	$(this).parents(".checkbox_group").find('input').prop("checked", true);

	<c:forEach var="row" items="${mycart}" varStatus="status">
		cartnoList.push("${row.cart_no}");
		console.log("cartnoList 더하기 " + cartnoList);
	</c:forEach>
	
	caculate(price_all);
	select_priceAll = price_all;
	
	console.log('전체선택 체크 (select_priceAll) : ' + select_priceAll);
	
} else {
	$(this).parents(".checkbox_group").find('input').prop("checked", false);
	
 
	<c:forEach var="row" items="${mycart}" varStatus="status">
		cartnoList.pop("${row.cart_no}");
		console.log("cartnoList 빼기 " + cartnoList);
	</c:forEach>
	

	
	
	<c:forEach var="row" items="${mycart}" varStatus="status">
 	price_all -= ${row.price} * ${row.cnt};
	</c:forEach>
	
	caculate(price_all);
	select_priceAll = 0;
	//console.log('전체선택 체크 해제(select_priceAll) : ' + select_priceAll);
	
} //end if 

});



//금액 계산 후 주문요약에 보여주는 함수
function caculate(cart_price) {
	cart_price_text  = setRegexp(cart_price);
	cart_point = cart_price * 0.01;
	$('#summaryOrder').text(cart_price_text);
	$('#summaryTotal').text(cart_price_text);
	$('#summarPoint').text("+ " + cart_point);
}//caculate(cart_price) end



//체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
 var is_checked = true;

 $(".checkbox_group .normal").each(function(){
     is_checked = is_checked && $(this).is(":checked");
 });

 $("#check_all").prop("checked", is_checked);
});

//----------------------------------------------------------- 배송비 추가, 감소 함수
function deliveryPrice (cart_price) {
	
	var total_price = 0;
	var total_price_text = "";
	
	if(cart_price < 50000 && cart_price > 0) {
		$('#summaryDelivery').text("+ 3,000");
		total_price = cart_price + 3000;
		//console.log('cartprice: ' + cart_price + 'totalprice : ' + total_price);
		total_price_text = setRegexp(total_price);
		$('#summaryTotal').text(total_price_text);
	} else if (cart_price >= 50000) {
		$('#summaryDelivery').text("무료배송");
		total_price = cart_price;
		total_price_text = setRegexp(total_price);
		$('#summaryTotal').text(total_price_text);
	} else {
		$('#summaryDelivery').text("0");
	}//if end
}//deliveryPrice() end

//----------------------------------------------------------- 수량 + 가격 증가
function countplus(this1) {  
	
	var maxnum = 99;
	
	var cart_no = this1.value; //장바구니 pk
	//alert(plus);
	var price = $('#product_price'+cart_no).val(); //가격
	//alert(price);
	var count = $('#product-qty'+cart_no).val()*1; // 장바구니에 담겨있는 수량
	//alert(count);	
	
	if (count>maxnum) {
		alert("재고가 부족합니다.");
		count -= 1;
		
		$('#product-qty'+cart_no).val(count);
	}else{
		count += 1;
		
		cart_price += price*1; // 총 상품금액 더해줌
		//alert(cart_price);
		cart_point = cart_price * 0.01; //적립 포인트
		//alert(cart_point);
		
		
		var total_price = price * count;
		//alert(total_price);
		
		/* if (total_price < 50000) {
			total_price += 3000;
		} */
		
		total_price = setRegexp(total_price);
		cart_price_text  = setRegexp(cart_price);
		total_price_text = setRegexp(total_price);
		
		
		$('#summaryOrder').text(cart_price_text);
		//$('#summaryTotal').text(total_price_text);
		$('#summarPoint').text(cart_point); //적립포인트
		$('#totalAmount'+cart_no).text(total_price);
		
		deliveryPrice(cart_price);
	}//if else
		
	
	// 데이터에 증가 값 저장
	cartCountUpdate(cart_no);
}//countplus(this1)


//----------------------------------------------------------- 데이터에 증가 값 저장
	function cartCountUpdate(cart_no){
		
	$.ajax({
			 url   : '/cart/countUp'
			 ,type : 'post'
			 ,data : {'cart_no' : cart_no}
			,success : function(data) {
				//alert("수량 들어옴");
			}//success end	
	});//$.ajax end
	
	
	}//cartCountUpdate(cart_no) end



//----------------------------------------------------------- 수량 + 가격 감소
function countminus(this1) {
	
	var cart_no = this1.value;//장바구니 pk
	//alert(cart_no);
	var price = $('#product_price'+cart_no).val();//가격
	//alert(price);
	var count = $('#product-qty'+cart_no).val()*1;//장바구니에 담겨있는 수량
	//alert(count);	
	
	
	if(count<=1){
		alert("최소수량입니다.");
		count = 1; // 수량 1로 고정 
	    return;
	}else if(count>1){
		count -= 1;
		
	    var pre_cartprice = cart_price; // 계산 전 총 상품 금액 
		if(cart_price > 0) {
			cart_price -= price*1; // 총 상품금액 빼
			//alert(cart_price);
		}
	
		var total_price = price * count;
		
		cart_point = cart_price * 0.01; //적립 포인트
		total_price = setRegexp(total_price);
		cart_price_text  = setRegexp(cart_price);
		total_price_text = setRegexp(total_price);
		
		//배송비 판단
		if(pre_cartprice >= 50000 && cart_price < 50000) {
			//3000원을 더한다 
		} else {
			//배송비 계산 없음 
		}
		
		deliveryPrice(cart_price);
		
		$('#summaryOrder').text(cart_price_text);
		//$('#summaryTotal').text(total_price_text);
		$('#totalAmount'+cart_no).text(total_price);
		$('#summarPoint').text(cart_point); //적립 포인트 
	}
	//console.log(count);
	cartCountDown(cart_no);
	
}//countminus(this) end


function setRegexp(price) {
	
	var reg_price = String(price).replace(/,/g , '');
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	reg_price = reg_price.toString().replace(regexp, ',');
	
	return reg_price;
}

//----------------------------------------------------------- 데이터에 증가 값 저장
	function cartCountDown(cart_no){
		
	$.ajax({
			 url   : '/cart/countDown'
			 ,type : 'post'
			 ,data : {'cart_no' : cart_no}
			,success : function(data) {
			}//success end	
	});//$.ajax end
	
	
	}//cartCountUpdate(cart_no) end


//----------------------------------------------------------- 장바구니 삭제
	function cartdelete(this1){
		var cart_no = this1.value;
	    //alert(cart_no);
	    
		$.ajax({
				url: '/cart/deleteMycart'
				,type:'post'
				,data : {'cart_no':cart_no}
				,success : function(data) {
					//alert("성공!");
					if(data == 1){
						location.reload();
						// 이부분 reload말고 테이블 제거하는 방법 ??
					}
				}//success end
			
		});//$.ajax({}) end
	} //cartdelete(this) end
	

	
	
//----------------------------------------------------------- 장바구니 선택 삭제 값 가져오기
	var chkArray = new Array();
	
	function chkbox(this1) {
		// 체크박스의 value값을 가져온다. 
		var cart_no = this1.value;
		//alert(cart_no);
		var price = $('#product_price'+cart_no).val();//장바구니에 담겨있는 가격 (1개)
		var count = $('#product-qty'+cart_no).val()*1;//장바구니에 담겨있는 수량
		var select_price = price * count; // 선택된 상품의 총 가격 (1개 가격 * 수량)
		console.log('chkbox:select_price : ' + select_price);
		// 한 행의 체크박스가 체크되면
		
		// 전체 선택이 되어 있다면 select_priceAll = cart_price;
		
		
		if (this1.checked) {
			//chkArray 배열에 cart_no을 넣어준다
			chkArray.push(cart_no);
			//alert(chkArray);
			console.log('chkArray : ' + chkArray);
			
			select_priceAll += select_price;
			console.log('chkbox:this1.checked(select_priceAll) : ' + select_priceAll);
			caculate(select_priceAll);
			deliveryPrice(select_priceAll);
			


		}else {
			// 체크되지 않는다면 
			// index 변수에 chkArray변수의 특정값 (cart_no)를 넣어주고
			var index = chkArray.indexOf(cart_no);
			// 만약 index 에 -1보다 크면
			
			select_priceAll -= select_price;
			
			if(select_priceAll <= 0) {
				select_priceAll = 0; 
			} 
			
			console.log('chkbox:this1.unchecked(select_priceAll) : ' + select_priceAll);
			
			caculate(select_priceAll);
			deliveryPrice(select_priceAll);
			
			
			if (index > -1) {
				//chkArray 배열의 index, 1을 잘라준다.
				chkArray.splice(index, 1);
			}
		}//if end
			//alert(chkArray);
	}//chkbox(this1) end
	

//---------------------------------------------------------- 장바구니 결제버튼 (무조건 선택시에만 결제 가능)

	function checkoutBtn() {
		
		console.log("cartnoList" + cartnoList);
		console.log(chkArray);
		
		
		var is_checked = $('#check_all').is(':checked');
		console.log("checkoutBtn의 is_checked " + is_checked);
		
		if(is_checked == true) {
			
			if(cartnoList.length < 1){
				console.log("cartnoList의 if문 " + cartnoList);
				
				alert('구매하실 상품을 선택해주세요.');
				return false
			}//if end 
			
			
			for(var i = 0 ; i <  cartnoList.length ; i++){

			    const hiddenplace = document.getElementById("hiddenplace");
	            const tag = document.createElement('p');
	            tag.innerHTML = "<input type='hidden' value='"+cartnoList[i]+"' name='cartno'/>";
	            hiddenplace.appendChild(tag);
	   
	            //alert(tag);
			}//for end
				
		}else {
			
			if(chkArray.length < 1){
				alert('구매하실 상품을 선택해주세요.');
				return false
			}//if end 
			
			for(var i = 0 ; i <  chkArray.length ; i++){

		    const hiddenplace = document.getElementById("hiddenplace");
         const tag = document.createElement('p');
         tag.innerHTML = "<input type='hidden' value='"+chkArray[i]+"' name='cartno'/>";
         hiddenplace.appendChild(tag);

         //alert(tag);
		}//for end
		
		}

		
		
		
		
		return true;
	}//end
	
//----------------------------------------------------------- 장바구니 선택 삭제 버튼 누를 때
	function delbtn() {
		
		chkArray += cartnoList;
		//alert(chkArray); 
		
		if(chkArray.length < 1 && cartnoList.length < 1) {
			alert("삭제할 상품을 선택해주세요.");
			return;
		}//if end
		
		//alert(chkArray);
		
		//배열 객체를 JSON 포맷으로 변환
		var chkList = {
			"chkList" : JSON.stringify(chkArray) //선택박스
		} //chkList 
		
		var checkAll = { 
			"checkAll" : JSON.stringify(cartnoList) //전체선택박스
		}
		
		
		if(confirm('선택된 상품을 삭제하시겠습니까?')){
			$.ajax({
					 url     : "/cart/selectDelete"
					,type    : "post"
					,data    : chkList
					,success : function(data) {
						//alert("성공!");
						alert('삭제되었습니다.');
						location.reload();
					} //success end
			});//ajax end 
			
		}//if end
		
	}//delbtn() end
	
	
	
	
	
	
	
	
	
	
	
	
	





</script>


<!-- 본문영역 --> 

<%@ include file="../footer.jsp" %>