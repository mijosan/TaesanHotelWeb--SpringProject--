<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>${board.title}</title>

</head>
<body>
<%@include file="nav.jsp" %>
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
					<a href="download.do?originalFileName=${board.originalFileName}">${board.fileName}</a>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" class="btn btn-default pull-left" value="목록" onclick="history.back()">
				</td>
				<td>
					<input type="button" class="btn btn-default pull-right" value="글삭제" onclick="location.href='deleteBoard.do?seq=${board.seq}&writer=${board.writer}'">
				</td>		
			</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
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