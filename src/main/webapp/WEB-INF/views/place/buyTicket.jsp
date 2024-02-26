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
	<script src="/js/ticket/buyTicket.js"></script>
 	
	<%@ include file="../header.jsp"%>	

		<h3 class="max-wd800 center" style="margin-bottom: 50px; font-weight: bold;">좌석 구매/등록현황</h3>
		
		<div class="buyTicket wd800 center">
		<p>🧺 좌석권 구매</p>
		<select id="ticket">
			<option value="charge10hrs"> [시간충전권] 10시간</option>
			<option value="charge30hrs"> [시간충전권] 30시간</option>
			<option value="charge50hrs"> [시간충전권] 50시간</option>
			<option value="charge100hrs"> [시간충전권] 100시간</option>
			<option value="charge150hrs"> [시간충전권] 150시간</option>
			<option value="charge200hrs"> [시간충전권] 200시간</option>
			<option value="unreserved1weeks"> [정기이용권] 1주 자유석</option>
			<option value="unreserved2weeks"> [시간충전권] 2주 자유석</option>
			<option value="unreserved4weeks"> [시간충전권] 4주 자유석</option>
			<option value="reserved4weeks"> [시간충전권] 4주 고정석</option>
		</select>
		<button class="submitBtn">구매하기</button>
		</div>
		
		<!-- 가져온 좌석 보여주기 -->
		
		<div class="ticketList wd800 center bt">
		<p>🗓️ 좌석권 구매/등록 현황</p>
			<table id="result">
				<tr>
					<th class="wd200">티켓이름</th>
					<th class="wd100">잔여시간</th>
					<th class="wd200">사용지점</th>
					<th class="wd130">등록여부</th>
					<th></th>
				</tr>
			</table>
		</div>
		
</body>
</html>

<style>
.wd200{
width: 200px;
}
.wd100{
width: 100px;
}
.wd130{
width: 130px;
}
.buyTicket{
	height: 150px;
}
.ticketList{
	padding-top: 30px;
}
td, th{
	padding: 10px;
	border-bottom: 1px solid #dee2e6;}
select{
 	width: 800px; 
 	height: 40px;
 	font-size: 15px;
    appearance: none;
    -webkit-appearance: none; /* 사파리, 크롬 하위버전용 */
    -moz-appearance: none; /* 사파리, 크롬 하위버전용 */      
     border: 1px solid #dee2e6;     
     box-sizing: border-box;          
     background-image: url(../images/select_icon.png);
     background-repeat: no-repeat;
     background-position: calc(100% - 10px) center;    
     display: block;  
     padding: 10px;            
}
select::-ms-expand{ /* 익스플로러용 */
	display: none; 
} 
.bt{
     border-top: 1px solid #dee2e6;
}
body {
margin: 0;
font-family: "Noto Sans","맑은 고딕","Malgun Gothic",Arial,Helvetica,sans-serif,Lucida,Grande,"Microsoft YaHei","Hiragino Sans GB",SimSun,Meiryo;
}
.addBtn{
	width: 150px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
}
.header {
	width: 100%;
	height: 400px;
	background-image: url('https://modo-phinf.pstatic.net/20201207_215/1607319499477fKHlo_JPEG/mosaZniR1V.jpeg'); 
	background-position: center;
	background-size: 100%;
}

small {
	font-size: 13px;
	color: #653517;
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


.rows {
	display: flex;
}
.relative {
	position: relative;
	z-index: 9999;
}
.submitBtn{
	width: 200px;
 	height: 40px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
	float: right;
	margin-top: 10px;
}
</style>