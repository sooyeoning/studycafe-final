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
<script src="/js/mypage/updateUserPwSuccess.js"></script>
</head>

<body>
	<!-- As a link -->
	<nav class="navbar bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">스터디 카페를 찾는 이로운 방법</a>
		</div>
	</nav>

	<ul class="nav justify-content-end">
		<li class="nav-item"><a class="nav-link" href="/web/mypage/info"><c:out
					value="${userNickname}" />님</a></li>
		<li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
	</ul>

	<ul class="nav justify-content-center">
		<li class="nav-item"><a class="nav-link" href="/web/mypage/info">정보
				수정</a></li>
		<li class="nav-item"><a class="nav-link active" href="#">비밀번호
				수정</a></li>
		<li class="nav-item"><a class="nav-link" href="/web/mypage/out/auth">회원
				탈퇴</a></li>
	</ul>

	<div class="g-3 align-items-center max-wd800 center border">
		<h5 class="max-wd600 center">비밀번호 변경</h5>
		<p class="max-wd600 center">이전에 사용한 적 없는 비밀번호가 안전합니다.</p>

		<form:form method="post" modelAttribute="patchUserPwReq"
			action="/web/mypage/password" class="max-wd600 center">

			<div class="col-auto max-wd600 center">
				<label for="userId" class="col-form-label">아이디</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="text" id="userId" class="form-control"
					path="userId" name="userId" value="${sessionScope.userId }" readonly="true" />
				<p style="color: red">
					<form:errors path="userId" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="originPw" class="col-form-label">현재 비밀번호</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="originPw" class="form-control"
					path="originPw" name="originPw" />
				<p style="color: red">
					<form:errors path="originPw" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="newPw" class="col-form-label">변경할 비밀번호</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="newPw" class="form-control"
					path="newPw" name="newPw" />
				<p style="color: red">
					<form:errors path="newPw" />
				</p>
			</div>

			<div class="col-auto max-wd600 center">
				<label for="checkNewPw" class="col-form-label">변경할 비밀번호 확인</label>
			</div>
			<div class="col-auto max-wd600 center">
				<form:input type="password" id="checkNewPw" class="form-control"
					path="checkNewPw" name="checkNewPw" />
				<p style="color: red">
					<form:errors path="checkNewPw" />
				</p>
			</div>

			<form:button class="submitBtn btn btn-outline-secondary">확인</form:button>
		</form:form>

	</div>
</body>
</html>

<style>
.max-wd800 {
	max-width: 800px;
}

.max-wd600 {
	max-width: 600px;
}

.border {
	border: 1px solid gray;
	border-radius: 5px;
}

.center {
	margin: 0 auto;
}

.submitBtn {
	width: 300px;
	margin-top: 2rem;
	margin-bottom: 2rem;
}
.navbar-brand {
	margin: 0 auto;
}
</style>