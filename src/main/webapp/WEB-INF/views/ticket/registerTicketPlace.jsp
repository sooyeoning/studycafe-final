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
	<script src="/js/ticket/registerTicketPlace.js"></script>
 	
 	<%@ include file="../header.jsp" %>
 		<h3 class="max-wd800 center" style="margin-bottom: 50px; font-weight: bold;">좌석권 사용지점 변경/등록</h3>
 	
		<!-- 가져온 좌석 보여주기 -->
		<div class="ticketList wd800 center">
		<c:set var="code" value="${res.code }"></c:set>
			<p class="bb"><p id="info">좌석권 코드</p>
			<input id="code" type="text" readonly="readonly" value=<c:out value="${res.code }"></c:out>>
			<p class="bb"><p id="info">좌석권 종류</p><c:out value="${res.name }"></c:out>		
			<p class="bb"><p id="info">잔여시간</p><c:out value="${res.residualTimes }"></c:out>
			<p class="bb"><p id="info">현재 사용지점</p><c:out value="${res.placeName }"></c:out>			
		</div>
		<!-- 지역 선택 -->
		<div class="wd800 center" style="padding-top: 50px;">
		<p style="padding-left: 10px;">📋 새로운 사용 지점 선택</p>
		<select id="areaCode">
			<option value="99">지역선택</option>
			<option value="01">강동구</option>
			<option value="02">송파구</option>
			<option value="03">강남구</option>
			<option value="04">서초구</option>
			<option value="05">관악구</option>
			<option value="06">동작구</option>
			<option value="07">영등포구</option>
			<option value="08">금천구</option>
			<option value="09">구로구</option>
			<option value="10">양천구</option>
			<option value="11">강서구</option>
		</select> 
		<!-- 지역에 맞는 지점 가져오기 -->
		<select id="place">
			<option value="99">지점선택</option>
		</select> 

		<button class="submitBtn">등록하기</button>
		</div>
		
</body>
</html>

<style>
body {
margin: 0;
font-family: "Noto Sans","맑은 고딕","Malgun Gothic",Arial,Helvetica,sans-serif,Lucida,Grande,"Microsoft YaHei","Hiragino Sans GB",SimSun,Meiryo;
}
input{
	margin-left: 0;
	padding-left: 0;
	
	border: none;
}
small {
	font-size: 13px;
	color: #653517;
}
#info{
	display: inline-block;
	width: 400px;
	padding-left: 10px;
}
.bb{
	border-bottom: 1px solid #dee2e6;
}
select{
 	width: 380px; 
 	height: 40px;
 	font-size: 15px;
    appearance: none;
    -webkit-appearance: none; /* 사파리, 크롬 하위버전용 */
    -moz-appearance: none; /* 사파리, 크롬 하위버전용 */      
     border: 1px solid #20c997;     
     box-sizing: border-box;          
     background-image: url(/images/select_icon.png);
     background-repeat: no-repeat;
     background-position: calc(100% - 10px) center;    
     display: inline-block;  
     padding: 10px; 
     margin-bottom: 10px;    
     margin-left: 10px;       
}
select::-ms-expand{ /* 익스플로러용 */
	display: none; 
} 
.max-wd800 {
	max-width: 800px;
}
.wd800{
	width: 800px;
}
.center {
	margin: 0 auto;
}

.submitBtn{
	width: 200px;
 	height: 40px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
	display: block;
	float: right;
	margin-top: 10px;
	margin-right: 10px;
}
</style>