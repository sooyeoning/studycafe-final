<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

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

</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/user/login.js"></script>

	<%@ include file="../header.jsp"%>
	
	<div class="card maxwd-80 center">
		<div class="card-body">
				<div class="subtitle">
				<h5 class="card-title max-wd600 center" style="margin-top: 10px; margin-bottom: 10px;">좌석 예약부터 내 관심 장소 저장까지!</h5>
				<h5 class="card-title max-wd600 center">로그인 후 이용해보세요</h5>
				</div>
				
				<div class="col-auto center max-wd600">
					<label for="inputUserId" class="col-form-label">아이디</label>
				</div>
				<div class="col-auto center max-wd600 mb-10">
					<input type="text" id="inputUserId" class="form-control mb-10"
						aria-describedby="idHelpInline">
					<p class="idHelpInline col-red center max-wd600" ></p>
				</div>
		
				<div class="col-auto center max-wd600">
					<label for="inputUserPw" class="col-form-label">비밀번호</label>
				</div>
				<div class="col-auto center max-wd600 mb-10">
					<input type="password" id="inputUserPw" class="form-control mb-10 pos-rl" 
						aria-describedby="pwHelpInline">
					<div class="pos-ab color">
						<i id="eye" class="fi fi-rr-eye"></i>
					</div>
					<p class="pwHelpInline col-red center max-wd600 mb-10"></p>
				</div>
		
				<div class="helpInline center col-red center max-wd600"></div>
		
				<div class="center max-wd600">
				<button type="button" class="submitBtn btn btn-outline-secondary">로그인</button>
				</div>
				
				<ul class="nav justify-content-center">
					<li class="nav-item"><a class="nav-link" href="/user/findId">아이디
							찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="/user/findPw">비밀번호
							찾기</a></li>
				</ul>
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
.mb-10 {
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
