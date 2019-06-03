<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>객실예약</title>
<style>
	#thumbnail-preview-indicators {
  position: relative;
  overflow: hidden;
}
#thumbnail-preview-indicators .slides .slide-1, 
#thumbnail-preview-indicators .slides .slide-2,
#thumbnail-preview-indicators .slides .slide-3, 
#thumbnail-preview-indicators .slides .slide-4,
#thumbnail-preview-indicators .slides .slide-5{
  background-size: cover;
  background-position: center center;
  background-repeat: no-repeat;
}
    #thumbnail-preview-indicators,
    #thumbnail-preview-indicators .slides,
    #thumbnail-preview-indicators .slides .slide-1, 
    #thumbnail-preview-indicators .slides .slide-2,
    #thumbnail-preview-indicators .slides .slide-3,
    #thumbnail-preview-indicators .slides .slide-4,
    #thumbnail-preview-indicators .slides .slide-5 {
      height: 480px;
    }
#thumbnail-preview-indicators .slides .slide-1 {
  background-image: url(http://www.shilla.net/images/contents/accmo/EX/R000000011V4_KR.jpg); 
}
#thumbnail-preview-indicators .slides .slide-2 {
  background-image: url(http://www.shilla.net/images/contents/accmo/BD/R00000002BPW_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-3 {
  background-image: url(http://www.shilla.net/images/contents/accmo/BD/R00000002BQ4_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-4 {
  background-image: url(http://www.shilla.net/images/contents/accmo/BD/R000000011PB_KR.jpg);
}
#thumbnail-preview-indicators .slides .slide-5 {
  background-image: url(http://www.shilla.net/images/contents/accmo/BD/R00000002BQC_KR.jpg);
}
#thumbnail-preview-indicators .carousel-inner .item .carousel-caption {
  top: 20%;
  bottom: inherit;
}
#thumbnail-preview-indicators .carousel-indicators li,
#thumbnail-preview-indicators .carousel-indicators li.active {
  position: relative;
  width: 100px;
  height: 8px;  
}
#thumbnail-preview-indicators .carousel-indicators li > .thumbnail {
  position: absolute;
  top: 0;
  width: 100px;
  display: none;
  opacity: 0;
  left: 50%;
  margin-top: -80px;
  margin-left: -50px;
}
#thumbnail-preview-indicators .carousel-indicators li:hover > .thumbnail,
#thumbnail-preview-indicators .carousel-indicators li.active > .thumbnail {
  display: block;
  opacity: .8;
}
#thumbnail-preview-indicators .carousel-indicators li.active > .thumbnail:hover{
  opacity: 1;
}
@media screen and (max-width : 480px) {    
    #thumbnail-preview-indicators .carousel-indicators li,
    #thumbnail-preview-indicators .carousel-indicators li.active {
      width: 50px;
      height: 8px;
      position: relative;
    }
    #thumbnail-preview-indicators .carousel-indicators li > .thumbnail {
       width: 50px;
       left: 50%;
       margin-top: -50px;
       margin-left: -25px;
    }
}
@font-face{

	font-family:"GoodFont2"; /*폰트 패밀리 이름 추가*/
	
		src:url("./resources/fonts/NANUMPEN.TTF");
	}
.fontClass{
	font-family:"GoodFont2";
}
</style>
</head>
<body>
<%@include file="./WEB-INF/nav.jsp" %>
<div class="container">
<span class="fontClass">
<h1>Standard Room</h1>
	<div id="thumbnail-preview-indicators" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#thumbnail-preview-indicators" data-slide-to="0" class="active">
              <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/BD/R000000023RR_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="1">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/BD/R00000002BPW_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="2">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/BD/R00000002BQ4_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="3">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/BD/R000000011PB_KR.jpg">
              </div>
            </li>
            <li data-target="#thumbnail-preview-indicators" data-slide-to="4">
            <div class="thumbnail">
                <img class="img-responsive" src="http://www.shilla.net/images/contents/accmo/BD/R00000002BQC_KR.jpg">
              </div>
            </li>
          </ol>
          <div class="carousel-inner">
            <div class="item slides active">
              <div class="slide-1"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>아늑한 투베드의 고품격 침대</h1>
                  <p>Responsive thumbnail preview in carousel indicators.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=standard" role="button">예약 하기</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-2"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>고급 목재풍 인테리어와 힐링</h1>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=standard" role="button">예약하기</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-3"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>야경과 함께 즐기세요</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=standard" role="button">예약하기</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-4"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>럭셔리 풍의 목재 욕조</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=standard" role="button">예약하기</a></p>
                </div>
              </div>
            </div>
            <div class="item slides">
              <div class="slide-5"></div>
              <div class="container">
                <div class="carousel-caption">
                  <h1>최고급 와인바의 분위기</h1>
                  <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                  <p><a class="btn btn-lg btn-primary" href="reservation.jsp?room=standard" role="button">예약하기</a></p>
                </div>
              </div>
            </div>
          </div>
          <a class="left carousel-control" href="#thumbnail-preview-indicators" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
          <a class="right carousel-control" href="#thumbnail-preview-indicators" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
      </div>
</span>   
</div>
<br><br><br><br>
<%@include file="./WEB-INF/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>

</body>
</html>