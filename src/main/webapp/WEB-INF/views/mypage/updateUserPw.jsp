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
<script src="/js/mypage/updateUserPw.js"></script>

</head>

<body>
	<%@ include file="../header.jsp" %>

	<ul class="nav justify-content-center menu">
		<li class="nav-item">
			<a class="nav-link active" href="/mypage">정보 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="#">비밀번호 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/web/mypage/out/auth">회원 탈퇴</a>
		</li>
	</ul>

	<div class="card maxwd-80 center pt-10">

		<form:form method="post" modelAttribute="patchUserPwReq"
			action="/web/mypage/password" class="max-wd600 center">
		<h5 class="max-wd600">비밀번호 변경</h5>
		<p class="max-wd600 color">이전에 사용한 적 없는 비밀번호가 안전합니다.</p>

			<div class="col-auto max-wd600 center">
				<label for="userId" class="col-form-label">아이디</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="text" id="userId" class="form-control"
					path="userId" name="userId" value="${sessionScope.userId }" readonly="true" />
				<p class="col-red">
					<form:errors path="userId" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="originPw" class="col-form-label">현재 비밀번호</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="originPw" class="form-control pos-rl"
					path="originPw" name="originPw" />
				<div class="pos-ab color eye1">
					<i id="eye1" class="fi fi-rr-eye"></i>
				</div>
				<p class="col-red">
					<form:errors path="originPw" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="newPw" class="col-form-label">변경할 비밀번호</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="newPw" class="form-control pos-rl"
					path="newPw" name="newPw" />
				<div class="pos-ab color eye2">
					<i id="eye2" class="fi fi-rr-eye"></i>
				</div>
				<p class="col-red">
					<form:errors path="newPw" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="checkNewPw" class="col-form-label">변경할 비밀번호 확인</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="checkNewPw" class="form-control pos-rl"
					path="checkNewPw" name="checkNewPw" />
				<div class="pos-ab color eye3">
					<i id="eye3" class="fi fi-rr-eye"></i>
				</div>
				<p class="col-red">
					<form:errors path="checkNewPw" />
				</p>
			</div>

			<form:button class="submitBtn btn btn-outline-secondary">확인</form:button>
		</form:form>

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
}
.eye1{
	top: 219px;
    right: 330px;
}
.eye2{
	top: 310px;
    right: 330px;
}
.eye3{
    right: 330px;
	bottom: 95px;
}
.pt-10{
	padding-top: 10px;
}
.menu{
	border: 2px solid #20c997 !important;
	border-radius: 20px;
}
.nav{
	border-bottom:  1px solid #20c997;
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
.nav {
	width: 80%;
	margin: 0px auto 30px;
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