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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/mypage/deleteUser.js"></script>
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
		<h5 class="max-wd600 center mb-50">회원 탈퇴</h5>
		<p class="max-wd600 center">주의사항</p>
		<p class="max-wd600 center">✅ 탈퇴시 기존에 사용하던 좌석권은 환불 불가합니다.</p>
		<p class="max-wd600 center">✅ 재가입하더라도 기존에 사용하던 좌석권은 사용 불가합니다.</p>
		<p class="max-wd600 center mb-50">✅ 회원 탈퇴 하시겠습니까?</p>

		<div class="max-wd600 center">
			<button type="button" class="submitBtn btn btn-outline-secondary"
				value="${id }">확인</button>
			<button type="button" class="cancelBtn btn btn-outline-secondary">취소</button>
		</div>	
	</div>

</body>
</html>

<style>
.pt-10{
	padding-top: 10px;
}
.mb-50 {
	margin-bottom: 50px !important;
}
.card {
    --bs-card-border-color: #20c997;
 }
.menu{
	border: 2px solid #20c997 !important;
	border-radius: 20px;
}
.color{
	color: #20c997;
}
.mb-10 {
	margin-bottom: 10px !important;
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
.border {
	border: 1px solid gray;
	border-radius: 5px;
}

.center {
	margin: 0 auto;
}
.nav{
	border-bottom: 1px solid #20c997;
	width: 80%;
	margin: 0px auto 30px;
}
.submitBtn, .cancelBtn {
	margin-top: 3%;
	margin-bottom: 3%;
	width: 250px;
	background-color: #20c997;
	border-color: white;
	color: white;
}
</style>