<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<html>
<head>
<meta charset="EUC-KR">
<title>${board.title}</title>
	<style>
		.co{
			color:blue;
		}
	/*좋아요 애니메이션*/
.heart {
  cursor: pointer;
  height: 50px;
  width: 50px;
  background-image:url( 'https://abs.twimg.com/a/1446542199/img/t1/web_heart_animation.png');
  background-position: left;
  background-repeat:no-repeat;
  background-size:2900%;
}

.heart:hover {
  background-position:right;
}

.is_animating {
  animation: heart-burst .8s steps(28) 1;
}

@keyframes heart-burst {
  from {background-position:left;}
  to { background-position:right;}
}
	</style>
	  <meta property="og:url"           content="http://121.158.221.161:8080/TaesanHotelWeb/getBoard.do?seq=${board.seq}&message=success" />
	  <meta property="og:type"          content="website" />
	  <meta property="og:title"         content="${board.title}" />
	  <meta property="og:description"   content="게시판 글 내용입니다." />
	  <meta property="og:image"         content="https://www.shillahotels.com/images/upload/spofrpack/170508/FILEca0f21da22966b1f.jpg" />
</head>
<body>
<%@include file="nav.jsp" %>
<form id="insertBoardFrm" action="updateBoard.do" method="post" enctype="multipart/form-data"> <!--update.do 에서 MultipartFile로 받을려면 이렇게 설정해줘야한다.-->
	<div class="container">
		<table class="table table table-striped table-hover">
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
					조회 ${board.cnt} ｜ 댓글 <span class="c_cnt"></span> ｜ <img src="./resources/images/heart.PNG"> <span class="likeCnt">${likeCnt}</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					${board.content}
				</td>
			</tr>
			<tr>
				<th>
					첨부파일
				</th>
				<td class="text-right">
					<c:if test="${board.originalFileName !=null}">
						<a onclick="downloadFun()">${board.fileName}(<span class="co">${board.fileSize}</span>)</a>
					</c:if>
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
			<tr>
				<th style="vertical-align: middle;">
					좋아요
				</th>
				<td style="text-align:right;">
					<div class="heart" style="float: right;" align="right"></div>
				</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">
					공유하기
				</th>
				<td class="text-right" style="cursor:pointer">
					<!-- <img src="./resources/images/facebook.PNG"  id="facebookShare"> -->
					  <div class="fb-share-button" data-href="http://121.158.221.161:8080/TaesanHotelWeb/getBoard.do?seq=${board.seq}&message=success" data-layout="button_count" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">공유하기</a></div>
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
                    <textarea class="form-control" style="width: 100%" rows="3" cols="30" id="commentArea" name="commentArea" placeholder="댓글을 입력하세요"></textarea>
                	<input type="button" class="btn pull-right btn-success" value="등록" id="commentBtn" onclick="comment('cm1')">
                </td>
			</tr>
			</c:if>
			
		<!--댓글 창-->
		</table>
		<div id="commentList" style="margin-bottom: 390px;">

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
	
	<input type="hidden" id="boardId" value="${board.writer}">
	
	<!--다운로드 값-->
	<input type="hidden" name="originalFileName" value="${board.originalFileName}">
	
