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
<script src="/js/mypage/updateUserInfoAuth.js"></script>
</head>

<body>
	<!-- header -->
	<%@ include file="../header.jsp" %>

	<div class="card maxwd-80 center">
		<div class="card-body">
			<div class="subtitle">
				<h5 class="max-wd600 center mb-10">마이페이지</h5>
				<p class="max-wd600 center mb-10 color">회원정보를 수정할 수 있습니다.</p>
				<p class="max-wd600 center color">개인정보 보호를 위해 비밀번호를 입력해주세요</p>
			</div>
			<div class="col-auto max-wd600 center">
				<label for="inputUserId" class="col-form-label">아이디</label>
			</div>
			<div class="col-auto max-wd600 center mb-20">
				<input type="text" id="inputUserId" class="form-control"
				aria-describedby="idHelpInline" value="${sessionScope.userId }"
				readonly>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="inputUserPw" class="col-form-label">비밀번호</label>
			</div>
			<div class="col-auto max-wd600 center mb-20">
				<input type="password" id="inputUserPw" class="form-control pos-rl"
				aria-describedby="pwHelpInline">
				<div class="pos-ab color">
					<i id="eye" class="fi fi-rr-eye"></i>
				</div>
			</div>

			<div class="helpInline max-wd600 center col-red"></div>
		
			<div class="center max-wd600">
				<button type="button" class="submitBtn btn btn-outline-secondary">로그인</button>
			</div>			
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
	top: 260px;
	right: 330px;
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
.nav {
	width: 80%;
	margin: 0px auto 30px;
}
.maxwd-80{
	max-width: 80%;
}
.maxwd-40{
	max-width: 40%;
}
.max-wd600 {
	max-width: 600px;
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