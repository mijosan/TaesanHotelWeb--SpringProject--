<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
<style>
#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
  z-index:-5;
}
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/

    position: fixed;

    left:0;

    right:0;

    top:0;

    bottom:0;

    background: rgba(0,0,0,0.2); /*not in ie */

    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */

    

}

    .wrap-loading div{ /*로딩 이미지*/

        position: fixed;

        top:50%;

        left:50%;

        margin-left: -21px;

        margin-top: -21px;

    }

    .display-none{ /*감추기*/

        display:none;

    }

</style>
</head>
<body>
<%@include file="nav.jsp"%>

<div class="container" style="margin-bottom: 239px;">
<h1>회원정보</h1><br>
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>

</div>  
<form name="member">
	<table class="table table-striped table-bordered table-hover">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" value="${user.id}" disabled></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="email" name="email" value="${user.email}"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="password" name="password" value="${user.password}"placeholder="비밀번호 변경"></textfield></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="confirm-password"></td>
		</tr>
	</table>
</form>
	<input type="button" id="cancel" value="취소" class="btn pull-right btn-default">
	<input type="button" id="modify" value="정보수정" class="btn pull-right btn-success">
</div>

<%@include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		$("#modify").click(function(){
			var getMail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			var userPw = $("#password").val();
			var userPw2 = $("#confirm-password").val();
			var email = $("#email").val();
			var userId = $("#id").val();
			
			//이메일 유효성 검사
			if(email == ""){
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return;
			}
			
	        if(getMail.test($("#email").val())==false){
	          alert("이메일형식에 맞게 입력해주세요")
	          $("#email").val("");
	          $("#email").focus();
	          return;
	        }
	        
	        //비밀번호 유효성 검사
			if(userPw == ""){
				alert("비밀번호를 입력하세요.");
				$("#password").focus();
				return;
			}
			
			if(userPw2 == ""){
				alert("비밀번호 확인을 입력하세요.");
				$("#confirm-password").focus();
				return;
			}
			
			//비밀번호 똑같은지
	        if($("#password").val() != ($("#confirm-password").val())){ 
	        	alert("비밀번호 확인을 다시입력 하세요. ");
		        $("#password").val("");
		        $("#confirm-password").val("");
		        $("#confirm-password").focus();
	        	return;
	       }

		   $.ajax({
			   type : 'post',
				url : "updateMember.do",
				contentType : "application/json",
				data : JSON.stringify({"id":userId,"email":email,"password":userPw}),
				dataType : "text",
				success : function(result){
	        		alert("수정이 완료 되었습니다");
	        	},
	        	beforeSend:function(){
	        	        $('.wrap-loading').removeClass('display-none');
	        	  },

	        	complete:function(){
	        	        $('.wrap-loading').addClass('display-none');
	        	},
	        	error : function(request,status,error){
	        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
	        		alert("회원정보가 변경 되지 않았습니다");
	        	}
		   });
		});
	});
</script>
</body>
</html>