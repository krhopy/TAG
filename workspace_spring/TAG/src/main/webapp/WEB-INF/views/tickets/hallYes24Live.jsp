<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://kit.fontawesome.com/698fcd5feb.js" crossorigin="anonymous"></script>



<style>
/*
.barBtn{
	padding-left:450px;
	height:40px;
}

.barBtn .bar1, .barBtn .bar2, .barBtn .bar3{
	padding-top: 12px;
    padding-bottom: 12px;
    padding-left: 25px;
    padding-right: 25px;
    font-size: 14px;
}


.barBtn .bar1{
	margin-left:-200px;
	background:#99ff99;
	color: black;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}

.barBtn .bar2{
	margin-left:-200px;
	background:black;
	color: white;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}

.barBtn .bar3{
	margin-left:10px;
	background:black;
	color: white;
	border-radius: 10px 50px 50px 10px;
	border: 3px solid white;
}
*/
.barBtn .bar1{
	background:#99ff99;
	color: black;
}


#map1Fjsp p, #map2Fjsp p {
	font-size:12px;
	margin:0;
}




.stageBar {
	width: 837px;
	height:40px;
	background: lightgrey;
	text-align:center;
	padding: auto;
	margin-right:50px;
	margin-bottom:20px;
}

.stageBar b{
	font-size:28px;
	color:gray;
}

.blank1FBar {
	height:200px;
	width:500px;
	background: lightgrey;
	text-align:center;
	padding: auto;
	margin-left:170px;
	margin-top:20px;
	display:block;
}

</style>






<div id="map1Fjsp" style="width: 1000px;">
	<!-- <h2>좌석선택-가격할인-배송현장수령</h2> -->
	<div class="barBtn">
	    <button type="button" class="btn bar3">수령방법</button>
	    <button type="button" class="btn bar2">할인선택</button>
	    <button type="button" class="btn bar1">좌석선택</button>
	</div>
	<br>
	<h5>스탠딩 1층</h5>
	<p>스탠딩은 실제 좌석과 다르며 예매시 지정하는 번호가 입장 번호 순서입니다. 빠른 번호를 예매 할수록 입장 순서가 빨라집니다.</p>
	
	<div class="stageBar">
		<b>STAGE</b>
	</div>
	<div style="margin:auto;">
	<div id="smallwrap" style="width: 900px;">
	<div id="standA" style="display: inline-block; margin-right:40px;">
		<h6>스탠딩 A구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatA" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnA${seatA} name=btnA${seatA} value="${seatA}" onclick="standAdd(this, 'A', ${seatA})">
				</td>
				<c:if test="${seatA mod 33 == 0}">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	<div id="standB" style="display: inline-block;">
		<h6>스탠딩 B구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatB" begin="1" end="825" step="1">
				<td>
					<input type="button" id=btnB${seatB} name=btnB${seatB} value="${seatB}" onclick="standAdd(this, 'B', ${seatB})">
				</td>
				<c:if test="${seatB mod 33 == 0}">
				<!-- 테이블 한줄에 30개씩 -->
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	</div>
	</div>
</div><!-- map1Fjsp end -->

<div id="map2Fjsp">
	<div class="barBtn">
	    <button type="button" class="btn bar3">수령방법</button>
	    <button type="button" class="btn bar2">할인선택</button>
	    <button type="button" class="btn bar1">좌석선택</button>
	</div>
	<br>
	<h5>지정석 2층</h5>
	<p>객석 2층은 지정좌석제입니다.</p>
	
	<div class="stageBar">
		<b>STAGE</b>
	</div>
	
	<div class="blank1FBar">
		<b>아래층 스탠딩 구역</b>
	</div>
	
	<div id="rseatX" style="display: inline-block; margin-left:40px;  margin-top:20px;">
		<h6>지정좌석 X구역</h6>
		<table style="border-spacing: 0;">
