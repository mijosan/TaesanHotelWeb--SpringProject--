<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>회원가입</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<!-- <link rel="stylesheet" href="./resources/css/codingBooster.css"> -->

<style type="text/css">

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
	/*hover 기능*/
	.scale {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	.scale:hover {
	  transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);
	}


/*//////////////////////////////////////////////  */

	.jumbotron{
		background-color:white;
 		background-size:cover;
		color:black;
	}
	#myVideo {
	  position: fixed;
	  right: 0;
	  bottom: 0;
	  min-width: 100%; 
	  min-height: 100%;
	}
	 #jum{
		/* background-image:url('./resources/images/background.jpg'); */
		background-color:white;
	}
	@font-face{

	font-family:"GoodFont"; /*폰트 패밀리 이름 추가*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*폰트 파일 주소*/
	}
	
	@font-face{

	font-family:"GoodFont2"; /*폰트 패밀리 이름 추가*/
	
		src:url("./resources/fonts/NANUMPEN.TTF");
	}

	body{
		font-family:"Helvetica";
		background-color:#e7e2f5;
	}
	footer{
		background-color:#e7e2f5;
	}
	h1{
		font-family:"GoodFont2";
	}
	#myVideo {
  position: fixed;
  right: 0;
  bottom: 0;
  min-width: 100%; 
  min-height: 100%;
  z-index:-5;
}
	
	</style>
