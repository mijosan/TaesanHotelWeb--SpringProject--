<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	/*navbar  */
	.navbar-default .navbar-brand:hover,
	.navbar-default .navbar-brand:focus{
		color:black;
		font-size:25px;
	}
	.navbar-default .navbar-nav > li > a:hover,
	.navbar-default .navbar-nav > li > a:focus{
		color:black;
		font-size:20px;
	}

	
	
	.navbar-default .navbar-nav > .active > a,
	.navbar-default .navbar-nav > .active > a:hover,
	.navbar-default .navbar-nav > .active > a:focus{
		color:black;
		background-color:black;
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
					<li><a href="location.jsp">위치<span class="sr-only"></span></a></li>
					<li><a href="introduce.jsp">이용안내</a></li>
					<li><a href="instructor.jsp">객실예약</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">고객센터<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="getBoardList.do">문의게시판</a></li>
					</ul>
					</li>
				</ul>
				<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="내용을 입력하세요">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form> -->
				<c:choose>
					<c:when test="${sessionScope.user == null }">
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
					</c:when>
					<c:otherwise>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
								aria-haspopup="true" aria-expanded="false">${user.id} 님<span class="caret"></span></a>
								<ul class="dropdown-menu">
								<li><a href="loginForm.jsp">회원정보</a></li>
								<li><a href="registerForm.jsp">객실예약 현황</a></li>
								<li role="presentation" class="divider"></li>
								<li><a href="logout.do">로그아웃</a></li>
							</ul>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</body>
</html>