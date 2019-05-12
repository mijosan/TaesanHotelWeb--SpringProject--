<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>TS호텔</title>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<!-- <link rel="stylesheet" href="./resources/css/codingBooster.css"> -->

<style type="text/css">
	#myBtn {
  display: none; /* Hidden by default */
  position: fixed; /* Fixed/sticky position */
  bottom: 20px; /* Place the button at the bottom of the page */
  right: 30px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  background-color: red; /* Set a background color */
  color: white; /* Text color */
  cursor: pointer; /* Add a mouse pointer on hover */
  padding: 15px; /* Some padding */
  border-radius: 10px; /* Rounded corners */
  font-size: 18px; /* Increase font size */
}
#myBtn:hover {
		  background-color: #555; /* Add a dark-grey background on hover */
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
#img2 {width:325px; height:280px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */
	
	
	/*/////////*/
	
	/*background 애니메이션*/
		<style>
	@import url(https://fonts.googleapis.com/css?family=Varela+Round);

html, body { background: #333 url("https://codepen.io/images/classy_fabric.png"); }

.slides {
    padding: 0;
    width: 100%;
    height: 420px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 100%;
    height: 420px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {
    width: 200px;
    height: 100%;
    display: none;
    position: absolute;

      opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 380px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 15px rgb(119, 119, 119);
}


.slide:hover + .nav label { opacity: 0.5; }

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block; }

.nav-dots {
    width: 100%;
    bottom: 9px;
    height: 11px;
    display: block;
    position: absolute;
    text-align: center;
}

.nav-dots .nav-dot {
    top: -5px;
    width: 11px;
    height: 11px;
    margin: 0 4px;
    position: relative;
    border-radius: 100%;
    display: inline-block;
    background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
    cursor: pointer;
    background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4,
input#img-5:checked ~ .nav-dots label#img-dot-5,
input#img-6:checked ~ .nav-dots label#img-dot-6 {
    background: rgba(0, 0, 0, 0.8);
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
		font-family:"GoodFont";
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
		<div class="jumbotron">
			<h2 class="text-center">지친 일상에서 떠나보세요.</h2>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h1 class="text-center">최고의 TS호텔이<br><br>고객님을 위해 기다리고 있습니다.</h1>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h2 class="text-center">후회없는 선택이 될겁니다.</h2>
			<br><br><br><br><br><br><br>


	<!--이미지 슬라이드-->
	

	<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
        <div class="slide">
            <img class="bk" src="./resources/images/background.jpg" />
        </div>
        <div class="nav">
            <label for="img-6" class="prev">&#x2039;</label>
            <label for="img-2" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/background1.jpg" />
        </div>
        <div class="nav">
            <label for="img-1" class="prev">&#x2039;</label>
            <label for="img-3" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/background2.jpg" />
        </div>
        <div class="nav">
            <label for="img-2" class="prev">&#x2039;</label>
            <label for="img-4" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/background3.jpg" />
        </div>
        <div class="nav">
            <label for="img-3" class="prev">&#x2039;</label>
            <label for="img-5" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/background4.jpg" />
        </div>
        <div class="nav">
            <label for="img-4" class="prev">&#x2039;</label>
            <label for="img-6" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/background5.jpg" />
        </div>
        <div class="nav">
            <label for="img-5" class="prev">&#x2039;</label>
            <label for="img-1" class="next">&#x203a;</label>
        </div>
    </li>

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
      <label for="img-5" class="nav-dot" id="img-dot-5"></label>
      <label for="img-6" class="nav-dot" id="img-dot-6"></label>
    </li>
</ul>
	
				
		
			<!--이미지 슬라이드  -->
			
			
			
			
			
			
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
		    <div id="img2" class="thumbnail" style="
    height: 770px;
">
		      <img class="scale" src="./resources/images/chefs.jpg" alt="..." style="height: 500px;">
		      <div class="caption"><br>
		        <h2>최고의 셰프</h2>
		        <p>항상 새롭고 맛있는 요리를 위해<br>끊임없이 매일 연구하고<br>고민합니다.</p>
		        <p class="text-center" style="color:#FF6347; font-size:2em">. . . . . . . . .</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div id="img2" class="thumbnail" style="
    height: 770px;
">
		      <img class="scale" src="./resources/images/champagne.jpg" alt="..." style="height: 500px;">
		      <div class="caption"><br>
		        <h2>샴페인과 함께...</h2>
		        <p>생일인 고객님께 제공되는 샴페인<br>과 함께 사랑하는 사람과 파티를 즐겨보세요.</p>
		        <p class="text-center" style="color:#FF6347; font-size:2em">. . . . . . . . .</p>
		      </div>
		    </div>
		  </div>
		   <div class="col-sm-6 col-md-4">
		    <div id="img2" class="thumbnail" style="
    height: 770px;
">
		      <img class="scale" src="./resources/images/coffee.jpg" alt="..." style="height: 500px;">
		      <div class="caption"><br>
		        <h2>최고의 야경</h2>
		        <p>해운대 바다 View를 보며 <br>커피 한잔과 인생을 되돌아<br>보는 기회를...</p>
		        <p class="text-center" style="color:#FF6347; font-size:2em">. . . . . . . . .</p>
		      </div>
		    </div>
		  </div>
		</div>
		</div>
		<hr>
		<div class="panel panel-primary" style="border-color:white">
			<div class="panel-heading" style="background-color:#e7e7e7; border-color:white">
				<h2 class="panel-title" style="color:black;">
					About TS호텔 
				</h2>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/use.jpg" alt="이용안내"></a>
					</div>
					
					<div class="media-body">
						<h2 class="media-heading"><a href="introduce.jsp?lectureName=C">&nbsp;&nbsp;&nbsp;이용안내</a>&nbsp;<span class="label label-primary">INFO</span> </h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TS호텔을 100%즐기는 방법</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/reservation.jpg" alt="예약"></a>
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Java">&nbsp;&nbsp;&nbsp;객실예약</a>&nbsp;<span class="label label-danger">HOT</span> </h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;최고의 TS호텔 객실예약 하러가기</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/staff.jpg" alt="고객센터"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading"><a href="lecture.jsp?lectureName=Android">&nbsp;&nbsp;&nbsp;고객센터</a>&nbsp;<span class="label label-info">HELP</span> </h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TS호텔의 관리자에게 문의하기</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
<br>
	
	<!--////////////////////////////////////////////////////////////////////  -->
	<%@include file="./WEB-INF/footer.jsp" %>
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
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
	<script>
	// When the user scrolls down 20px from the top of the document, show the button
	window.onscroll = function() {scrollFunction()};

	function scrollFunction() {
	  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
	    document.getElementById("myBtn").style.display = "block";
	  } else {
	    document.getElementById("myBtn").style.display = "none";
	  }
	}

	// When the user clicks on the button, scroll to the top of the document
	function topFunction() {
	  document.body.scrollTop = 0; // For Safari
	  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
	}
	</script>
</body>
</html>