</form>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<!-- 페이스북 공유 -->
	<script>
	(function(d, s, id) {
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) return;
	    js = d.createElement(s); js.id = id;
	    js.src = "https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v3.0";
	    fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));

	</script>

	<script>
	var userID;
	var flag;
	
	$(document).ready(function(){
		listReply();
		getSession(); //현재 접속한 로그인 세션정보를 가져옴
	});
	/*좋아요 기능 처리*/
	$(".heart").on('click touchstart', function(){
		  $(this).toggleClass('is_animating');

		 	$.ajax({
			    type : 'post',
	        	url : 'updateLike.do',
	        	data: JSON.stringify({"b_seq":${board.seq},"id":userID}),//JSON 문자열 형식으로 바꿈
	        	contentType : "application/json", //서버에서 데이터를 보낼때
	        	dataType : "json", //서버에서 데이터를 받을때
	        	 success : function(result){
	        		if(result.result == "up"){
	        		 	/*동적으로 좋아요 수바꿔야함*/
	        		 	swal("추천 등록되었습니다.", "", "success");
	        		 	$(".likeCnt").html(result.likeCnt);
	        		}else if(result.result == "down"){
	        			/*동적으로 좋아요 수바꿔야함*/
	        			swal("추천이 취소되었습니다.", "", "error");
	        			$(".likeCnt").html(result.likeCnt);
	        		}else if(result.result == "login"){
	        			/*로그인을 하지 않았을때*/
	        			$(location).attr("href","loginForm.jsp");
	        		}
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		swal("추천이 등록되지 않았습니다.", "", "error");
	        	}
		  });
		});

		/*when the animation is over, remove the class*/
		$(".heart").on('animationend', function(){
		  $(this).toggleClass('is_animating');
		});
		
	function downloadFun(){
		$("#insertBoardFrm").attr("action","download.do");
		$("#insertBoardFrm").submit();
	}
	
	function getSession(){
		$.ajax({
			url : "getSession.do",
			contentType : "json",
			success : function(result){
				if(result != null){
					userID = result.id;
				}else{
					alert("세션 을 불러오지 못했습니다.");
				}
			},
			error : function(request,status,error){
        		alert("세션 을 불러오지 못했습니다.[error]");
        	}
		})
	}
	//댓글 삭제
	$(document).on('click', "#deleteComment", function(){
		if(confirm("정말 삭제 하시겠습니까 ?") == true){
			var c_writer = $(this).attr("alt").split(':');

			var param = {"c_seq":c_writer[0],"c_writer":c_writer[1]};
			$.ajax({
	        	type : 'post',
	        	url : 'deleteComment.do',
	        	data: JSON.stringify(param),//JSON 문자열 형식으로 바꿈
	        	contentType : "application/json", //서버에 데이터를 보낼때
	        	dataType : "json", //서버에서 데이터를 받을때
	        	 success : function(result){
	        		if(result == "success"){
	        			swal("댓글이 삭제 되었습니다.", "", "success");
	        		 	listReply();
	        		}else if(result == "fail1"){
	        			swal("로그인이 필요합니다.", "", "error");
	        			$(location).attr("href","loginForm.jsp");
	        		}else{
	        			swal("삭제할 권한이 없습니다.", "", "error");
	        		}
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		swal("댓글이 삭제되지 않았습니다.", "", "error");
	        	}
	        	
	        });
	    }
	    else{
	        return ;
	    }
	});
	//대댓글
	function replyComment(replyParam){
		
		var replyParam = replyParam + ":cm2";
		
		if(userID != null){

				$(".rm").remove(); //그전에 생긴 대댓글 창 제거 

				var output  = "<tr class='rm'>";
					output += 	"<td>&nbsp;&nbsp;&nbsp;└─<mark>"+userID+"</mark></td>";
					output += 	"<td style='width: 100%' colspan='2'>"
					output += 		"<textarea style='width: 100%' rows='3' cols='30' id='replyComment2' placeholder='댓글을 입력하세요'></textarea>"
					output += 		"<input type='button' class='btn pull-right btn-success' value='등록' onclick='comment(\""+replyParam+"\")'>"
					output +=	"</td>"
					output += "</tr>";
					
				$("#"+replyParam.split(':')[0]).after(output);
				

		}else{
			swal("로그인이 필요합니다.", "", "error");
			$(location).attr("href","loginForm.jsp");
		}
		
	}
	 /*
	 * 댓글 등록하기(Ajax)
	 */
	function comment(replyParam){
	    var c_content;
	    var param;
	    var b_seq="${board.seq}";

	    if(replyParam != "cm1"){ //대댓글
	    	c_content = $("#replyComment2").val();
	    	var originNo = replyParam.split(':')[3];
		    var groupOrd = replyParam.split(':')[1];
		    var groupLayer = replyParam.split(':')[2];
		    var cm = replyParam.split(':')[4];
		    param = {"c_content": c_content,"b_seq":b_seq,"originNo":originNo,"groupOrd":groupOrd,"groupLayer":groupLayer,"cm":cm};//json 형식
	    }else{ //댓글
	    	c_content = $("#commentArea").val().replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	    	param = {"c_content": c_content,"b_seq":b_seq,"cm":replyParam};//json 형식
	    }

	    $.ajax({
	        type:'POST',
	        url : "commentInsert.do",
	        data: JSON.stringify(param),//JSON 문자열 형식으로 바꿈
	        contentType : "application/json", //서버에 데이터를 보낼때
	        success : function(data){
	        	swal("댓글이 등록되었습니다.", "", "success");
	           $("#commentArea").val(""); //댓글 등록후 초기화 처리
	           listReply();
	           
	        },
	        error:function(request,status,error){
	        	swal("댓글이 등록되지 않았습니다.", "", "error");
	       }
	        
	    });
	}
	//댓글 수정
	function updateComment(param){
		if(confirm("정말 수정 하시겠습니까 ?") == true){
		var c_seq = param.split(':')[0];
		var comment = param.split(':')[1]; 
		var c_writer = param.split(':')[2];
		var param2 = c_seq +":"+ c_writer;
		
		//띄어쓰기, 줄바꿈 변환 (태그->적용)
		comment = comment.replace(/<br>/gi,"\r\n");
	    comment = comment.replace(/\u0020/gi," ");

		var	output  = "<tr>"; //수정폼으로 만들때 위치를 찾을려고 ID등록했음
        	output += "<td class='col-md-2'>"+"<mark>"+c_writer+"</mark></td>";
        	output += "<td class='col-md-9'> <textarea id='cTextarea' style='width:100%'>"+comment+"</textarea></td>";
        	output += "<td class='col-md-2'><a onclick='updateComment2(\""+param2+"\")'>수정</a><br><a onClick='listReply()'>취소</a></td>"
        	output += "</tr>";
		    $("#"+c_seq).replaceWith(output);
	    }
	    else{
	        return ;
	    }
	}
	
	function updateComment2(param){
		var c_seq = param.split(':')[0]; //수정할 댓글번호
		var c_writer = param.split(':')[1];
		var c_content = $("#cTextarea").val(); //수정할 댓글내용
		var param2 = {"c_seq":c_seq,"c_content":c_content,"c_writer":c_writer};

		$.ajax({
			type : 'post',
			url : "updateComment.do",
			contentType : "application/json",
			data : JSON.stringify(param2),
			dataType : "json",
			success : function(result){
        		if(result == "success"){
        			swal("댓글이 수정되었습니다.", "", "success");
        		 	listReply();
        		}else if(result == "fail1"){
        			swal("로그인이 필요합니다.", "", "error");
        			$(location).attr("href","loginForm.jsp");
        		}else{
        			swal("수정할 권한이없습니다.", "", "error");
        		}
        	},
        	error : function(request,status,error){
        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
        		swal("댓글이 수정되지 않았습니다", "", "error");
        	}
		});
	}
	

