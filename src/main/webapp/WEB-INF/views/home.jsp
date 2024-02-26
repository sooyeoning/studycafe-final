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

	<c:choose>
		<c:when test="${sessionScope.isLogin != true }">
			<%@ include file="./nonUserPlaceList.jsp"%>
		</c:when>

		<c:otherwise>
			<c:set var="userNickname" value="${sessionScope.userNickname}"
				scope="session" />
			<c:set var="userRole" value="${sessionScope.userRole}"
				scope="session" />
			<c:set var="admin" value="admin" />

			<c:if test="${userRole eq 'admin' }">
				<%@ include file="./admin/placeList.jsp"%>
			</c:if>

			<c:if test="${userRole ne 'admin' }">
				<%@ include file="./place/placeList.jsp"%>
			</c:if>

		</c:otherwise>

	</c:choose>
</body>
</html>

<style>
p, html, body {
	margin: 0;
}

* {
	
}
</style>
