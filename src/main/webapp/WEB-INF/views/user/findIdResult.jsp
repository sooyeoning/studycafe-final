<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 화면</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/user/findIdResult.js"></script>

	<%@ include file="../header.jsp" %>

	<div class="card maxwd-80 center">
		<div class="card-body">
			<div class="subtitle">
				<h5 class="center max-wd600 mt-10 mb-10">회원님의 아이디를 확인해주세요</h5>
				<p class="center max-wd600"><%=request.getAttribute("userId")%></p>
			</div>
			<div class="center max-wd600">
			<button class="findPwBtn btn btn-outline-secondary">비밀번호 찾기</button>
			<button class="loginBtn btn btn-outline-secondary">로그인</button>
			</div>
		</div>
	</div>
</body>
</html>

<style>
.card {
    --bs-card-border-color: #20c997;
 }
.mt-10{
	margin-top: 10px !important;
}
.mb-10{
	margin-bottom: 10px !important;
}
.img-center{
	display: flex;
    justify-content: center;
}
.subtitle{
	height: 100px; 
	
}
.nav {
	width: 80%;
	margin: 0px auto 30px;
	border-bottom: 0.1px solid #20c997;
}
.nav-link {
	color: black;
}
.maxwd-80{
	max-width: 80%;
}
.max-wd600 {
	max-width: 600px;
}

.border {
	border: 1px solid #20c997;
	border-radius: 5px;
}

.center {
	margin: 0 auto;
}

.findPwBtn, .loginBtn {
	width: 240px;
	margin-top: 2rem;
	margin-bottom: 2rem;
	background-color: #20c997;
	border-color: white;
	color: white;
}

.navbar-brand {
	margin: 0 auto;
}
</style>