</head>
<body>
	<video autoplay muted loop id="myVideo">
 		<source src="./resources/videos/Introduce.mp4" type="video/mp4">
	</video>
	
	
	<%@include file="./WEB-INF/nav.jsp" %>
	<!--//////////////////////////////////////////////////////////////////  -->
	<div class="container">
		   	<div class="row" style="margin-bottom: 107px;">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" class="active" id="register-form-link">회원가입</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" name="login-form" action="login.do" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="아이디" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="비밀번호">
									</div>								
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="button" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="find.jsp" tabindex="5" class="forgot-password">아이디/비밀번호 찾기</a>
												</div>
											</div>
										</div>
									</div>
									
									<!--로그인 실패했을때-->
									<c:if test="${param.msg == 'failure' }">
										<p style="color:red;">아이디 또는 비밀번호가 틀렸습니다.</p>
									</c:if>
									<!--  -->
								</form>
								<form id="register-form" action="register.do" method="post" role="form" style="display: block;">
									<div class="form-group" id="divInputId">
										<input type="text" name="id" id="username2" tabindex="1" class="form-control" placeholder="아이디">
										<input type="button" id="idCheck" class="btn btn-default"  value="중복확인">
									</div>

									<div class="form-group" id="divInputEmail">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="이메일 주소" value="">
									</div>
									<div class="form-group" id="divInputPassword">
										<input type="password" name="password" id="password2" tabindex="2" class="form-control" placeholder="비밀번호">
									</div>
									<div class="form-group" id="divInputPassword-confirm">
										<input type="password" id="confirm-password" tabindex="2" class="form-control" placeholder="비밀번호 확인">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="button" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!--////////////////////////////////////////////////////////////////////  -->

	<%@include file="./WEB-INF/footer.jsp" %>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script type="text/javascript">

	$(document).ready(function(){
		
		$(function() {
		    $('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
		 		$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
		 		$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
		
		/* 로그인  */
		function login(){
			var userId = $("#username").val();
			var userPw = $("#password").val();
			if(userId == ""){
				swal("아이디를 입력하세요.", "", "error");
				$("#username").focus();
				return;
			}
			if(userPw == ""){
				swal("비밀번호를 입력하세요.", "", "error");
				$("#password").focus();
				return;
			}
			
			/* document.login-form.action="login.do"; */
			$('#login-form')[0].submit();
		}
		$("#login-submit").click(function(){
			login();
		});
		
		/*로그인 엔터키 이벤트*/
		$("#password").keydown(function(key) {
            if (key.keyCode == 13) {
            	login();
            }
        });
		$("#username").keydown(function(key) {
            if (key.keyCode == 13) {
            	login();
            }
        });
		
		//아이디 중복검사 AJAX
		var idck = 0;
		    //idck 버튼을 클릭했을 때 
		    $("#idCheck").click(function() {
		    	
		    	//아이디 공백체크
		    	//userid 를 param.
		    	var id = $("#username2").val();
		    	if(id == ""){
		    		swal("아이디를 입력하세요.", "", "error");
		    		return;
		    	}
		        $.ajax({
		            async: true,
		            type : 'POST',
		            data : id,
		            url : "idcheck.do",
		            dataType : "json",
		            contentType: "application/json; charset=UTF-8",
		            success : function(data) {
		                if (data.cnt > 0) {
		                	swal("아이디가 존재합니다. 다른 아이디를 입력해주세요.", "", "error");
		                    $("#divInputId").addClass("has-error")
		                    $("#divInputId").removeClass("has-success")
		                    $("#userid").focus();
		                } else {
		                	swal("사용가능한 아이디입니다.", "", "success");
		                    $("#divInputId").addClass("has-success")
		                    $("#divInputId").removeClass("has-error")
		                    $("#userpwd").focus();
		                    //아이디가 중복하지 않으면  idck = 1 
		                    idck = 1;	                    
		                }
		            },
		        });
		    });
			
/* 회원가입  */
		    
		    function register(){
		    	if(idck == 0){
			    	swal("아이디 중복검사를 하세요.", "", "error");
			    	return;
			    }
		    	
		    	var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
				var userId = $("#username2").val();
				var userPw = $("#password2").val();
				var userPw2 = $("#confirm-password").val();
				var email = $("#email").val();
				if(userId == ""){
					swal("아이디를 입력하세요.", "", "error");
					$("#username2").focus();
					return;
				}
				
				
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
		          swal("이메일형식에 맞게 입력해주세요.", "", "error");
		          $("#email").val("");
		          $("#divInputEmail").addClass("has-error")
                  $("#divInputEmail").removeClass("has-success")
		          $("#email").focus();
		          return;
		        }else{
		        	$("#divInputEmail").addClass("has-success")
	                $("#divInputEmail").removeClass("has-error")
		        }
		        
		        //비밀번호 유효성 검사
				if(userPw == ""){
					swal("비밀번호를 입력하세요.", "", "error");
					   	$("#divInputPassword").addClass("has-error")
	                    $("#divInputPassword").removeClass("has-success")
					$("#password2").focus();
					return;
				}else{			
					   $("#divInputPassword").addClass("has-success")
	                   $("#divInputPassword").removeClass("has-error")
				}
				
				if(userPw2 == ""){
					swal("비밀번호 확인을 입력하세요.", "", "error");
					$("#divInputPassword-confirm").addClass("has-error")
                    $("#divInputPassword-confirm").removeClass("has-success")
					$("#divInputPassword-confirm").focus();
					return;
				}else{
					$("#divInputPassword-confirm").addClass("has-success")
                    $("#divInputPassword-confirm").removeClass("has-error")
					
				}
				

				//비밀번호 똑같은지
		        if($("#password2").val() != ($("#confirm-password").val())){ 
		        	swal("비밀번호 확인을 다시입력 하세요.", "", "error");
			        $("#password2").val("");
			        $("#confirm-password").val("");
			        $("#confirm-password").focus();
		        return;
		       }
				
				$('#register-form')[0].submit();
				swal("회원가입이 완료 되었습니다.", "", "success");
		    }
		    //유효성 검사
		    $("#register-submit").click(function(){
		    	register();
			});
		    $("#username2").keydown(function(key) {
	            if (key.keyCode == 13) {
	            	register();
	            }
	        });
		    $("#email").keydown(function(key) {
	            if (key.keyCode == 13) {
	            	register();
	            }
	        });
		    $("#password2").keydown(function(key) {
	            if (key.keyCode == 13) {
	            	register();
	            }
	        });
		    $("#confirm-password").keydown(function(key) {
	            if (key.keyCode == 13) {
	            	register();
	            }
	        });
		    
		});
	</script>
</body>
</html>