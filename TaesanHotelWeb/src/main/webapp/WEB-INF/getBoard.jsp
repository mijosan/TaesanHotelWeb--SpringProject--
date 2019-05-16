<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>${board.title}</title>
	<style>
		.co{
			color:blue;
		}
	</style>
</head>
<body>
<%@include file="nav.jsp" %>
<form id="insertBoardFrm" action="updateBoard.do" method="post" enctype="multipart/form-data"> <!--update.do 에서 MultipartFile로 받을려면 이렇게 설정해줘야한다.-->
	<div class="container">
		<table class="table table-hover" style="margin-bottom: 430px;">
			<tr>
				<th colspan="2">
					${board.title }
				</th>
			</tr>
			<tr>
				<td>
					${board.writer} ｜${board.regDate }
				</td>
				<td class="text-right">
					조회 ${board.cnt} ｜ 댓글 208
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${board.content}
				</td>
			</tr>
			<tr>
				<td>
					첨부파일
				</td>
				<td class="text-right">
					<a href="download.do?originalFileName=${board.originalFileName}">${board.fileName}(<span class="co">${board.fileSize}</span>)</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-default pull-left" value="목록" onclick="history.back()">
					<input type="button" class="btn btn-default pull-left" value="답글" onclick="goForm2()">
					
				</td>
				<td>
					<input type="button" class="btn btn-default pull-right" value="삭제" onclick="location.href='deleteBoard.do?seq=${board.seq}&writer=${board.writer}'">
					<input type="button" class="btn btn-default pull-right" value="수정" onclick="goForm()">
					<%-- <input type="button" class="btn btn-default pull-right" value="수정" onclick="location.href='updateBoard.do?seq=${board.seq}&writer=${board.writer}'"> --%>
				</td>		
			</tr>

		</table>
	</div>
	
	<!--수정버튼을 눌렀을때 가져가야 할 값들 글번호랑 작성자(수정할려는 ID와 글쓴ID 비교하기위하여 들고감)-->
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="writer" value="${board.writer}">
	
	<!--답글을 쓰기위해 가져가는 값-->
	<input type="hidden" name="originNo" value="${board.originNo}">
	<input type="hidden" name="groupOrd" value="${board.groupOrd}">
	<input type="hidden" name="groupLayer" value="${board.groupLayer}">
	<input type="hidden" name="ck" value="responseWrite">
	
</form>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	function goForm(){ //수정 버튼
		var insertBoardFrm = document.getElementById('insertBoardFrm');
		insertBoardFrm.submit();
	}
	function goForm2(){ //답글 버튼(action을 다르게하기 위해 사용)
		var responseWrite = document.getElementById('insertBoardFrm');
		responseWrite.action = "writeCheck.do";
		responseWrite.submit();
	}
    $(function(){
        var responseMessage = "<c:out value="${message}" />";
        if(responseMessage != ""){
            alert(responseMessage)
        }
    }) 
	</script>

<%@include file="footer.jsp" %>
</body>
</html>