<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
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
<script src="/js/user/signup_email.js"></script>

</head>

<body>

	<%@ include file="../header.jsp"%>

	<div class="g-3 align-items-center maxwd-80 center border">

		<form:form method="post" modelAttribute="signUpReq" action="/signup"
			class="max-wd600 center">
			<h5 class="mt-20 mb-20">회원가입</h5>

			<div class="center disp-web mb-10">
				<label for="userId" class="form-label ">아이디</label>
				<form:input type="text" class="form-control" id="userId"
					name="userId" path="userId" />
				<p class="col-red mb-10">
					<form:errors path="userId" />
				</p>

			</div>

			<div class="center disp-web mb-10">
				<label for="userPw" class="form-label">비밀번호</label>
				<form:input type="password" class="form-control pos-rl" id="userPw"
					name="userPw" path="userPw" />
				<div class="pos-ab color pw pos-adjust-pw">
					<i id="eye" class="fi fi-rr-eye"></i>
				</div>
				<p class="col-red mb-10">
					<form:errors path="userPw" />
				</p>
			</div>

			<div class="center disp-web mb-10">
				<label for="checkPw" class="form-label">비밀번호 중복확인</label>
				<form:input type="password" class="form-control pos-rl" id="checkPw"
					name="checkPw" path="checkPw" />
				<div class="pos-ab color pwDoubleCheck pos-adjust-pwCheck">
					<i id="eyeDoubleCheck" class="fi fi-rr-eye"></i>
				</div>
				<p class="col-red mb-10">
					<form:errors path="checkPw" />
				</p>
			</div>
			
			<!-- 지점 선택: 카테고리 -->
			<label for="address" style="margin-bottom: 10px;">관심 있는 지역</label>
			<form:select id="address" class="form-select" path="address" >
				<form:option value="99">전지역</form:option>
				<form:option value="01">강동구</form:option>
				<form:option value="02">송파구</form:option>
				<form:option value="03">강남구</form:option>
				<form:option value="04">서초구</form:option>
				<form:option value="05">관악구</form:option>
				<form:option value="06">동작구</form:option>
				<form:option value="07">영등포구</form:option>
				<form:option value="08">금천구</form:option>
				<form:option value="09">구로구</form:option>
				<form:option value="10">양천구</form:option>
				<form:option value="11">강서구</form:option>
			</form:select> 
				<p class="col-red mb-10">
				<form:errors path="address" />
			</p>
			
			<div class="center disp-web mb-10">
				<label for="name" class="form-label">이름</label>
				<form:input type="text" class="form-control" id="name" name="name"
					path="name" />
				<p class="col-red mb-10">
					<form:errors path="name" />
				</p>
			</div>

			<div class="center disp-web mb-10">
				<label for="nickname" class="form-label">닉네임</label>
				<form:input type="text" class="form-control" id="nickname"
					name="nickname" path="nickname" />
				<p class="col-red mb-10">
					<form:errors path="nickname" />
				</p>
			</div>

			<div class="position-ab center disp-web mb-10">
				<label for="email" class="form-label">이메일</label>
				<form:input type="email" class="form-control" id="email"
					name="email" path="email" placeholder="example@example.com" />
				<form:input type="hidden" class="hasSentEmailAuth"
					path="hasSentEmailAuth" value="false" />
				<form:button type="button"
					class="sendEmailAuthBtn btn btn-outline-secondary">인증번호 받기</form:button>
				<p class="emailHelp col-red mb-10">
					<form:errors path="hasSentEmailAuth" />
				</p>
				<p class="col-red mb-10">
					<form:errors path="email" />
				</p>
				<p class="emailDuplicateError col-red"></p>
			</div>


			<div class="position-ab center disp-web mb-10">
				<label for="emailAuth" class="form-label">인증번호</label> <input
					type="text" class="form-control" id="emailAuth">
				<form:input type="hidden" class="hasCheckedEmailAuth"
					path="hasCheckedEmailAuth" value="false" />
				<form:button type="button"
					class="checkEmailAuthBtn btn btn-outline-secondary">인증번호 확인</form:button>
				<p class="col-red mb-10">
					<form:errors path="hasCheckedEmailAuth" />
				</p>
			</div>

			<div class="col-12">
				<button type="submit" class="submitBtn btn btn-outline-secondary">회원가입</button>
			</div>
		</form:form>
		<!-- 	display: -webkit-box;
 -->
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
.pos-adjust-pw{
top: 256px;
right: 480px;
}
.pos-adjust-pwCheck{
    top: 335px;
    right: 480px;
}
.color{
	color: #20c997;
}
.mt-20{
	margin-top: 20px;
}
.mb-20{
	margin-bottom: 20px;
}
.card {
    --bs-card-border-color: #20c997;
 }
 .form-control {
	border: 1px solid #20c997;
	margin-bottom: 10px !important;
	
}
.maxwd-80{
	max-width: 80%;
}
.max-wd600 {
	max-width: 600px;
}
.col-red{
	color: red;
}
.border {
	border: 1px solid #20c997 !important;
	border-radius: 5px;
}

.center {
	margin: 0 auto;
}

label {
	width: 10rem;
}

.mb-10 {
	margin-bottom: 10px !important;
}

.checkEmailAuthBtn, .sendEmailAuthBtn {
	position: relative;
	left: 472px;
	bottom: 48px;
	background-color: #20c997;
	border-color: white;
	color: white;
}

.submitBtn {
	width: 600px;
	margin: 3% 0;
	background-color: #20c997;
	border-color: white;
	color: white;
	
}
</style>
