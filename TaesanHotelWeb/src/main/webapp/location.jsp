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
	
	
	<%@include file="./WEB-INF/nav.jsp" %>
	
	<!--//////////////////////////////////////////////////////////////////  -->
	<div class="container">
		<div class="jumbotron">
			<h2 class="text-center">KOREA TS HOTEL</h2>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<h1 class="text-center">최고의 TS호텔 위치안내</h1>
			<p class="text-center" style="color:#FF6347; font-size:5em">. . . . . . . . .</p>
			<br><br>
			<br><hr><br>
			<!--카카오 지도api-->
			<div id="map" style="width:100%;height:350px;"></div>
			
			<!--printBtn-->
			<h3 class="text-left">부산광역시 해운대구 센텀0로 00(우동) (구. 부산광역시 해운대구 우0동 0000) <img src="./resources/images/printBtn.jpg" style="padding-left: 131px;"onclick="window.print();"></h3>
			
			<!--카카오 지도api -->

		<hr>
					<div class="panel panel-primary" style="border-color:white">
			<div class="panel-heading" style="background-color:#e7e7e7; border-color:white">
				<h2 class="panel-title" style="color:black;">
					TS호텔 찾아오시는길
				</h2>
			</div>
			<div class="panel-body">
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/airplane.jpg" alt="비행기"></a>
					</div>
					
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;항공편&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김해 공항에서 30~40분 소요(공항 리무진 기준), 해운대센텀호텔 앞 하차</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/train.jpg" alt="철도편"></a>
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;철도편&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울 → 부산(2시간 30분 소요)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부산역에서 지하철 이용 시 약 30분 소요<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1호선 - 2호선 : 서면역 환승 - 센텀시티역 하자 - 3번 출구)</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/highway.jpg" alt="고속도로"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;고속도로&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1) 서울 → 원동 IC(5시간 20분 소요) → BEXCO(20분 소요)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2) 마산, 창원 → 동서고가도로(40분 소요) →BEXCO(50분 소요)</h4>
					</div>
				</div>
				<hr>
				<div class="media">
					<div class="media-left">
						<a href="#"><img class="scale" src="./resources/images/bus.jpg" alt="bus"></a>
					
					</div>
					<div class="media-body">
						<h2 class="media-heading">&nbsp;&nbsp;&nbsp;시내교통&nbsp;</h4>
						<br><h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지하철 2호선 센텀시티역(3번 출구 앞 건물/벡스코 정류소 하차)<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대중버스 : 5-1, 39, 40, 63, 115, 141, 155, 181, 307, 1001, 1002, 1007, 139</h4>
						
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
	
	<!--////////////////////////////////////////////////////////////////////  -->
<br>
	<%@include file="./WEB-INF/footer.jsp" %>
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85a19cc21df636f17e4769c1205abe68"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">KOREA TS호텔 <br><a href="http://map.daum.net/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(33.450701, 126.570667);


var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
 
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker);
</script>
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