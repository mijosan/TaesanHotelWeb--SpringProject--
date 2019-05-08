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
	footer{
		background-color:white;
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
	
	
	<%@include file="nav.jsp" %>
	
	<!--//////////////////////////////////////////////////////////////////  -->
	<div class="container">
		<div class="jumbotron">
			<h2 class="text-center">KOREA TS HOTEL</h2>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h1 class="text-center">최고의 TS호텔 100%<br><br>즐기기 위한 개실 이용 안내</h1>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h4 class="text-center">안녕하십니까 고객님,<br>TS호텔을 찾아주신 고객님을 진심으로 환영합니다.<br>모두가 쾌적하고 편리한 객실 이용을 위하여, 아래의 몇 가지 사항을 당부해 드리오니, 협조 부탁드립니다.</h4>
			<br><hr><br>
			<ul class="slides">
    <input type="radio" name="radio-btn" id="img-1" checked />
    <li class="slide-container">
        <div class="slide">
            <img class="bk" src="./resources/images/room1.jpg" />
        </div>
        <div class="nav">
            <label for="img-6" class="prev">&#x2039;</label>
            <label for="img-2" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/room2.jpg" />
        </div>
        <div class="nav">
            <label for="img-1" class="prev">&#x2039;</label>
            <label for="img-3" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/room3.jpg" />
        </div>
        <div class="nav">
            <label for="img-2" class="prev">&#x2039;</label>
            <label for="img-4" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/room4.jpg" />
        </div>
        <div class="nav">
            <label for="img-3" class="prev">&#x2039;</label>
            <label for="img-5" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-5" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/room5.jpg" />
        </div>
        <div class="nav">
            <label for="img-4" class="prev">&#x2039;</label>
            <label for="img-6" class="next">&#x203a;</label>
        </div>
    </li>

    <input type="radio" name="radio-btn" id="img-6" />
    <li class="slide-container">
        <div class="slide">
          <img src="./resources/images/room6.jpg" />
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
			<h3 class="text-left"><span class="redcolor">1 반려동물 출입은 금지</span>합니다.(적발 시 퇴실 조치되오니 유의 바랍니다.)<br><br><br>
			<span class="redcolor">2</span> 체크아웃 시간은 <span class="redcolor">오전 11:00</span>까지 입니다.<br><br><br>
			<span class="redcolor">3</span> 객실 내 간단한 조리는 가능하나 냄새와 연기가 많이 발생하는 <span class="redcolor">취식 조리는 금지</span>합니다.<br><br><br>
			<span class="redcolor">4</span> 고객님의 안전을 위해 객실 내<span class="redcolor"> 풍선, 촛불, 샴페인, 폭죽 등의 이벤트는 금지</span>합니다.<br><br><br>
			<span class="redcolor">5</span> 해수욕장 이용 후에는 <span class="redcolor">모래세척장에서 모래를 세척 후 입실</span> 바랍니다.<br><br><br>
			<span class="redcolor">6</span> 휴대폰 <span class="redcolor">배터리 충전은 1F 컨시어지</span>에 문의바랍니다.<br><br><br>
			<span class="redcolor">7 짐 보관</span>  : 컨시어지, <span class="redcolor">귀중품 보관</span> : 프론트<br><br><br>
			컨시어지(내선 0000~0000) ｜ 프론트(내선 0000~0000) ｜ 객실관리(내선 0000~0)
			</h3>
			<br><br><br><br><br>


	<!--이미지 슬라이드-->

		<hr>
		</div>
	</div>

	
	<!--////////////////////////////////////////////////////////////////////  -->
<br>
	<%@include file="footer.jsp" %>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
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