<!-- 지정좌석 불균형적인 공간 빼주는 부분 -->
			<tr>
			<!-- X구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullX" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- nullX만큼 없애준다 -->
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatX" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullX)}" step="1">
				<c:forEach var="nullXtd" begin="1" end="${nullX[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullX end -->
				<c:forEach var="c" begin="1" end="${15-nullX[r-1]+1}" step="1"><!-- 15는 한 행의 최대 좌석수 - nullX는 위에 있는 빈공간 배열을 가져와서 r-1(index가 0부터 시작하기때문에 -1) 하고 +1은 1열,2열 ... 7열 표시해주기 위함. -->
					<td>
						<c:if test="${c <= (15-nullX[r-1])}">
							<!-- ${seatX} 1씩 늘어나게하기 -->
							<c:set var="seatX" value="${seatX+1}"/>
							<input type="button" id=btnX${seatX} name=btnX${seatX} value="${c}" onclick="rseatAdd(this, 'X', ${r}, ${seatX})">
						</c:if>
						<c:if test="${c == (15-nullX[r-1]+1)}">
							<button disabled>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- c end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatX" end -->
	<div id="rseatY" style="display: inline-block;">
		<h6>지정좌석 Y구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Y구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullYL"   value="<%=new int[] {4,3,3,2,1,0,1} %>"/><!-- Left -->
			<c:set var="nullYR"   value="<%=new int[] {3,3,2,1,1,0,1} %>"/><!-- Right -->
			<c:set var="nullYAll"   value="<%=new int[] {7,6,5,3,2,0,2} %>"/><!-- L+R -->
			<!-- "seatY" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatY" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullYL)}" step="1">
				<c:forEach var="nullYLtd" begin="1" end="${nullYL[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullYL end -->
				<!-- r=row, c=calum 열? 머냐 -->
				<c:forEach var="c" begin="1" end="${28-nullYAll[r-1]}" step="1">
					<c:choose><%-- if else문 --%>
						<c:when test="${r == 7 && c <= 11}"><!-- 7열 11번째 좌석까지 생성 -->
							<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c >= 16}"><!-- 7열 16번째 좌석부터 생성 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c-4}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 7 && c > 11 && c < 16}"><!-- 7열 빈 좌석 생성 -->
					    	<td></td>
						</c:when>
						<c:otherwise><!-- 그 외 일반 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
					  	</c:otherwise>
					</c:choose><!-- choose end -->
				</c:forEach><!-- c end -->
				<c:forEach var="nullYRtd" begin="1" end="${nullYR[r-1]+1}" step="1">
					<td>
						<c:if test="${nullYRtd == nullYR[r-1]+1 }">
							<button disabled>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- nullYR end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatY" end -->
	<div id="rseatZ" style="display: inline-block;">
		<h6>지정좌석 Z구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Z구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullZ" value="<%=new int[] {0,1,2,3,3,5,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatZ" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullZ)}" step="1">
				<c:forEach var="c" begin="1" end="${15-nullZ[r-1]}" step="1">
					<td>
						<!-- ${seatZ} 1씩 늘어나게하기 -->
						<c:set var="seatZ" value="${seatZ+1}"/>
						<input type="button" id=btnZ${seatZ} name=btnZ${seatZ} value="${c}" onclick="rseatAdd(this, 'Z', ${r}, ${seatZ})">
					</td>
				</c:forEach><!-- c end -->
				<c:forEach var="nullZtd" begin="0" end="${nullZ[r-1]}" step="1">
					<td>
						<c:if test="${nullZtd == nullZ[r-1] }">
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- null end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatZ" end -->
</div><!-- map2Fjsp end -->	



<script>


/* 좌석 스크립트 ------------------------------------------------------------------------------------------ */

//전역변수 선언
var flagsA = new Array(826); //좌석tb의 좌석개수+1 (배열[0]번째는 쓰지않는다)
var flagsB = new Array(826);
var flagsX = new Array(86);
var flagsY = new Array(168);
var flagsZ = new Array(86);

//flags 초기 설정
//A구역
for(let i = 0; i < flagsA.length; i++){
	flagsA[i] = true; //true 누르지 않은 상태.
}//for end
//B구역
for(let i = 0; i < flagsB.length; i++){
	flagsB[i] = true;
}//for end
//X구역
for(let i = 0; i < flagsX.length; i++){
	flagsX[i] = true;
}//for end
//Y구역
for(let i = 0; i < flagsY.length; i++){
	flagsY[i] = true;
}//for end
//Z구역
for(let i = 0; i < flagsZ.length; i++){
	flagsZ[i] = true;
}//for end

//A,B구역 전체 R등급
for(let i = 1; i < flagsA.length; i++){ 
	//css 등급별 색깔 적용
	$("#btnA"+i).addClass("StandingR");
	$("#btnB"+i).addClass("StandingR");
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsA[i]){//false이면
		$("#btnA"+i).addClass("on");
	}//if end
	if(!flagsB[i]){//false이면
		$("#btnB"+i).addClass("on");
	}//if end
}//for end

