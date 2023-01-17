<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://kit.fontawesome.com/698fcd5feb.js" crossorigin="anonymous"></script>



<style>

.barBtn{
	padding-left:470px;
	--height:80px;
}

.barBtn .bar1, .barBtn .bar2, .barBtn .bar3{
	width:150px;
	padding-top: 16px;
    padding-bottom: 16px;
    padding-left: 32px;
    padding-right: 32px;
    font-size: 14px;
}


.barBtn .bar1{
	margin-left:-285px;
	background:#99ff99;
	color: black;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}

.barBtn .bar2{
	margin-left:-280px;
	background:black;
	color: white;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}

.barBtn .bar3{
	--margin-left:60px;
	background:black;
	color: white;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}




#ticketSalejsp p, #ticketDeliveryjsp p {
	font-size:12px;
}

#ticketSalejsp b{
	font-size:12px;
}

/* 테이블 */
.stb {
	width:740px;
	margin-left:40px;
	margin-top:3px;
	font-size:14px;
	align:center;
}

.stb td, .stb th {
	padding:2px;
	text-align:center;
}


.stb select {
    width: 115px;
	border-bottom: 1px solid black;
    font-size: 14px;
}

.stb input {
    width: 125px;
    text-align:center;
    font-size: 14px;
}



.ktb, .jtb {
	border-collapse:collapse;
	width: 600px;
	margin-top:3px;
	margin-bottom:3px;
}

.ktb td, .jtb td {
    border: 1px solid gray;
    line-height:25px;
    padding:2px;
    padding-left:6px;
    font-size:10px;
}


.dtb {
	border-collapse:collapse;
	width: 600px;
	margin-top:3px;
	margin-bottom:3px;
	font-size:12px;
	align:center;
}

.dtb th, .dtb td {
	padding-top:2px;
}

