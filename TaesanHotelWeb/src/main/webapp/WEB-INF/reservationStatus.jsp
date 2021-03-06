<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="./resources/css/bootstrap.css">
<html>
<head>
<meta charset="EUC-KR">
<title>객실예약 현황</title>
<style>
@font-face{

	font-family:"GoodFont"; /*폰트 패밀리 이름 추가*/
	
	src:url("./resources/fonts/KBIZHanmaumMyungjo.ttf"); /*폰트 파일 주소*/
	}
	
	.container{
		font-family:"GoodFont";
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
<!--로딩이미지-->
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>
</div>  
<div class="container" style="margin-bottom: 290px;">
<h2>객실예약 현황</h2><br>
<table class="table table table-striped table-bordered table-hover">
	<tr>
		<th class="text-center">날짜</th>
		<th class="text-center">예약정보</th>
		<th class="text-center">상태</th>
		<th class="text-center">취소</th>
	</tr>
	<c:choose>
	<c:when test="${reservationList == null}">
	</table>
			<h2>예약한 목록이 없습니다.</h2>
	</c:when>
	<c:otherwise>
	<c:forEach items="${reservationList}" var="reservation">
	<tr>
		<td class="text-center" style="vertical-align: middle;">${reservation.r_date}<br><a data-toggle="modal" href="#exampleModalLong${reservation.r_seq}">(자세히 보기)</a></td>
		<td>
			<div>
			<c:choose>
			<c:when test="${reservation.r_name == 'standard'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R0000000GO0L_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'deluxe'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000TGX_KR.jpg">
			</c:when>
			<c:when test="${reservation.r_name == 'premier'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000008REF_KR.gif">
			</c:when>
			<c:when test="${reservation.r_name == 'terrace'}">
				<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000PL1_KR.jpg">
			</c:when>
			</c:choose>
				<a href="${reservation.r_name}.jsp"> ${reservation.r_name} room</a> ｜ ${reservation.r_people} ｜ ${reservation.r_price} 만원
			</div>
		</td>
		<td class="text-center" style="vertical-align: middle;">
			예약완료
		</td>
		<td class="text-center" style="vertical-align: middle;">
			<input type="button" id="deleteBtn" class="btn btn-danger" value="예약취소" data-item-id="${reservation.r_seq}">
		</td>
	</tr>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalLong${reservation.r_seq}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">결제 내용</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      <c:choose>
				<c:when test="${reservation.r_name == 'standard'}">
					<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R0000000GO0L_KR.jpg">
				</c:when>
				<c:when test="${reservation.r_name == 'deluxe'}">
					<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000TGX_KR.jpg">
				</c:when>
				<c:when test="${reservation.r_name == 'premier'}">
					<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000008REF_KR.gif">
				</c:when>
				<c:when test="${reservation.r_name == 'terrace'}">
					<img src="http://www.shilla.net/images/contents/accmo/ACCMO_INDEX/R00000000PL1_KR.jpg">
				</c:when>
				</c:choose><br><br>
			<span class='glyphicon glyphicon-ok' aria-hidden='true'/> 방 종류 : ${reservation.r_name} room<br><br>
	        <span class='glyphicon glyphicon-ok' aria-hidden='true'/> 숙박 기간 : ${reservation.r_date}<br><br>
	        <span class='glyphicon glyphicon-ok' aria-hidden='true'/> 숙박 인원 : ${reservation.r_people}<br><h3>가격은 총 ${reservation.r_price}만원 입니다.</h3><br><br>
	      
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>
</table>
</div>
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="./resources/js/bootstrap.js"></script>
<script>
//예약취소
$(document).ready(function(){
	$(document).on('click', "#deleteBtn", function(r_seq){
		var r_seq = $(this).data('itemId');

		if(confirm("정말 삭제 하시겠습니까 ?") == true){
			$.ajax({
				type : 'post',
				url : "deleteReservation.do",
				contentType : "application/json",
				data : JSON.stringify({"r_seq":r_seq}),
				dataType : "text",
				success : function(result){
					swal("성공적으로 삭제 되었습니다.", "", "success");
					location.reload();
		    	},
		    	beforeSend:function(){
		    		$('.wrap-loading').removeClass('display-none');
		    	},

		    	complete:function(){
		    	    $('.wrap-loading').addClass('display-none');
		    	},
		    	error : function(request,status,error){
		    		alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		    		swal("삭제 되지 않았습니다.", "", "error");
		    	}
			});
			
		}

		else{
			
		}

		})
});

</script>
</body>
</html>