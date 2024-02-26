<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 화면</title>
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
	<script src="/js/user/findPw.js"></script>

	<%@ include file="../header.jsp"%>

	<div class="card maxwd-80 center">	
		<div class="card-body">
				<div class="subtitle">
					<h5 class="card-title max-wd600 center" style="margin-top: 10px; margin-bottom: 10px;">비밀번호 찾기</h5>
					<h5 class="card-title max-wd600 center">회원가입시 입력했던 아이디와 이메일을 입력해주세요</h5>
				</div>
				<form:form method="post" modelAttribute="findPwReq"
					action="/user/findPw" class="max-wd600 center">
					<div class="col-auto max-wd600 center">
						<form:label path="userId" class="col-form-label">아이디</form:label>
						<form:input type="text" path="userId" class="form-control mb-10"
							aria-describedby="userIdHelpInline"></form:input>
						<p class="col-red mb-10">
							<form:errors path="userId" />
						</p>
					</div>
					<div class="col-auto max-wd600 center">
						<form:label path="email" class="col-form-label">이메일</form:label>
						<form:input type="text" path="email" class="form-control mb-10"
							aria-describedby="emailHelpInline"></form:input>
						<p class="col-red mb-10">
							<form:errors path="email" />
						</p>
					</div>
		
					<button type="submit" class="findPwBtn btn btn-outline-secondary">비밀번호 찾기</button>
				</form:form>
			</div>
		</div>
</body>
</html>

<style>
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
.subtitle{
	height: 100px; 
	
}
.col-red{
	color: red;
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

.findPwBtn {
	width: 600px;
	margin-top: 2rem;
	margin-bottom: 2rem;
	background-color: #20c997;
	border-color: white;
	color: white;
}
.center {
	margin: 0 auto;
}
</style>