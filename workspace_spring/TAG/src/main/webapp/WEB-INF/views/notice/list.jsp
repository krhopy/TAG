<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<style>
	.info th:nth-child(1) { width: 10%; text-align: center; }
	.info th:nth-child(2) { text-align: center; }
	.info th:nth-child(3) { text-align: center; width: 15%; }
	.info th:nth-child(4) { text-align: center; width: 15%; }
	#no { text-align: center; }
	#mst { text-align: center; }
	#rdate { text-align: center; }
	a {color: black;}
</style>

<script>
	$(document).ready(function(){
		$(".headNotice").addClass("active");//헤더 공지사항 아래 밑줄
	});//ready() end
</script>

<!-- 본문 시작 -->

<br>
<h3 style="text-align: center;">공지사항</h3>

<div class="container">
	<p>
		<c:if test="${mem_grade=='M'}">
			<button class="btn btn-outline-black btn-sm" onclick="location.href='/write'" style="width: 80px; padding: 2px 2px 2px 2px; font-weight: 400; font-size: 14px; display: block;">글쓰기</button>
		</c:if>
	</p>
	<p align="right">총 ${total}개의 글</p>
	<table class="table table-hover">
		<tr class="info" style="border-top: 3px solid black; border-bottom: 0.1px solid black; text-align: center; font-size: 14px;">
			<th>글 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<!-- varStatus="상태용 변수" -->
		<c:forEach var="row" items="${list}" varStatus="vs">
		<tr class="second">
			<td id="no">${row.n_no}</td>
			<td id="sub">
				<a href="detail/${row.n_no}">${row.subject}</a>
			</td>
			<td id="mst">관리자</td>
			<td id="rdate">${row.regdate}</td>
		</tr>
		</c:forEach>
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
	
				<!-- startPage는 1, 11, 21 .. 이기에 1보다 크다면 이전 페이지 이동 가능-->
				<c:if test="${startPage > 1}">
					<a href="/notice/list?pageNum=${startPage-1}">[이전]</a>
				</c:if>
	
				<!-- 현재 페이지 볼드체, 현재 페이지 외의 보이는 페이지 전부 이동 링크 걸기 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<c:choose>
						<c:when test="${pageNum == i}">
							<span style="font-weight: bold">${i}</span>
						</c:when>
						<c:when test="${pageNum != i}">
							<a href="/notice/list?pageNum=${i}">${i}</a>
						</c:when>
					</c:choose>
				</c:forEach>
	
				<!-- endPage보다 총 페이지 수가 크다면 다음 pages로 이동 가능하다 -->
				<c:if test="${endPage < pageCount}">
					<a href="/notice/list?pageNum=${startPage+5}">[다음]</a>
				</c:if>
		</c:if>
	</div><!-- 페이징 끝 -->
	
</div><!-- container1 end -->

<%-- 
<hr>
총 ${cnt}개의 글
<hr>
 --%>

<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>