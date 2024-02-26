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
<script src="/js/imagePreview.js"></script>
</head>

<body>
	<%@ include file="../header.jsp" %>

	<ul class="nav justify-content-center menu">
		<li class="nav-item">
			<a class="nav-link active" href="#">정보 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/web/mypage/password">비밀번호 수정</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/web/mypage/out/auth">회원 탈퇴</a>
		</li>
	</ul>

	<div class="card maxwd-80 center">

	<form:form class="g-3 align-items-center max-wd800 center pt-10"
		method="post" modelAttribute="patchUserReq" action="/mypage/update" encType="multipart/form-data">

		<h5 class="max-wd600">프로필 사진 변경</h5>
		<c:choose>
			<c:when test="${not empty patchUserReq.uploadFileName }">
				<img id="preview" class="profile"
					src="http://localhost:8080/mypage/${patchUserReq.uploadFileName }" />
			</c:when>
			<c:otherwise>
				<img id="preview" class="profile" src="/images/basicProfile.png" />
			</c:otherwise>
		</c:choose>
		<input type="file" name="userImageDTO.userImage" id="imageFile">
		
		<hr>
		
		<h5 class="max-wd600">기본 정보 변경</h5>
		
		<div class="col-auto max-wd600 center">
			<label for="name" class="form-label">이름</label>
			<form:input type="text" class="form-control" id="name" name="name"
				path="name" value="${userEntity.name }" />
		<p class="col-red">
				<form:errors path="name" />
			</p>
		</div>

		<form:input type="hidden" class="form-control" id="id" name="id"
			path="id" value="${userEntity.id }" />

		<div class="col-auto max-wd600 center">
			<label for="nickname" class="form-label">닉네임</label>
			<form:input type="text" class="form-control" id="nickname"
				name="nickname" path="nickname" value="${userEntity.nickname }" />
		<p class="col-red">
				<form:errors path="nickname" />
			</p>
		</div>

		<div class="col-auto max-wd600 center">
		<label for="address" class="form-label">관심 있는 지역</label>
		<form:select id="address" class="form-select" path="address" value="${userEntity.address }">
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
		<p class="col-red">
			<form:errors path="address" />
		</p>
		</div>

		<!-- 지점 선택: 관심 있는 지역의 지점만 보여줄 것이냐? 아니면 전지역 지점 보여줄 것이냐? -->
		<div class="col-auto max-wd600 center">
		<label for="placeId" class="form-label">사용 지점 선택</label>
		<form:select id="placeId" class="form-select" path="placeId" value="${userEntity.placeId }">
			<form:option value="118">고덕점</form:option>
			<form:option value="117">방이점</form:option>
			<form:option value="120">송파역점</form:option>
			<form:option value="116">잠실새내역점</form:option>
			<form:option value="119">잠실학원사거리점</form:option>
			<form:option value="121">대치학원가사거리점</form:option>
			<form:option value="122">대치은마점</form:option>
			<form:option value="123">강남도곡점</form:option>
			<form:option value="124">강남역점</form:option>
		</form:select> 
		</div>
		
		<button type="submit" class="submitBtn btn btn-outline-secondary">정보
			수정</button>
	</form:form>
</div>
</body>
</html>
<style>
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

.profile {
	width: 300px;
	height: 300px;
	display: block;
	margin: 2% 0;
}

</style>