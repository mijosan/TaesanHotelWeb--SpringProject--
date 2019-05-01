<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>Main Page</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<!-- <link rel="stylesheet" href="./resources/css/codingBooster.css"> -->

<style type="text/css">
	.jumbotron{
		/* background-image:url('./resources/images/chefs.jpg'); */
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
		background-image:url('./resources/images/restaurant.jpg');
	}


	</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">TS호텔</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">소개<span class="sr-only"></span></a></li>
					<li><a href="introduce.jsp">이용안내</a></li>
					<li><a href="instructor.jsp">객실예약</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="lecture.jsp?lectureName=C">문의게시판</a></li>
					</ul>
					</li>
				</ul>
				<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="내용을 입력하세요">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form> -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
						<li><a href="loginForm.jsp">로그인</a></li>
						<li><a href="registerForm.jsp">회원가입</a></li>
					</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!--//////////////////////////////////////////////////////////////////  -->
	<div class="container">
		<div class="jumbotron">
			<p class="text-center">지친 일상에서 떠나보세요.</p>
			<p class="text-center">. . . . . . . . .</p>
			<h2 class="text-center">최고의 호텔이<br>고객님을 위해 기다리고 있습니다.</h2>
			<p class="text-center"> . . . . . . . . .</p>
			<p class="text-center">후회없는 선택이 될겁니다.</p>
			<br><br><br><br><br><br><br>

			<div class="jumbotron" id="jum" style="
    height: 496px;
">
				
			</div>
			
			<!-- <a href="login.do" class="btn btn-primary btn-lg" role="button">로그인</a><br><br><br>
			<a href="getBoardList.do" class="btn btn-primary btn-lg" role="button">글 목록 바로가기</a>
			<a href="dataTransform.do" class="btn btn-primary btn-lg" role="button">글 목록 변환 처리</a> -->
		<hr>
<!-- 		<div class="row">
			<div class="col-md-4">
				<h4>최고의 쉐프</h4>
				<p>항상 새롭고 맛있는 요리를 위해<br>끊임없이 매일 연구하고<br>고민합니다.</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
				
				
			</div>
			<div class="col-md-4">
				<h4>샴페인과 함께...</h4>
				<p>저희 호텔은 생일인 고객님께<br>샴페인을 무료로 제공하고 있습니다.<br>사랑하는 사람과 파티를 즐겨보세요.</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
			</div>
			<div class="col-md-4">
				<h4>최고의 야경</h4>
				<p>한강이 보이는 View를 보며 <br>커피 한잔을...</p>
				<p class="text-center"> . . . . . . . . .</p>
				<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
			</div>
		</div> -->
		<div class="row">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/chefs.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>최고의 셰프</h3>
		        <p>항상 새롭고 맛있는 요리를 위해<br>끊임없이 매일 연구하고<br>고민합니다.</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/champagne.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>샴페인과 함께...</h3>
		        <p>저희 호텔은 생일인 고객님께<br>샴페인을 무료로 제공하고 있습니다.<br>사랑하는 사람과 파티를 즐겨보세요.</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div class="thumbnail" style="
    height: 770px;
">
		      <img src="./resources/images/coffee.jpg" alt="..." style="height: 500px;">
		      <div class="caption">
		        <h3>최고의 야경</h3>
		        <p>한강이 보이는 View를 보며 <br>커피 한잔을...</p>
		        
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		<hr>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title"><span class="glyphicon glyphicon-hand-right"></span>
					&nbsp;&nbsp;about TS호텔
				</h3>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/use.jpg" alt="이용안내"></a>
					</div>
					
					<div class="media-body">
						<h2 class="media-heading"><a href="introduce.jsp?lectureName=C">&nbsp;&nbsp;이용안내</a>&nbsp;<span class="label label-primary">INFO</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TS호텔을 100%즐기는 방법
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/reservation.jpg" alt="예약"></a>
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Java">&nbsp;&nbsp;객실예약</a>&nbsp;<span class="label label-danger">HOT</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;최고의 TS호텔 객실예약 하러가기
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="media-object" src="./resources/images/staff.jpg" alt="고객센터"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Android">&nbsp;&nbsp;고객센터</a>&nbsp;<span class="label label-info">HELP</span> </h4>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TS호텔의 관리자에게 문의하기
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	
	<!--////////////////////////////////////////////////////////////////////  -->
	<footer style="background-color:white; color: black">
		<div class="container">
			<br>
			<div class="col-sm-4" style="text-align: center;"><h5>Copyright ⓒ Choi Tasean. All Rights Reserved.</h5></div>
			<div class="col-sm-4"></div>
			<div class="col-sm-2"><h4 style="text-align:center;">바로가기</h4>
				<div class="list-group">
					<a href="index.jsp" class="list-group-item">소개</a>
					<a href="introduce.jsp" class="list-group-item">이용안내</a>
					<a href="lecture.jsp" class="list-group-item">객실예약</a>
					<a href="lecture.jsp" class="list-group-item">고객센터</a>
				</div>
			</div>
			<div class="col-sm-2"><h4 style="text-align:center;">SNS</h4>
				<div class="list-group">
					<a href="https://www.facebook.com" class="list-group-item">페이스북</a>
					<a href="https://www.youtube.com" class="list-group-item">유튜브</a>
					<a href="https://www.naver.com" class="list-group-item">네이버</a>
				</div>
			</div>
			<!-- <div class="col-sm-2"><h4 style="text-align:center;"><span class="glyphicon glyphicon-ok"></span>&nbsp;by 최태산</h4></div> -->
		</div>
	</footer>
	
	<!--modal-->
	<!-- <div class="row">
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						최고의 쉐프
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align; center;">
						끊임없이 매일 연구하고<br>
						고민합니다.<br>
						<img src="images/chefs.jpg" id="imagepreview" style="width:256px; height:256px;">
					</div>
				</div>
			</div>
		</div>
	</div> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
</body>
</html>