//댓글 불러오기
function listReply(){
	$.ajax({
		type:'get',
		url: "commentList.do?b_seq=${board.seq}",
	    contentType : "application/json",
	    dataType: "json", // 서버에서 리턴해주는 데이터 유형
	    success : function(result){
	    	if(result == ""){
	    		$("#commentList").html("등록된 댓글이 없습니다.");
	    	}
	    	$(".c_cnt").html(result[0].c_cnt);
	        var output="<table class='table table-hover'>";
	        for(var i in result){
	        	//댓글 깊이 공백 만들기
	        	var re = "";
	  			for(var j=0;j<result[i].groupLayer;j++) {
	  				re = re + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	  			}
				
	        	//줄바꿈 처리 + 띄어쓰기
	        	var comment = result[i].c_content;
	        	comment = comment.replace(/\n/gi,"<br>");
	        	comment = comment.replace(/  /gi,"&nbsp;&nbsp;");
	        	
	        	var param = result[i].c_seq+":"+comment+":"+result[i].c_writer;
	        	var replyParam = result[i].c_seq+":"+result[i].groupOrd+":"+result[i].groupLayer+":"+result[i].originNo;
	        	
	        	if($("#boardId").val() == result[i].c_writer){//작성자의 댓글에 색을넣음
	        		output += "<tr id='"+result[i].c_seq+"' class='success'>"; //수정폼으로 만들때 위치를 찾을려고 ID등록했음
	        	}else{
	        		output += "<tr id='"+result[i].c_seq+"'>"; //수정폼으로 만들때 위치를 찾을려고 ID등록했음
	        	}
	  
	        	if(re == ""){
	        		output += "<td class='col-md-2'>"+"<mark>"+result[i].c_writer+"</mark>";
	        	}else{
	        		output += "<td class='col-md-2'>"+"<mark>"+re+"└─"+result[i].c_writer+"</mark>";
	        	}
	        	output += "<td class='col-md-9'>"+comment+"<br><small>"+result[i].c_regdate+"</small><a onclick='replyComment(\""+replyParam+"\")'><img src='./resources/images/replyIcon.png'></a></td>";
	        	output += "<td class='col-md-3'><a onclick='updateComment(\""+param+"\")'><img src='./resources/images/pen.png' id='updateComment'></a>&nbsp;<img src='./resources/images/trash.png' id='deleteComment' alt='"+result[i].c_seq+":"+result[i].c_writer+"'></td>";
	        	output += "</tr>";	
	        }
	        output +="</table>";
	        $("#commentList").html(output);
	    },
	    error:function(request,status,error){
	    	swal("댓글을 불러올수 없습니다", "", "error");
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