//X구역 R등급, S등급, A등급
for(let i = 1; i < flagsX.length; i++){ 
	if(i <= 29){
		// 1-29까지는 R등급
		$("#btnX"+i).addClass("R");
		//$("#btnX"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 29 && i <= 76){
		// 29 - 79까지는 S등급
		$("#btnX"+i).addClass("S");
		//$("#btnX"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 76){
		// 76이상은 A등급
		$("#btnX"+i).addClass("A");
		//$("#btnX"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsX[i]){//false이면
		$("#btnX"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsY.length; i++){ //Y구역 R등급, S등급, A등급
	if(i <= 43){
		$("#btnY"+i).addClass("R");
		//$("#btnY"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 43 && i <= 145){
		$("#btnY"+i).addClass("S");
		//$("#btnY"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 145){
		$("#btnY"+i).addClass("A");
		//$("#btnY"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsY[i]){//false이면
		$("#btnY"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsZ.length; i++){ //Z구역 R등급, S등급, A등급
	if(i <= 29){
		$("#btnZ"+i).addClass("R");
		//$("#btnZ"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 29 && i <= 76){
		$("#btnZ"+i).addClass("S");
		//$("#btnZ"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 76){
		$("#btnZ"+i).addClass("A");
		//$("#btnZ"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end

	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsZ[i]){//false이면
		$("#btnZ"+i).addClass("on");
	}//if end
}//for end


// [스탠딩 좌석 추가와 삭제]
function standAdd(SeatNum, section, flagNum){ //좌석번호, 구역이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	
	switch (section){
		case "A" : 
			if(flagsA[flagNum]){ //좌석을 선택할 때
				flagsA[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsA[flagNum]=true; swt=false; break;
			}//if end
		case "B" : 
			if(flagsB[flagNum]){ //좌석을 선택할 때
				flagsB[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsB[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		//색상조절 + 오른쪽에 선택 좌석 표시
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' readonly value='";
		input += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가 -> 다슬css에 class="on" 있음
		$("#panel").append(input); //<div id="panel">안에 <input class=input+section+flagNum></input> 생성
		$("#panel").scrollTop($("#seatAddFormjsp").height());
		
		//오른쪽 요약에 html로 선택좌석 나타내줌
		let input2="";
		input2 += "<input type='text' class='input";
		input2 += 									section+flagNum;
		input2 += 	"' name='cseat' readonly value='";
		input2 += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input2 += "'>";
		$("#addedSeat").append(input2);
		countSeats(); //좌석수 계산하기
		
		//선택된 좌석 선택 불가하게 막기위함 (hidden 속성 줌)
		let input3="";
		input3 += "<input type='hidden' class='input";
		input3 += 									section+flagNum;
		input3 += "' name='flagnum' value='";
		input3 += 							section+flagNum;
		input3 += "'>";
		$("#addedSeat").append(input3);
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("input").remove(".input"+section+flagNum); //<input class=input+section+flagNum></input> 제거
		countSeats(); //좌석수 계산하기
	}//if end
}//standAdd() end




//지정좌석 추가와 삭제
function rseatAdd(SeatNum, section, row, flagNum){ //좌석번호, 구역이름, 열이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	var grade=$(SeatNum).attr('class'); //좌석등급을 클래스명으로 가져옴
	
	//지정좌석 등급 324행 가보기
	switch (section){
		case "X" : 
			if(flagsX[flagNum]){ //좌석을 선택할 때
				flagsX[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsX[flagNum]=true; swt=false; break;
			}//if end
		case "Y" : 
			if(flagsY[flagNum]){ //좌석을 선택할 때
				flagsY[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsY[flagNum]=true; swt=false; break;
			}//if end
		case "Z" : 
			if(flagsZ[flagNum]){ //좌석을 선택할 때
				flagsZ[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsZ[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' readonly value='";
		input += grade+"석 2층-"+section+"구역"+row+"열 좌석번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(input); //<div id="panel">안에 <input class=input+section+flagNum></input> 생성
		$("#panel").scrollTop($("#seatAddFormjsp").height());
		
		let input2="";
		input2 += "<input type='text' class='input";
		input2 += 									section+flagNum;
		input2 += 	"' name='cseat' readonly value='";
		input2 += grade+"석 2층-"+section+"구역"+row+"열 좌석번호-"+snum;
		input2 += "'>";
		$("#addedSeat").append(input2);
		countSeats(); //좌석수 계산하기
		
		let input3="";
		input3 += "<input type='hidden' class='input";
		input3 += 									section+flagNum;
		input3 += "' name='flagnum' value='";
		input3 += 							section+flagNum;
		input3 += "'>";
		$("#addedSeat").append(input3);
	}else{ //좌석선택을 해제할 때
		$("#btn"+section+flagNum).removeClass("on"); //#btn+seatNo에 class="on" 제거
		$("input").remove(".input"+section+flagNum); //<span class=span+str></span> 제거
		countSeats(); //좌석수 계산하기
	}//if end
}//rseatAdd() end



//다시선택 버튼을 누르면
function reSelectFN(){
	//모든 flag=true로 바꾸기
	for(let i = 0; i < flagsA.length; i++){
		flagsA[i] = true;
	}//for end
	for(let i = 0; i < flagsB.length; i++){
		flagsB[i] = true;
	}//for end
	for(let i = 0; i < flagsX.length; i++){
		flagsX[i] = true;
	}//for end
	for(let i = 0; i < flagsY.length; i++){
		flagsY[i] = true;
	}//for end
	for(let i = 0; i < flagsZ.length; i++){
		flagsZ[i] = true;
	}//for end
	
	//모든 class="on" 제거
	$("input").removeClass("on");
	
	//<div id="panel">안에 비우기
	$("#panel").empty();
	$("#addedSeat").empty();
	
	//좌석수 계산 초기화
	countSeats();
}//reSelectFN()






</script>