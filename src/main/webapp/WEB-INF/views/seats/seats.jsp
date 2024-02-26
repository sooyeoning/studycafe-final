<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<script src="/js/seats/seats.js"></script>
 	
		<%@ include file="../header.jsp"%>	
		
		<div class="max-wd800 center h250" id="subtitle">
		
		<select id="newPlace" class="mt-10" onChange="getSeatsImage(this)">
			<option value="117" selected>방이점</option>
			<option value="118">고덕점</option>
			<option value="119">잠실학원사거리점</option>
		</select>
		<h4 class="max-wd800 center mb-100">방문을 환영합니다</h4>
		
		<div class="mt-40">
		<button class="max-wd800 center buyTicketBtn">좌석권 구매</button>
		</div>
		<p class="mt-50" id="totalCounts"></p>
		</div>
		<!-- 전체 좌석수, 예약된 좌석수 -->
		<!-- 지점마다 (이미지)좌석도 + html  -->
		<!-- 빈 자리 갯수, 예약된 자리 갯수 -->
		
		<div class="result"></div>
</body>
</html>

<style>
.buyTicketBtn{
	width: 200px;
 	height: 40px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
}
.h250{
height: 250px;
}
.mt-50{
	margin-top: 50px;
}
.mt-10{
	margin-top: 10px;
}
.mt-40{
	margin-top: 40px;
}
.mb-10{
	margin-bottom: 10px;
}
.mb-100{
	margin-bottom: 100px;
}
select{
 	width: 400px; 
 	height: 40px;
 	font-size: 25px;
    appearance: none;
    -webkit-appearance: none; /* 사파리, 크롬 하위버전용 */
    -moz-appearance: none; /* 사파리, 크롬 하위버전용 */      
     border: 1px solid white;     
     box-sizing: border-box;          
     background-image: url(../images/select_icon.png);
     background-repeat: no-repeat;
     background-position: calc(100% - 10px) center;                  
}
select::-ms-expand{ /* 익스플로러용 */
	display: none; 
} 
body {
margin: 0;
font-family: "Noto Sans","맑은 고딕","Malgun Gothic",Arial,Helvetica,sans-serif,Lucida,Grande,"Microsoft YaHei","Hiragino Sans GB",SimSun,Meiryo;
}
.nav {
	width: 80%;
	margin: 0 auto;
	color: black;
}
small {
	font-size: 13px;
	color: black;
}

.max-wd800 {
	max-width: 800px;
}

.center {
	margin: 0 auto;
}

.seat {
	width: 50px;
	height: 50px;
	border: 1px solid gray;
	z-index: 9999;
}
.selectedSeat {
	width: 50px;
	height: 50px;
	border: 1px solid #20C997;
	z-index: 9999;
	background-color: #20C997;
}
.reservedSeat {
	width: 50px;
	height: 50px;
	border: 1px solid #737373;
	z-index: 9999;
	background-color: #737373;
}
.myReservedSeat {
	width: 50px;
	height: 50px;
	border: 1px solid #FFDE59;
	z-index: 9999;
	background-color: #FFDE59;
}
.seat-image {
	width: 901px;
	position: absolute;
	z-index: 1;
	
}
.rows {
	display: flex;
}
.relative {
	position: relative;
	z-index: 9999;
}

</style>