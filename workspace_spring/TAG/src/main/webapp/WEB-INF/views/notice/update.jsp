<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<%@ include file="ssi.jsp" %>

<style>
   .dropdown-toggle:after {
       display: none;
       margin-left: 0.255em;
       vertical-align: 0.255em;
       content: "";
       border-top: 0.3em solid;
       border-right: 0.3em solid transparent;
       border-bottom: 0;
       border-left: 0.3em solid transparent;
   }
</style>


<script>
	function notice_updateProc(){
		if(confirm("수정하시겠습니까?")){
			document.form1.action="/notice/updateProc";
			document.form1.submit();
		}//if end
	}//notice_update() end
</script>

<script>
	$(document).ready(function(){
		$(".headNotice").addClass("active");//헤더 공지사항 아래 밑줄
	});//ready() end
</script>


<!-- 본문 시작 -->


<h3 style="text-align: center;">수정하기</h3>
<br>

<div class="container">
	<p>
		<button type="button" onclick="location.href='/notice/list'">목록</button>
	</p>
	<form name="form1" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th class="info">작성일</th>
			<td>${notice.regdate}</td>
		</tr>
		<tr>
			<th class="info">제목</th>
			<td><input type="text" name="subject" value="${notice.subject}"></td>
		</tr>
		<tr>
			<th class="info">작성자</th>
			<td>관리자</td>
		</tr>
		<tr>
			<th class="info">내용</th>
			<td>
		    	<textarea id="summernote" name="edit">${notice.edit}</textarea> 
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="hidden" name="n_no" value="${notice.n_no}">
				<input type="submit" value="수정" onclick="notice_updateProc()">
			</td>
		</tr>
	</table>
	</form>
</div>

<!-- 본문 끝 -->

<script>
     // summernote
      $('#summernote').summernote({
        //placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 500,
        focus: true,
        toolbar: [
          // [groupName, [list of button]]
          ['fontname', ['fontname']],
          ['fontsize', ['fontsize']],
          ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
          ['color', ['forecolor','color']],
          ['table', ['table']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['height', ['height']],
          ['view',['codeview']]
        ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
      lang: "ko-KR",
   	  disableDragAndDrop:true
   });//end
   
</script>

<%@ include file="../footer.jsp" %>