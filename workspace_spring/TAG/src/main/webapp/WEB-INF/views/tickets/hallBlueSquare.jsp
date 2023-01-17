<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://kit.fontawesome.com/698fcd5feb.js" crossorigin="anonymous"></script>



<style>

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
}

.stageBar b{
	font-size:28px;
	color:gray;
}

.consoleBar {
	height:160px;
	width:220px;
	background: lightgrey;
	text-align:center;
	padding: auto;
	margin-left:63px;
	margin-right:64px;
}

.consoleBar b{
	font-size:28px;
	color:gray;
}


.blank1FBar {
	height:200px;
	width:500px;
	background: lightgrey;
	text-align:center;
	padding: auto;
	margin-top:20px;
}

.blank1FBar b{
	font-size:24px;
	color:gray;
}


#rseatV {
	display: inline-block; 
	margin-left:15px;  
	margin-right:40px;  
	margin-top:20px;
}

#rseatV table{
	margin-right:0;
	margin-left:85%;
}



#rseatW{
	display: inline-block; margin-left:40px;  margin-top:20px;
}

#rseatX {
	display: inline-block; margin-left:120px;  margin-top:20px;
}

#rseatY {
	display: inline-block;
}

#rseatZ {
	display: inline-block;
}




</style>






<div id="map1Fjsp">
	<!-- <h2>좌석선택-가격할인-배송현장수령</h2> -->
	<div class="barBtn">
	    <button type="button" class="btn bar3">수령방법</button>
	    <button type="button" class="btn bar2">할인선택</button>
	    <button type="button" class="btn bar1">좌석선택</button>
	</div>
	<br>
	<h5 style="margin-bottom:0;">스탠딩 1층</h5>
	<p>스탠딩은 실제 좌석과 다르며 예매시 지정하는 번호가 입장 번호 순서입니다. 빠른 번호를 예매 할수록 입장 순서가 빨라집니다.</p>
	
	<div class="stageBar">
		<b>STAGE</b>
	</div>
	<div style="display:block;">
	<div id="standA" style="display: inline-block; margin-right:40px; margin-top:20px;">
		<h6>스탠딩 A구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatA" begin="1" end="495" step="1">
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
			<c:forEach var="seatB" begin="1" end="495" step="1">
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
	<div id="standC" style="display: inline-block; --margin-right:40px; margin-top:20px;">
		<h6>스탠딩 C구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatC" begin="1" end="200" step="1">
				<td>
					<input type="button" id=btnC${seatC} name=btnC${seatC} value="${seatC}" onclick="standAdd(this, 'C', ${seatC})">
				</td>
				<c:if test="${seatC mod 20 == 0}">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
	<div class="consoleBar" style="display:inline-block;">
		<b>CONSOLE</b>
	</div>
	<div id="standD" style="display: inline-block; margin-right:40px; margin-top:20px;">
		<h6>스탠딩 D구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<c:forEach var="seatD" begin="1" end="200" step="1">
				<td>
					<input type="button" id=btnD${seatD} name=btnD${seatD} value="${seatD}" onclick="standAdd(this, 'D', ${seatD})">
				</td>
				<c:if test="${seatD mod 20 == 0}">
					<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</div>
</div><!-- map1Fjsp end -->

