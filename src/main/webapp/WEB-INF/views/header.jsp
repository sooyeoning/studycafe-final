<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
<header>
	<c:set var="userNickname" value="${sessionScope.userNickname}" scope="session" />
	<c:set var="userRole" value="${sessionScope.userRole}" scope="session" />
	<c:set var="admin" value="admin" />
	<c:choose>
		<c:when test="${sessionScope.isLogin != true }">
			<ul class="nav justify-content-end bd-green">
				<li class="nav-item"><a class="nav-link" href="/">장소 검색</a></li>
				<li class="nav-item"><a class="nav-link" href="/seats/guest">좌석 예약</a></li>
				<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="/signup">회원가입</a></li>
			</ul>

		</c:when>
		
		<c:when test="${sessionScope.userRole == 'admin'}">
			<ul class="nav justify-content-end bd-green">
				<li class="nav-item"><a class="nav-link" href="/">HOME</a></li>
				<li class="nav-item"><a class="nav-link" href="/place/post">장소 추가</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/web/mypage/info"><c:out value="${userNickname}" />님</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
			</ul>

		</c:when>

		<c:otherwise>

			<ul class="nav justify-content-end bd-green">
				<li class="nav-item"><a class="nav-link" href="/">장소 검색</a></li>
				<li class="nav-item"><a class="nav-link" href="/seats">좌석 예약</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/web/mypage/info"><c:out value="${userNickname}" />님</a></li>
				<li class="nav-item"><a class="nav-link" href="/user/logout">로그아웃</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
</header>
</body>
</html>

<style>
header {
 background-color: white;
 }
body {
	margin: 0;
	font-family: "Noto Sans", "맑은 고딕", "Malgun Gothic", Arial, Helvetica,
		sans-serif, Lucida, Grande, "Microsoft YaHei", "Hiragino Sans GB",
		SimSun, Meiryo;
}
.nav {
	width: 80%;
	margin: 0px auto 30px;
}
.nav-link {
	color: black;
}
.bd-green{
	border-bottom: 0.1px solid #20c997;
}
</style>