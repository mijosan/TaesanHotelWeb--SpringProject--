<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>객실예약</title>
  <link rel="stylesheet" href="./resources/css/bootstrap.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="./resources/js/bootstrap.js"></script>
  <script>
  $( function() {
	    var dateFormat = "mm/dd/yy",
	      from = $( "#from" )
	        .datepicker({
	          defaultDate: "+1w",
	          changeMonth: true,
	          numberOfMonths: 3
	        })
	        .on( "change", function() {
	          to.datepicker( "option", "minDate", getDate( this ) );
	        }),
	      to = $( "#to" ).datepicker({
	        defaultDate: "+1w",
	        changeMonth: true,
	        numberOfMonths: 3
	      })
	      .on( "change", function() {
	        from.datepicker( "option", "maxDate", getDate( this ) );
	      });
	 
	    function getDate( element ) {
	      var date;
	      try {
	        date = $.datepicker.parseDate( dateFormat, element.value );
	      } catch( error ) {
	        date = null;
	      }
	 
	      return date;
	    }
	    
	    
	
	    $("#confirm").click(function(){
	    	var from = new Date($("#from").val());
	 	    var to = new Date($("#to").val());
	 	    var milli = 1000 * 60 * 60 * 24;
	 	    var milliBetween = to.getTime() - from.getTime();
	 	    var days = milliBetween / milli;	   
	 	    var room = $("#room").val();	    
	 	    var people = $("#sel1").val();
	 	    var peoplePrice;
	 	    
	 	    if(people == "성인 1~2인"){
	 	    	peoplePrice = 5;
	 	    }else if(people == "성인 3~4인"){
	 	    	peoplePrice = 10;
	 	    }else if(people == "성인 5~6인"){
	 	    	peoplePrice = 15;
	 	    }else if(people == "성인 7~8인"){
	 	    	peoplePrice = 20;
	 	    }

	 	    	
	 	    var price;
	 	    if(room == "standard"){
	 	    	price = 20 * days + peoplePrice;
	 	    }else if(room == "deluxe"){
	 	    	price = 25 * days + peoplePrice;
	 	    }else if(room == "premier"){
	 	    	price = 30 * days + peoplePrice;
	 	    }else if(room == "terrace"){
	 	    	price = 35 * days + peoplePrice;
	 	    }

	 	    
	 	   $(".modal-body").html("방 종류 : "+room+" Room<br><br>"+"숙박 기간 : "+$("#from").val()+" ~ "+$("#to").val()+"("+days+"일"+")<br>"
	 		+"<br>숙박 인원 : "+people+"<br><h3>가격은 총 "+price+"만원 입니다.<br><br>이대로 결제하시겠어요 ?</h3>");
	    });
	  });
  		
  </script>
  <style>
  	@font-face{

	font-family:"GoodFont"; /*폰트 패밀리 이름 추가*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*폰트 파일 주소*/
	}
  	.container{
		font-family:"GoodFont";
	}
  </style>
</head>

<body>
<%@include file="./WEB-INF/nav.jsp" %>

	<div class="container">
		<h2>Check In</h2><br>
        <input type="text" id="from" class="form-control">
        
        <h2>Check Out</h2><br>
        <input type="text" id="to" class="form-control">
        
        <h2>Room selection</h2><br>
        <input type="text" id="room" value="${param.room}" disabled class="form-control">
        
        <h2>인원선택</h2><br>
        <div class="form-group">
		  <select class="form-control" id="sel1">
		    <option>성인 1~2인</option>
		    <option>성인 3~4인</option>
		    <option>성인 5~6인</option>
		    <option>성인 7~8인</option>
		  </select>
		</div>
		
		<button type="button" id="confirm"class="btn btn-primary btn-block" data-toggle="modal" data-target="#exampleModalLong" >
		  	확인
		</button>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLongTitle">결제 내용</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <!--팝업 내용 들어가는곳-->
		        
		        <!--팝업 내용 들어가는곳-->
		      </div>
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-danger">결제</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<br><br><br><br>
<%@include file="./WEB-INF/footer.jsp" %>
</body>
</html>