<div id="map2Fjsp">
	<div class="barBtn">
	    <button type="button" class="btn bar3">수령방법</button>
	    <button type="button" class="btn bar2">할인선택</button>
	    <button type="button" class="btn bar1">좌석선택</button>
	</div>
	<br>
	<h5 style="margin-bottom:0;">지정석 2층</h5>
	<p>객석 2층은 지정좌석제입니다.</p>
	
	<div class="stageBar">
		<b>STAGE</b>
	</div>
	<div style="display:block;">
	<div id="rseatV">
		<h6>지정좌석 V구역</h6>
		<table style="border-spacing: 0;">
			<!-- "seatV" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatV" value="0"/>
			<c:forEach var="r" begin="1" end="6" step="1">
			<tr>
				<c:forEach var="c" begin="1" end="1" step="1">
					<td>
						<c:set var="seatV" value="${seatV+1}"/>
						<input type="button" id=btnV${seatV} name=btnV${seatV} value="${seatV}" onclick="rseatAdd(this, 'V', ${r}, ${seatV})">
					</td>
				</c:forEach><!-- c end -->
			</tr>
			</c:forEach><!-- r end -->
		</table>
	</div><!-- id="rseatV" end -->
	
	<div class="blank1FBar" style="display:inline-block;">
		<b>아래층 스탠딩 구역</b>
	</div>
	
	<div id="rseatW">
		<h6>지정좌석 W구역</h6>
		<table style="border-spacing: 0;">
			<!-- "seatV" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatW" value="0"/>
			<c:forEach var="r" begin="1" end="6" step="1">
			<tr>
				<c:forEach var="c" begin="1" end="1" step="1">
					<td>
						<c:set var="seatW" value="${seatW+1}"/>
						<input type="button" id=btnW${seatW} name=btnW${seatW} value="${seatW}" onclick="rseatAdd(this, 'W', ${r}, ${seatW})">
					</td>
				</c:forEach><!-- c end -->
			</tr>
			</c:forEach><!-- r end -->
		</table>
	</div><!-- id="rseatW" end -->
	</div>
	<div id="rseatX">
		<h6>지정좌석 X구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<!-- X구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullX" value="<%=new int[] {0,0,0,1,1,1,1,2,6} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatX" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullX)}" step="1">
				<c:forEach var="nullXtd" begin="1" end="${nullX[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullX end -->
				<c:forEach var="c" begin="1" end="${12-nullX[r-1]+1}" step="1">
					<td>
						<c:if test="${c <= (12-nullX[r-1])}">
							<!-- ${seatX} 1씩 늘어나게하기 -->
							<c:set var="seatX" value="${seatX+1}"/>
							<input type="button" id=btnX${seatX} name=btnX${seatX} value="${c}" onclick="rseatAdd(this, 'X', ${r}, ${seatX})">
						</c:if>
						<c:if test="${c == (12-nullX[r-1]+1)}">
							<button disabled>${r}</button>
							<tr></tr>
						</c:if>
					</td>
				</c:forEach><!-- c end -->
			</c:forEach><!-- r end -->
			</tr>
		</table>
	</div><!-- id="rseatX" end -->
	<div id="rseatY">
		<h6>지정좌석 Y구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Y구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullYL"   value="<%=new int[] {3,2,2,2,1,1,1,0,0} %>"/><!-- Left -->
			<c:set var="nullYR"   value="<%=new int[] {2,2,1,1,1,1,0,0,0} %>"/><!-- Right -->
			<c:set var="nullYAll"   value="<%=new int[] {5,4,3,3,2,2,1,0,0} %>"/><!-- L+R -->
			<!-- "seatY" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatY" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullYL)}" step="1">
				<c:forEach var="nullYLtd" begin="1" end="${nullYL[r-1]}" step="1">
					<td></td>
				</c:forEach><!-- nullYL end -->
				<c:forEach var="c" begin="1" end="${22-nullYAll[r-1]}" step="1">
					<c:choose><%-- if else문 --%>
						<c:when test="${r == 9 && c <= 4}"><!-- 9열 4번째 좌석까지 생성 -->
							<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 9 && c >= 10}"><!-- 9열 10번째 좌석부터 생성 -->
					    	<td>
								<c:set var="seatY" value="${seatY+1}"/>
								<input type="button" id=btnY${seatY} name=btnY${seatY} value="${c-4}" onclick="rseatAdd(this, 'Y', ${r}, ${seatY})">
							</td>
						</c:when>
						<c:when test="${r == 9 && c > 4 && c < 10}"><!-- 9열 빈 좌석 생성 -->
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
	<div id="rseatZ">
		<h6>지정좌석 Z구역</h6>
		<table style="border-spacing: 0;">
			<tr>
			<!-- Z구역 행마다 들어가는 빈공간 배열 선언 -->
			<c:set var="nullZ" value="<%=new int[] {0,0,0,1,1,1,1,2,2} %>"/>
			<!-- "seatX" 좌석의 고유번호(flags의 갯수와 일치) -->
			<c:set var="seatZ" value="0"/>
			
			<c:forEach var="r" begin="1" end="${fn:length(nullZ)}" step="1">
				<c:forEach var="c" begin="1" end="${12-nullZ[r-1]}" step="1">
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
var flagsA = new Array(496); //좌석tb의 좌석개수+1 (배열[0]번째는 쓰지않는다)
var flagsB = new Array(496);
var flagsC = new Array(201);
var flagsD = new Array(201);
var flagsV = new Array(7);
var flagsW = new Array(7);
var flagsX = new Array(97);
var flagsY = new Array(174);
var flagsZ = new Array(101);

//flags 초기 설정
//A구역
for(let i = 0; i < flagsA.length; i++){
	flagsA[i] = true;
}//for end
//B구역
for(let i = 0; i < flagsB.length; i++){
	flagsB[i] = true;
}//for end
//C구역
for(let i = 0; i < flagsC.length; i++){
	flagsC[i] = true;
}//for end
//D구역
for(let i = 0; i < flagsD.length; i++){
	flagsD[i] = true;
}//for end
//V구역
for(let i = 0; i < flagsV.length; i++){
	flagsV[i] = true;
}//for end
//W구역
for(let i = 0; i < flagsW.length; i++){
	flagsW[i] = true;
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

//C,D구역 전체 S등급
for(let i = 1; i < flagsC.length; i++){ 
	//css 등급별 색깔 적용
	$("#btnC"+i).addClass("StandingR");
	$("#btnD"+i).addClass("StandingR");
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsC[i]){//false이면
		$("#btnC"+i).addClass("on");
	}//if end
	if(!flagsD[i]){//false이면
		$("#btnD"+i).addClass("on");
	}//if end
}//for end