/* 이름 유효성 검사 none */
.name_input{color:#FF0066; display: none; margin-top:5px;}

/* 핸드폰 유효성 검사 */
.tel_input {color:#FF0066; display: none; margin-top:5px;}
.tel_check {color:#FF0066; display: none; margin-top:5px;}

/* 주소 유효성 검사 */
.addr_input{color:#FF0066; display: none; margin-top:5px;}

</style>



<div id="ticketSalejsp">
	<div class="barBtn">
	    <button type="button" class="btn bar3">수령방법</button>
	    <button type="button" class="btn bar2" style="background:#99ff99; color: black;">할인선택</button>
	    <button type="button" class="btn bar1" style="background:black; color: white;">좌석선택</button>
	</div>
	<br>
	<h5>
		<i class="fa-solid fa-money-check-dollar"></i> 할인 선택
	</h5>
	<p>할인은 자동선택 되지 않으니, 적용 받고자하는 할인이 있는 경우 직접 선택해주시기 바랍니다.</p>
	<table class="stb">
	<tr style="background:black; color:white;">
		<th>등급</th>
		<th>할인명</th>
		<th>할인금액</th>
		<th>매수</th>
		<th>설명</th>
	</tr>
	<tr>
		<td style="background:lightgrey;">R석</td>
		<td>
			<select name="disSelectR">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceR" value="0원">
		</td>
		<td>
			<select name="disCntR">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesR" value="일반 기본가">
		</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">S석</td>
		<td>
			<select name="disSelectS">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceS" value="0원">
		</td>
		<td>
			<select name="disCntS">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesS" value="일반 기본가">
		</td>
	</tr>
	<tr>
		<td style="background:lightgrey;">A석</td>
		<td>
			<select name="disSelectA">
				<option value="N">-선택없음-</option>
				<option value="J">장애인 할인</option>
				<option value="K">국가유공자 할인</option>
			</select>
		</td>
		<td>
			<input type="text" id="disPriceA" value="0원">
		</td>
		<td>
			<select name="disCntA">
				<option value="0">-선택없음-</option>
			</select>
		</td>
		<td>
			<input type="text" id="disDesA" value="일반 기본가">
		</td>
	</tr>
	</table>
	<br>
	<hr>
	<h6>
		<i class="fa-regular fa-handshake"></i> 장애인·국가유공자 이용안내
	</h6>
	<div style="margin-left:40px;">
	<b>장애인</b>
	<table class="jtb" style="margin-bottom:10px;">
	<tr>
		<td>구 분</td>
		<td>장애인 복지카드 소지자 (1급~3급 / 중증)</td>
		<td>장애인 복지카드 소지자 (4급이하 / 경증)</td>
	</tr>
	<tr>
		<td>공연</td>
		<td>본인 및 동반 1인 30%</td>
		<td>본인 30%</td>
	</tr>	
	</table>
	<b>국가유공자</b>
	<table class="ktb">
	<tr>
		<td>구 분</td>
		<td>국가유공자 본인 및 동반 1인</td>
		<td>국가유공자 유족증 소지자 본인</td>
		<td>국가유공자 배우자(국가유공자 동반시)</td>
	</tr>
	<tr>
		<td>공연</td>
		<td>30% 할인</td>
		<td>30% 할인</td>
		<td>30% 할인</td>
	</tr>	
	</table>
	<p>
		법률에서 정한 국가유공자(독립유공자, 5·18민주유공자, 특수임무유공자), 참전유공자 기준으로 할인 제공<br>
		국가유공자 배우자는 가족관계증명서와 신분증을 함께 제시하여야 한다.
	</p>
	</div>
</div>

<div id="ticketDeliveryjsp">
	<div class="barBtn">
	    <button type="button" class="btn bar3" style="background:#99ff99; color: black;">수령방법</button>
	    <button type="button" class="btn bar2">할인선택</button>
	    <button type="button" class="btn bar1" style="background:black; color: white;">좌석선택</button>
	</div>
	<br>
	<h5>
		<i class="fa-solid fa-truck-fast"></i> 배송 선택 / 주문자 확인
	</h5>
	<p>티켓을 받는 방법을 선택하실 수 있으며, 특정 상품은 배송 방식이 지정되어있어 선택하지 못하실 수도 있습니다.</p>
	
	<!-- 주소창 입력 모달창 -->
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:404px; margin:-10px 0 20px 0; position:fixed; left:460px;">
	  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
	</div>
	
	
	<table class="dtb">
	<tr>
		<td style="background:black; color:white; font-size:14px; text-align:center;">수령방법선택</td>
		<td style="padding-top:8px; font-size:14px; padding-left:10px;">
			<input type="radio" id="dlvBtn" name="deliverBtn" value="3000" onclick="dlvSelected()"><!-- value 3000원 -->
 			<label for="dlvBtn">배송</label><br>
 			<input type="radio" id="pUpBtn" name="deliverBtn" value="0" onclick="pUpSelected()" checked><!-- value 0원 -->
 			<label for="pUpBtn">현장수령</label><br>
		</td>
	</tr>
	<tr>
		<th colspan='2' style="height:60px; vertical-align:bottom; border-bottom:2px solid black; font-size:14px;">주문자확인</th>
	</tr>
	<tr><td></td><td></td></tr><tr><td></td><td></td></tr>
	<tr>
		<td><label for="rec_name">이름</label></td>
		<td>
			<input type="text" id="rec_name" name="rec_name" onchange="inputCheck()">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span class="name_input">이름 입력은 필수입니다.</span>
		</td>
	</tr>
	<tr>
		<td><label for="rec_tel">연락처</label></td>
		<td><input type="text" id="rec_tel" name="rec_tel" onchange="inputCheck()"></td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span class="tel_input">연락처 입력은 필수입니다.</span>
	        <span class="tel_check">연락처를 형식에 맞게 입력해주세요. ex) 010-1234-5678</span>
		</td>
	</tr>
	<tr>
		<td><label for="rec_addr">받는주소</label></td>
		<td>
			<input type="text" size="50" id="m_zipcode" name="rec_zipcode" placeholder="우편번호" readonly>
            <input type="button" id="m_zipcodeBtn" value="주소찾기" size="50" onclick="DaumPostcode()">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="text" size="50" id="m_addr1" name="rec_addr1" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<input type="text" size="50" name="rec_addr2" id="m_addr2" placeholder="상세 주소" onchange="inputCheck()">
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<span class="addr_input">주소를 입력해주세요.</span>
		</td>
	</tr>
	<tr>
		<td><label for="msg">배송메세지</label></td>
		<td><input type="text" size="50" id="msg" name="msg" placeholder="배송메세지를 입력해주세요."></td>
	</tr>				
	</table>
</div><!-- ticketDeliveryjsp end -->






<!-- ----- DAUM 우편번호 API 시작 ----- -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('m_zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('m_addr1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#m_addr2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '500px',
            height : '440px'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
<!-- ----- DAUM 우편번호 API 종료----- -->


function inputCheck(){
	//휴대전화 규칙성
	var tel_rule   = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
    // 1. 이름 입력이 됐다면
    if($("#rec_name").val().trim() != ""){
    	$('.name_input').css("display","none"); 
	// 2. 휴대전화 입력이 됐다면
    }else if($("#rec_tel").val().trim() != ""){
    	$('.tel_input').css("display","none");
    	
	// 2-1. 휴대전화 규칙성이 됐다면
    }else if(tel_rule.test($("#rec_tel").val().trim()) == true){
    	$('.tel_check').css("display","none");
    
    // 3. 주소  입력됐다면
    }else if($("#m_addr2").val().trim() != ""){
    	$('.addr_input').css("display","none");
    	
    }//if end
	
}//inputCheck()






</script>