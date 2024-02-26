<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.1.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/mypage/deleteUserAuth.js"></script>
</head>

<body>
	<!-- As a link -->
	<%@ include file="../header.jsp" %>

	<ul class="nav justify-content-center menu">
		<li class="nav-item">
			<a class="nav-link active" href="/mypage">정보 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/web/mypage/password">비밀번호 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">회원 탈퇴</a>
		</li>
	</ul>
	
	<div class="card maxwd-80 center pt-10">
		<div class="max-wd600 center">
		
		<h5 class="max-wd600 ">회원 탈퇴</h5>
		<p class="max-wd600 ">본인여부를 확인하기 위해서 등록된 회원정보를 입력해주세요.</p>

		<div class="col-auto max-wd600">
			<label for="userId" class="col-form-label">아이디</label>
		</div>
		<div class="col-auto max-wd600 mb-10">
			<input type="text" id="userId" class="form-control"
				aria-describedby="idHelpInline">
		</div>

		<div class="col-auto max-wd600">
			<label for="userPw" class="col-form-label">비밀번호</label>
		</div>
		<div class="col-auto max-wd600 mb-10">
			<input type="text" id="userPw" class="form-control pos-rl"
				aria-describedby="pwHelpInline">
			<div class="pos-ab color">
				<i id="eye" class="fi fi-rr-eye"></i>
			</div>
		</div>

		<div class="helpInline col-red max-wd600 center"></div>


		<button type="button" class="submitBtn btn btn-outline-secondary"
			value="${userId }">확인</button>
		</div>
	</div>

</body>
</html>

<style>
.pos-rl{
	position: relative;
}
.pos-ab{
	position: absolute;
	top: 214px;
	right: 330px;
}
.pt-10{
	padding-top: 10px;
}
.menu{
	border: 2px solid #20c997 !important;
	border-radius: 20px;
}
.mb-10 {
	margin-bottom: 10px !important;
}
.nav{
	border-bottom: 1px solid #20c997;
	width: 80%;
	margin: 0px auto 30px;
}
.ml-25{
	margin-left: 25%;
}
.mb-20{
	margin-bottom: 20px !important;
}
.mb-10{
	margin-bottom: 10px !important;
}
.card {
    --bs-card-border-color: #20c997;
 }
.form-control {
	border: 1px solid #20c997;
}
.img-center{
	display: flex;
    justify-content: center;
}
.color{
	color: #20c997;
}
.subtitle{
	height: 100px; 
	
}
.col-red{
	color: red;
}
.max-wd800 {
	max-width: 800px;
}

.max-wd600 {
	max-width: 600px;
}
.maxwd-80{
	max-width: 80%;
}
.maxwd-40{
	max-width: 40%;
}
.center {
	margin: 0 auto;
}

.submitBtn {
	margin-top: 3%;
	margin-bottom: 3%;
	width: 600px;
	background-color: #20c997;
	border-color: white;
	color: white;
}
</style>