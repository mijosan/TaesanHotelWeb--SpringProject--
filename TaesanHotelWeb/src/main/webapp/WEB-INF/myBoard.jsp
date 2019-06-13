<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<html>
<head>
<meta charset="EUC-KR">
<title>내가 쓴 글 보기</title>
<style>
 /*CheckBox*/
.checkbox label:after, 
.radio label:after {
    content: '';
    display: table;
    clear: both;
}

.checkbox .cr,
.radio .cr {
    position: relative;
    display: inline-block;
    border: 1px solid #a9a9a9;
    border-radius: .25em;
    width: 1.3em;
    height: 1.3em;
    float: left;
    margin-right: .5em;
}

.radio .cr {
    border-radius: 50%;
}

.checkbox .cr .cr-icon,
.radio .cr .cr-icon {
    position: absolute;
    font-size: .8em;
    line-height: 0;
    top: 50%;
    left: 20%;
}

.radio .cr .cr-icon {
    margin-left: 0.04em;
}

.checkbox label input[type="checkbox"],
.radio label input[type="radio"] {
    display: none;
}

.checkbox label input[type="checkbox"] + .cr > .cr-icon,
.radio label input[type="radio"] + .cr > .cr-icon {
    transform: scale(3) rotateZ(-20deg);
    opacity: 0;
    transition: all .3s ease-in;
}

.checkbox label input[type="checkbox"]:checked + .cr > .cr-icon,
.radio label input[type="radio"]:checked + .cr > .cr-icon {
    transform: scale(1) rotateZ(0deg);
    opacity: 1;
}

.checkbox label input[type="checkbox"]:disabled + .cr,
.radio label input[type="radio"]:disabled + .cr {
    opacity: .5;
}
  /*CheckBox*/
  
  /*ajax 로딩창*/
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
<div class="wrap-loading display-none">

    <div><img src="./resources/images/loading.gif" /></div>

</div>  
	<%@include file="nav.jsp" %>
	<!--게시판 테이블-->
	<div class="container" >
	<ul class="nav nav-tabs">
	  <li class="active"><a href="#getMyBoardList.do">내가 쓴 글 보기</a></li>
	  <li><a href="getMyCommentList.do">내가 쓴 댓글 보기</a></li>
	</ul>
	
	<!--내가 쓴 글 보기-->
	<div class="tab-content">
	  <div id="home" class="tab-pane fade in active">
	    	<table class="table table table-striped table-bordered table-hover">
		<tr>
			<th style="width:65%" class="text-center">제목</th>
			<th class="text-center">날짜</th>
			<th class="text-center">조회수</th>
		</tr>
		<tbody>
		<c:forEach items="${boardList}" var="board">
			<tr>
				<td>
					<div class="checkbox">
			          <label>
			            <input type="checkbox" value="${board.seq}" class="ckBox" name="ckBox">&nbsp;&nbsp;&nbsp; ${board.seq} &nbsp;&nbsp;&nbsp;
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
				            <a href="getBoard.do?seq=${board.seq}&message=success">
								${board.title}
								<c:if test="${board.fileName != null}">
									<img src="./resources/images/fileIcon.png">
								</c:if>
								<c:if test="${board.c_cnt>0}">
									<span style="color:red">[${board.c_cnt}]</span>
								</c:if>
								<span id="newIcon${board.seq}"></span>
							</a>
			          </label>
			        </div>
				</td>
				<td class="text-center" style="vertical-align: middle;">${board.regDate }</td>
				<td class="text-center" style="vertical-align: middle;">${board.cnt}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
		<tr>
			<td>
				<div class="checkbox">
					<label>
						<input type="checkbox" id="allCheck"> 전체선택
						<span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
					</label>
				</div>
			</td>
			<td style="text-align:right;">
				<a class="btn btn-default" href="writeCheck.do">글쓰기</a>	
				<a class="btn btn-default" id="deleteBtn">삭제</a>
			</td>
		</tr>	
	</table>
	<!--페이징-->

	<div class="text-center">
		<ul class="pagination">
		<!--이전페이지-->
		<c:if test="${page.prev}">
			<li class="page-item">
      			<a class="page-link" href="javascript:page(${page.startPage-1})" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
        			<span class="sr-only">Previous</span>
      			</a>
   			</li>
   		</c:if>
   		
   		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="idx">
			<li <c:out value="${page.pagenum == idx ? 'class=active' : ''}"/>><a href="javascript:page(${idx})">${idx}</a></li>
		</c:forEach>
			
		<!--다음페이지-->
		<c:if test="${page.next}">
			 <li class="page-item">
     			<a class="page-link" href="javascript:page(${page.endPage+1})" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
        			<span class="sr-only">Next</span>
     			</a>
   			 </li>
   		</c:if>
		</ul>
	</div>	
	<!--페이징-->
	  </div>


	  </div>
	
	</div>

	<!--게시판 테이블-->
	<%@include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./resources/js/bootstrap.js"></script>
	<script>
	
		function page(idx){
			var pagenum = idx;
			location.href="getMyBoardList.do?pagenum="+pagenum;
		}

	$(document).ready(function(){
		$("#allCheck").click(function(){
			$(".ckBox").prop("checked",this.checked);
		});
		
		
		$("#deleteBtn").click(function(){
			if(confirm("정말 삭제 하시겠습니까?")){
				$("input[name=ckBox]:checked").each(function(){
					var seq = $(this).val();
					
					$.ajax({
						type : 'post',
						url : "deleteMyBoard.do",
						contentType : "application/json",
						data : JSON.stringify({"seq":seq}),
						dataType : "text",
						success : function(result){	
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
			        		alert("글이 삭제 되지 않았습니다");
			        	}
					});
				});
			}else{
				
			}
		});
		
		var list = ${list};
		var boardList = new Array();
		
		$.each(list, function( index, value ) {
			boardList[index] = value
		});
		
		/* 오늘 날짜계산(day) */
		var now = new Date();

	      var year= now.getFullYear();
	      var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	      var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	              
	      var nowDays = new Date(year,mon,day);
	      
	      /* 오늘 날짜계산(day) */
	     
	      
	      
	      /* 게시판 날짜계산(day) */
	     
	      var boardRegdate = new Array();
	      
	      
	      var list2 = ${list};
	      $.each(list2, function( index, value ) {
	    	  
	    	  boardRegdate[index] = new Date(value.regDate.substring(0,4),value.regDate.substring(5,7),value.regDate.substring(8,10));
	    	  boardRegdate[index] = nowDays.getTime() - boardRegdate[index].getTime();
	    	  boardRegdate[index] = boardRegdate[index] / (1000*60*60*24);
			  
			});
		  
	   
	     //new Icon 추가
	     for(var i=0;i<boardRegdate.length;i++){
	    	 if(boardRegdate[i]<8){
	    		 $("#newIcon"+boardList[i].seq).html("<img src='./resources/images/newIcon.png'>");
	    	 }
	     }
	});
	</script>
</body>
</html>