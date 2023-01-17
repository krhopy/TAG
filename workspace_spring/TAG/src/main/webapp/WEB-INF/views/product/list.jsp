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
.product_box {
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
/*   margin-top: 20px;
  border-top: 1px solid black;
  padding-top: 15px;
  padding-bottom: 8px; */
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
#category {float: right;}

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
#intro_wrap{padding-bottom: 100px;}

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
  position: sticky;
  top: 80;
  width: 20%;
  padding-top: 20px;
  margin-bottom: 20px;
  float: left;
}

/* 상품 영역 */
.list_content {
  width: 80%;
  padding-top: 20px;
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
.product_box:hover #arrow-icon {display: block;}

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

.product_box:hover .heart-icon {display: block;} 



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








$( document ).ready(function() {
	$(".headProduct").addClass("active");//헤더 굿즈 아래 밑줄
	
	var likelist = [];
	
	<c:forEach items="${like}" var="row" varStatus="vs"> 
		likelist = ${like};
	</c:forEach>
	
	//alert(likelist);
	
	var pronum = 0;
	
	for(var i=0; i<likelist.length; i++) {
		//alert(likelist[i]);
		pronum = likelist[i];
		//alert(pronum);
		$("#hearticon"+pronum).prop("src", "/images/heart-192x192_2.svg");
		$("#heart-icon"+pronum).css("display", "inline-block");
	}//for end
});



//하트 이모티콘 클릭시
var flag = false;

function hearticon(this1) {
	var pro_no = this1.value;
	let m_id   = "${s_m_id}";

	
	if(${s_m_id == null}) {
		alert("로그인 후 이용가능합니다.");
		let url = '/loginForm';
		location.replace(url);
	}else {
		// 로그인 했을 때 클릭하면
		if( !flag ) {
			
			//product에 +1
			$.ajax({
		 		 url   	 : "/product/likecntInc"
				,type 	 : "post"
				,data 	 :  {"pro_no":pro_no}
				,success : function(data){
					//alert("+1 성공");
				}//success end
			}); //ajax end
			
			// member_like 에 insert
			$.ajax({
		 		 url   	 : "/product/likeInsert"
				,type 	 : "post"
				,data 	 :  {"pro_no":pro_no, "m_id":m_id}
				,success : function(data){
				}//success end
			}); //ajax end
			
			flag = true;
			
			$("#hearticon"+pro_no).prop("src", "/images/heart-192x192_2.svg");//채워진하트
			$("#heart-icon"+pro_no).css("display", "inline-block");//display 보이게
		
		} else {
			
			//product에 -1
			$.ajax({
		 		 url   	 : "/product/likecntDec"
				,type 	 : "post"
				,data 	 :  {"pro_no":pro_no}
				,success : function(data){
					//alert("-1 성공");
				}//success end
			}); //ajax end
			
			// member_like 에 insert
			$.ajax({
		 		 url   	 : "/product/likeDec"
				,type 	 : "post"
				,data 	 :  {"pro_no":pro_no, "m_id":m_id}
				,success : function(data){
				}
			}); //ajax end
			
			
			flag = false;
			
			
			$("#hearticon"+pro_no).prop("src", "/images/heart-192x192_1.svg"); // 빈 하트
			//$("#heart-icon"+pro_no).css("display", "none"); //
			
		}//if( !flag ) end
	}//if(${s_m_id == null}) end
		
	
	$("#product_box"+pro_no).hover(function(){
		//alert(pro_no);
		//요소에 마우스를 올렸을 때 기능
			$("#hearticon"+pro_no).css("display", "inline-block");
			//alert("마우스 올림");
			},function(){
		//요소에 마우스를 올린뒤 떨어졌을때 기능
		
			if( flag == true ) {
				$("#hearticon"+pro_no).css("display", "inline-block");
			}else {
				$("#hearticon"+pro_no).css("display", "none"); //마우스 떼면 안보이게
			    //alert("마우스 떨어짐");
			}//if end
	});//$("#product_box"+pro_no).hover end
		
}//hearticon(this1) end




</script>



<!-- 본문영역 -->
<h2>Merchandise</h2>
<button onclick="topFunction()" id="myBtn" title="Go to top" style="font-size: 26px;">Go to top ↑</button>
<div class="wrapAll">

	<input type="hidden" name="m_id" value="${s_m_id}" />
	<input type="hidden" name="likechk" value="${likechk}" />
	<input type="hidden" name="like" value="${like}" />
	
	
	
		<!-- intro_wrap 시작 -->
		<div id="intro_wrap">
		    
		    <!-- 상품검색 시작 -->
			<span id= "product_search">
				<form method="post" action="/search">
					<a href="/product/${row.pro_no}">${row.pro_name}</a>
					<input type="text" id="pro_name" name="pro_name" value="${pro_name}">
					<input type="submit" id="btnSubmit" value="검색" style="display:none;">
						<label for="btnSubmit">
						<svg width="22" height="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
							<g clip-path="url(#clip0_429_9118)">
							<path d="M21 21L16.6569 16.6569M16.6569 16.6569C18.1046 15.2091 19 13.2091 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19C13.2091 19 15.2091 18.1046 16.6569 16.6569Z" stroke="#292929" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
							</g>
							<defs>
							<clipPath id="clip0_429_9118">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
						</svg>
						</label>
				 </form> 
			 </span><!-- 상품검색 끝 -->
			 
		</div><!-- intro_wrap 끝 -->	
		
		
		
		<!-- list_container 시작 -->
		<div class="list_container">
		
			<!-- list_aside 시작 -->
			<div class="list_aside">
				<div class="h3_title">
				    <!-- <a href="#" onclick="location.href='/list.do'"><h3 style="text-decoration: underline;">All</h3></a> -->
				    <a onclick="location.href='/list.do'"><h3>All</h3></a>
			        <a href="/listConcert"><h3>Concert</h3></a>
		        </div><!-- h3_title 끝 -->
				
			 <div class="li_title">
				<c:forEach items="${categoryAll}" var="row" varStatus="vs">
					<ul>  
			          <li><a href="/list.do?category=${row.category}">
			          		<c:choose>
			          			<c:when test="${row.category == 'C'}"> Clothes </c:when>
			          			<c:when test="${row.category == 'P'}"> Poster </c:when>
			          			<c:when test="${row.category == 'M'}"> Album </c:when>
			          			<c:when test="${row.category == 'A'}"> Acc </c:when>
			          		</c:choose>
			          </a></li> 
			        </ul>
				</c:forEach>
	
			        
			        
			     </div><!-- li_title 끝 -->
			</div><!-- list_aside 끝 -->
			
			
			<!-- list_content 시작 -->
			<div class="list_content">
			
			<div class="count-category" style="padding-bottom: 30px;">
			<sapn id= "product_count"></sapn>
			Total (${total})
			</span>
			
			<!-- 최신순/인기순/좋아요순 카테고리 시작 -->
			<c:if test="${category == null}">
			<span class="category">
		    	<select id="category" name="category" onchange="if(this.value) location.href=(this.value);">
                  <option value="/list.do" <c:if test="${orderby == 'r'}">selected</c:if> >최신순</option>
                  <option value="/list.do/popularAll" <c:if test="${orderby == 'p'}">selected</c:if> >인기순</option>
                  <option value="/list.do/likeAll" <c:if test="${orderby == 'l'}">selected</c:if> >좋아요순</option>
		  	 	</select>
		    </span><!-- 최신순/인기순/좋아요순 카테고리 끝 -->
			</c:if>
			
			<c:if test="${category != null}">
			<span class="category">
		    	<select id="category" name="category" onchange="if(this.value) location.href=(this.value);">
                  <option value="/list.do" <c:if test="${orderby == 'r'}">selected</c:if> >최신순</option>
                  <option value="/list.do/popularAll" <c:if test="${orderby == 'p'}">selected</c:if> >인기순</option>
                  <option value="/list.do/likeAll" <c:if test="${orderby == 'l'}">selected</c:if> >좋아요순</option>
		  	 	</select>
		    </span><!-- 최신순/인기순/좋아요순 카테고리 끝 -->
			</c:if>
			</div><!-- count-category end -->
		
			
				<table>
					<br>
					<tr>
							<div>
							<!-- varStatus 상태용 변수 -->
							<c:forEach items="${list}" var="row" varStatus="vs">
							<a href="/product/${row.pro_no}">

							<td id="product_box${row.pro_no}" class="product_box">
							
								<!-- 상품 이미지 -->
								<c:choose>
									<c:when test="${row.postername != '-'}">
									
									<div class="product-imageandicon">
									
										
								
										<!-- 하트 아이콘 -->
										<span class="heart-icon" id="heart-icon${row.pro_no}">
										<button value="${row.pro_no}" onclick="hearticon(this)" style="border: none; background-color:transparent; outline:none;"> 
											<img id="hearticon${row.pro_no}" src="/images/heart-192x192_1.svg"/>
										</button>
										</span>
						
										
										<div class="product-image">
											<a href="/product/${row.pro_no}"><img src="/storage/${row.postername}" width="300px" height="400px"></a>
										</div>
									</div>
									</c:when>
									
									<c:otherwise>
										등록된 사진 없음!! <br>
									</c:otherwise>
								</c:choose> 
								
								
								<!-- 공연명 --> 
								<div id="concert_name">${row.title}</div>
								
								<!-- 상품명 -->
								<div id="product_name">
									<a href="/product/${row.pro_no}">${row.pro_name}</a>
								</div>
					
								<!-- 가격 -->
								<div id="product_price">
								￦ <fmt:formatNumber value="${row.price}" pattern="#,###" />
									<span style="float: right;">
									<a href="/product/${row.pro_no}">
										<svg id="arrow-icon" width="45px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26.56 15.5">
										<defs>
										<style>.cls-1{fill:none;stroke:#231f20;stroke-miterlimit:10;stroke-width:1px;}</style>
										</defs>
										<g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1">
										<line class="cls-1" y1="7.75" x2="26.03" y2="7.75"/>
										<polyline class="cls-1" points="18.55 15.23 26.03 7.75 18.55 0.27"/>
										</g>
										</g>
										</svg>
									</a>
									</span>
									
								</div>
								
								<div id="cart" >좋아요 카트</div>
								<div id="list_line"></div>
							</td>
							</a>
							<!-- 테이블 한줄에 5칸씩 -->
							<c:if test="${vs.count mod 3==0}">
								<tr><tr>
							</c:if>
							</c:forEach>
							</div>
					</tr>
				</table>   
					
					
					
					
				<!-- 페이징 -->	
				<div style="width: 100%; display: block; text-align: center;">	
					<c:if test="${requestScope.count > 0}">
						<c:set var="pageCount" value="${requestScope.totalPage}" />
						<c:set var="startPage" value="${requestScope.startPage}" />
						<c:set var="endPage" value="${requestScope.endPage}" />
				
				
							<!-- endPage는 10단위이기에 총 페이지가 end 페이지보다 작으면 그 수를 대입한다 -->
							<!-- 즉, 만약 최종 페이지 수가 22라면 30까지 표시할 필요가 없으니 엔드 페이지 수를 22로 맞춘다 -->
							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>
				
				
				
							<c:if test="${category == null}">
								
									<!-- ${orderby == 'r'} -->
									<c:if test="${orderby == 'r'}">
										<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
										<c:if test="${startPage > 1}">
											<a href="/list.do?pageNum=${startPage-1}"> < </a>
										</c:if>
							
										<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${pageNum == i}">
													<span style="font-weight: bold">${i}</span>
												</c:when>
												<c:when test="${pageNum != i}">
													<a href="/list.do?pageNum=${i}">${i}</a>
												</c:when>
											</c:choose>
										</c:forEach>
							
										<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
										<c:if test="${endPage < pageCount}">
											<a href="/list.do?pageNum=${startPage+5}"> > </a>
										</c:if>
									</c:if><!-- ${orderby == 'r'} end -->
									
									
									<!-- ${orderby == 'p'} -->
									<c:if test="${orderby == 'p'}">
										<c:if test="${startPage > 1}">
											<a href="/list.do/popularAll?pageNum=${startPage-1}"> < </a>
										</c:if>
							
										<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${pageNum == i}">
													<span style="font-weight: bold">${i}</span>
												</c:when>
												<c:when test="${pageNum != i}">
													<a href="/list.do/popularAll?pageNum=${i}">${i}</a>
												</c:when>
											</c:choose>
										</c:forEach>
							
										<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
										<c:if test="${endPage < pageCount}">
											<a href="/list.do/popularAll?pageNum=${startPage+5}"> > </a>
										</c:if>
									</c:if><!-- ${orderby == 'p'} end -->
									
									
									<!-- ${orderby == 'l'} -->
									<c:if test="${orderby == 'l'}">
										<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
										<c:if test="${startPage > 1}">
											<a href="/list.do/likeAll?pageNum=${startPage-1}"> < </a>
										</c:if>
							
										<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${pageNum == i}">
													<span style="font-weight: bold">${i}</span>
												</c:when>
												<c:when test="${pageNum != i}">
													<a href="/list.do/likeAll?pageNum=${i}">${i}</a>
												</c:when>
											</c:choose>
										</c:forEach>
							
										<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
										<c:if test="${endPage < pageCount}">
											<a href="/list.do/likeAll?pageNum=${startPage+5}"> > </a>
										</c:if>
										
									</c:if><!-- ${orderby == 'l'} end -->
							
							</c:if><!-- ${category == null} end -->
							
							
							
							<c:if test="${category != null}">
								
								<c:if test="${orderby == 'r'}">
									<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
									<c:if test="${startPage > 1}">
										<a href="/list.do?category=${category}&pageNum=${startPage-1}">[이전]</a>
									</c:if>
						
									<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${pageNum == i}">
												<span style="font-weight: bold">${i}</span>
											</c:when>
											<c:when test="${pageNum != i}">
												<a href="/list.do?category=${category}&pageNum=${i}">${i}</a>
											</c:when>
										</c:choose>
									</c:forEach>
						
									<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
									<c:if test="${endPage < pageCount}">
										<a href="/list.do?category=${category}&pageNum=${startPage+10}">[다음]</a>
									</c:if>
								</c:if>
								
								<c:if test="${orderby == 'p'}">
									<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
									<c:if test="${startPage > 1}">
										<a href="/list.do/popularCateg?category=${category}&pageNum=${startPage-1}">[이전]</a>
									</c:if>
						
									<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${pageNum == i}">
												<span style="font-weight: bold">${i}</span>
											</c:when>
											<c:when test="${pageNum != i}">
												<a href="/list.do/popularCateg?category=${category}&pageNum=${i}">${i}</a>
											</c:when>
										</c:choose>
									</c:forEach>
						
									<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
									<c:if test="${endPage < pageCount}">
										<a href="/list.do/popularCateg?category=${category}&pageNum=${startPage+10}">[다음]</a>
									</c:if>
								</c:if>
								
								
								<c:if test="${orderby == 'l'}">
									<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
									<c:if test="${startPage > 1}">
										<a href="/list.do/likeCateg?category=${category}&pageNum=${startPage-1}">[이전]</a>
									</c:if>
						
									<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${pageNum == i}">
												<span style="font-weight: bold">${i}</span>
											</c:when>
											<c:when test="${pageNum != i}">
												<a href="/list.do/likeCateg?category=${category}&pageNum=${i}">${i}</a>
											</c:when>
										</c:choose>
									</c:forEach>
						
									<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
									<c:if test="${endPage < pageCount}">
										<a href="/list.do/likeCateg?category=${category}&pageNum=${startPage+10}">[다음]</a>
									</c:if>
								</c:if>
						
						</c:if><!-- ${category != null} end -->
							
					</c:if><!-- ${requestScope.count > 0} end -->
				
				</div>	
						
			</div><!-- list_content -->
		</div><!-- list_container -->

</div><!-- wrapAll end -->

<!-- 본문영역 -->

<%@ include file="../footer.jsp" %>