//V,W구역 전체 R등급
for(let i = 1; i < flagsV.length; i++){ 
	//css 등급별 색깔 적용
	$("#btnV"+i).addClass("R");
	$("#btnW"+i).addClass("R");
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsV[i]){//false이면
		$("#btnV"+i).addClass("on");
	}//if end
	if(!flagsW[i]){//false이면
		$("#btnW"+i).addClass("on");
	}//if end
}//for end

//X구역 R등급, S등급, A등급
for(let i = 1; i < flagsX.length; i++){ 
	if(i <= 24){
		$("#btnX"+i).addClass("R");
		//$("#btnX"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 24 && i <= 69){
		$("#btnX"+i).addClass("S");
		//$("#btnX"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 69){
		$("#btnX"+i).addClass("A");
		//$("#btnX"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsX[i]){//false이면
		$("#btnX"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsY.length; i++){ //Y구역 R등급, S등급, A등급
	if(i <= 35){
		$("#btnY"+i).addClass("R");
		//$("#btnY"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 35 && i <= 134){
		$("#btnY"+i).addClass("S");
		//$("#btnY"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 134){
		$("#btnY"+i).addClass("A");
		//$("#btnY"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end
	
	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsY[i]){//false이면
		$("#btnY"+i).addClass("on");
	}//if end
}//for end
for(let i = 1; i < flagsZ.length; i++){ //Z구역 R등급, S등급, A등급
	if(i <= 24){
		$("#btnZ"+i).addClass("R");
		//$("#btnZ"+i)[0].style.background = "mediumslateblue"; //R등급 보라색
	}else if(i > 24 && i <= 80){
		$("#btnZ"+i).addClass("S");
		//$("#btnZ"+i)[0].style.background = "dodgerblue"; //S등급 청회색
	}else if(i > 80){
		$("#btnZ"+i).addClass("A");
		//$("#btnZ"+i)[0].style.background = "darkcyan"; //A등급 민트
	}//if end

	//flag=false인 버튼에 class=on을 추가하기
	if(!flagsZ[i]){//false이면
		$("#btnZ"+i).addClass("on");
	}//if end
}//for end

//스탠딩 좌석 추가와 삭제
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
		case "C" : 
			if(flagsC[flagNum]){ //좌석을 선택할 때
				flagsC[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsC[flagNum]=true; swt=false; break;
			}//if end
		case "D" : 
			if(flagsD[flagNum]){ //좌석을 선택할 때
				flagsD[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsD[flagNum]=true; swt=false; break;
			}//if end
		default :
			alert("배정된 구역 없음!"); break;
	}//switch end
	
	if(swt){ //좌석을 선택할 때
		let input="";
		input += "<input type='text' class='input";
		input += 									section+flagNum;
		input += 	"' readonly value='";
		input += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
		input += "'>";
		$("#btn"+section+flagNum).addClass("on"); //#btnA+seatNo에 class="on" 추가
		$("#panel").append(input); //<div id="panel">안에 <input class=input+section+flagNum></input> 생성
		$("#panel").scrollTop($("#seatAddFormjsp").height());
		
		let input2="";
		input2 += "<input type='text' class='input";
		input2 += 									section+flagNum;
		input2 += 	"' name='cseat' readonly value='";
		input2 += "R석 1층-스탠딩"+section+"구역 입장번호-"+snum;
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
		$("input").remove(".input"+section+flagNum); //<input class=input+section+flagNum></input> 제거
		countSeats(); //좌석수 계산하기
	}//if end
}//standAdd() end




//지정좌석 추가와 삭제
function rseatAdd(SeatNum, section, row, flagNum){ //좌석번호, 구역이름, 열이름, 버튼고유번호
	var snum=$(SeatNum).val(); //number 좌석번호
	var swt=false; //switch flag=on/off 해주는 불린값
	var grade=$(SeatNum).attr('class'); //좌석등급을 클래스명으로 가져옴
	
	switch (section){
		case "V" : 
			if(flagsV[flagNum]){ //좌석을 선택할 때
				flagsV[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsV[flagNum]=true; swt=false; break;
			}//if end
		case "W" : 
			if(flagsW[flagNum]){ //좌석을 선택할 때
				flagsW[flagNum]=false; swt=true; break;
			}else{ //좌석선택을 해제할 때
				flagsW[flagNum]=true; swt=false; break;
			}//if end	
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
	for(let i = 0; i < flagsC.length; i++){
		flagsC[i] = true;
	}//for end
	for(let i = 0; i < flagsD.length; i++){
		flagsD[i] = true;
	}//for end
	for(let i = 0; i < flagsV.length; i++){
		flagsV[i] = true;
	}//for end
	for(let i = 0; i < flagsW.length; i++){
		flagsW[i] = true;
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