<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보</title>
<style>

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
    #myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
  z-index:-5;
}	
body{
		font-family:"Helvetica";
		background-color:#e7e2f5;
	}

</style>
</head>
<body>
<video autoplay muted loop id="myVideo">
 		<source src="./resources/videos/Introduce.mp4" type="video/mp4">
	</video>
<%@include file="./WEB-INF/nav.jsp"%>

<div class="container" style="margin-bottom: 295px;">

<!--로딩이미지-->
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>
</div>  

<div class="panel panel-default">
	<div class="panel-heading"><h3>아이디/비밀번호 찾기</h3></div>
	<div class="panel-body">
		<table class="table table table-striped table-bordered table-hover">
			<tr>
				<th>이메일 주소</th>
				<td><input type="text" id="email" placeholder="가입시 사용하였던 이메일을 적어주세요" style="width:87%" class="form-control"> <input type="button" id="emailBtn" value="인증번호 받기" class="btn btn-success"></td>
			</tr>
			<tr>
				<th>인증 번호</th>
				<td><input type="text" class="form-control" id="numText" placeholder="인증번호 5자리 숫자 입력" style="width:87%"> <input type="button" id="confirmBtn"value="확인" class="btn btn-success"></td>
			</tr>
			<tr>
				<th>회원 정보</th>
				<td><input type="text" class="form-control" id="password" style="width:87%" disabled></td>
			</tr>
		</table>
	</div>
</div>

</div>

<%@include file="./WEB-INF/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script>
	$(document).ready(function(){
		var number; //인증번호
		
		/* 이메일 인증번호  */
		$("#emailBtn").click(function(){
			var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			var email = $("#email").val();
			
			//이메일 유효성 검사
			if(email == ""){
				swal("이메일을 입력하세요.", "", "error");
				$("#divInputEmail").addClass("has-error")
                $("#divInputEmail").removeClass("has-success")
				$("#email").focus();
				return;
			}else{
				$("#divInputEmail").addClass("has-success")
                $("#divInputEmail").removeClass("has-error")
				
			}
			
	        if(!getMail.test($("#email").val())){
	          swal("이메일형식에 맞게 입력해주세요", "", "error");
	          $("#email").val("");
	          $("#divInputEmail").addClass("has-error")
              $("#divInputEmail").removeClass("has-success")
	          $("#email").focus();
	          return;
	        }else{
	        	$("#divInputEmail").addClass("has-success")
                $("#divInputEmail").removeClass("has-error")
	        }
			$.ajax({
				 type : 'post',
					url : "mail.do",
					contentType : "application/json",
					data : JSON.stringify({"email":$("#email").val()}),
					dataType : "json",
					success : function(data){

		        		if(data.result == "fail"){
		        			swal("등록된 이메일이 없습니다.", "", "error");
		        		}else{
		        			number = data.number;
		        		}
		        	},
		        	beforeSend:function(){
		        		$('.wrap-loading').removeClass('display-none');
		        	},

		        	complete:function(){
		        	    $('.wrap-loading').addClass('display-none');
		        	},
		        	error : function(request,status,error){
		        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		        		swal("메일이 전송 되지 않았습니다.", "", "error");
		        	}
			});
		});
		
		//확인버튼
		$("#confirmBtn").click(function(){
			if($("#numText").val() == number){ //인증번호가 맞을때 아이디 출력
				$.ajax({
					 type : 'post',
						url : "idSearch.do",
						contentType : "application/json",
						success : function(data){
							for(var i=0;i<data.list.length;i++){
								$("#password").val("ID:"+data.list[i].id+" PW:"+data.list[i].password +" & "+$("#password").val());
							}
			        	},
			        	beforeSend:function(){
			        		$('.wrap-loading').removeClass('display-none');
			        	},

			        	complete:function(){
			        	    $('.wrap-loading').addClass('display-none');
			        	},
			        	error : function(request,status,error){
			        		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			        		swal("아이디를 불러오지 못했습니다.", "", "error");
			        	}
				});
			}else if(number == null){ //인증번호를 발급받은적이 없을시
				swal("인증번호를 발급 받아야합니다.", "", "error");
			}else{//인증번호가 틀렸을때
				swal("인증번호가 틀렸습니다.", "", "error");
			}
		})
	});

</script>
</body>
</html>