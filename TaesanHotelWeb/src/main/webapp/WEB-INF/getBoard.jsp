<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<table class="table table-hover">
			<tr>
				<th colspan="2">
					${board.title}
				</th>
			</tr>
			<tr>
				<td>
					${board.writer} ｜${board.regDate }
				</td>
				<td class="text-right">
					조회 ${board.cnt} ｜ 댓글 <span class="c_cnt"></span>
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
			
			<!--댓글 작성-->
			<tr>
				<td colspan="2">
					<strong>Comments</strong>&nbsp;<span class="c_cnt"></span>
				</td>
			</tr>
			<c:if test="${sessionScope.user !=null }">
			<tr>
				<td style="width: 100%" colspan="2">
                    <textarea style="width: 100%" rows="3" cols="30" id="commentArea" name="commentArea" placeholder="댓글을 입력하세요"></textarea>
                	<input type="button" class="btn pull-right btn-success" value="등록" id="commentBtn">
                </td>
			</tr>
			</c:if>
			
			<!--댓글 창-->
		</table>
		<div id="commentList">
		
		</div>
	</div>
	
	<!--수정버튼을 눌렀을때 가져가야 할 값들 글번호랑 작성자(수정할려는 ID와 글쓴ID 비교하기위하여 들고감)-->
	<input type="hidden" name="seq" value="${board.seq}">
	<input type="hidden" name="writer" value="${board.writer}">
	
	<!--답글을 쓰기위해 가져가는 값-->
	<input type="hidden" name="originNo" value="${board.originNo}">
	<input type="hidden" name="groupOrd" value="${board.groupOrd+1}">
	<input type="hidden" name="groupLayer" value="${board.groupLayer+1}">
	<input type="hidden" name="ck" value="responseWrite">
	
</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	$(document).ready(function(){
		listReply();
		//댓글 쓰기
		$("#commentBtn").click(function(){
			comment();
			listReply();
		});
		
	});
	
	//댓글 삭제
	$(document).on('click', "#deleteComment", function(){
		if(confirm("정말 삭제 하시겠습니까 ?") == true){
			var c_seq = $(this).attr("alt");
			var param = {"c_seq":c_seq};
			$.ajax({
	        	type : 'post',
	        	url : 'deleteComment.do',
	        	data: JSON.stringify(param),//JSON 문자열 형식으로 바꿈
	        	contentType : "application/json",
	        	dataType : "json",
	        	 success : function(result){
	        		if(result == "success"){
	        		 	alert("댓글이 삭제 되었습니다.");
	        		 	listReply();
	        		}else{
	        			alert("댓글이 삭제되지 않았습니다.");
	        		}
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		alert("댓글이 삭제되지 않았습니다");
	        	}
	        	
	        });
	    }
	    else{
	        return ;
	    }
	});
	
	//댓글 수정
	$(document).on('click', "#updateComment", function(){
		if(confirm("정말 수정 하시겠습니까 ?") == true){
	        
	    }
	    else{
	        return ;
	    }
	});
		
 /*
 * 댓글 등록하기(Ajax)
 */
function comment(){
    var c_content=$("#commentArea").val();
    var b_seq="${board.seq}";
    var param = {"c_content": c_content,"b_seq":b_seq};//json 형식

    $.ajax({
        type:'POST',
        url : "commentInsert.do",
        data: JSON.stringify(param),//JSON 문자열 형식으로 바꿈
        contentType : "application/json", //서버에 데이터를 보낼때
        success : function(data){
           alert("댓글이 등록 되었습니다.");
           listReply();
        },
        error:function(request,status,error){
        	alert("댓글이 등록되지 않았습니다.");
       }
        
    });
}

function listReply(){
	$.ajax({
		type:'get',
		url: "commentList.do?b_seq=${board.seq}",
	    contentType : "application/json",
	    dataType: "json", // 서버에서 리턴해주는 데이터 유형
	    success : function(result){
	    	$(".c_cnt").html(result[0].c_cnt);
	        var output="<table class='table table-hover'>";
	        for(var i in result){
	        	console.log(result);
	        	//줄바꿈 처리 + 띄어쓰기
	        	var comment = result[i].c_content;
	        	comment = comment.replace(/\n/gi,"<br>");
	        	comment = comment.replace(/  /gi,"&nbsp;&nbsp;");
	        	
	        	output += "<tr>";
	        	output += "<td class='col-md-2'>"+"<mark>"+result[i].c_writer+"</mark>";
	        	output += "<td class='col-md-9'>"+comment+"<br><small>"+result[i].c_regdate+"</small><img src='./resources/images/replyIcon.png'></td>";
	        	output += "<td class='col-md-3'><img src='./resources/images/pen.png' id='updateComment'>&nbsp;<img src='./resources/images/trash.png' id='deleteComment' alt='"+result[i].c_seq+"'></td>";
	        	output += "</tr>";	
	        }
	        output +="</table>";
	        $("#commentList").html(output);
	    },
	    error:function(request,status,error){
	        alert("댓글을 불러올수 없습니다.");
	    }
	});
} 

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