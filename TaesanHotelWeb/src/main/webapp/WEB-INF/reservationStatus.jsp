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
</style>
</head>
<body>
<%@include file="nav.jsp"%>
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
		<td class="text-center" style="vertical-align: middle;">${reservation.r_date}<br><a data-toggle="modal" href="#exampleModalLong">(자세히 보기)</a></td>
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
			<input type="button" class="btn btn-danger" value="예약취소">
		</td>
	</tr>

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
        <span class='glyphicon glyphicon-ok' aria-hidden='true'/> 숙박 인원 : ${reservation.r_people}<br><h3>가격은 총 ${reservation.r_price }만원 입니다.</h3><br><br>
      
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
</body>
</html>