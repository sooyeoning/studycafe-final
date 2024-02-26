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
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.1.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
	
</head>

<body>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/place/placeList.js"></script>

	<header>
		<%@ include file="../header.jsp"%>	
	</header>
		
			<div class="maxwd-80 center" id="searchDiv">
				<div class="max-wd800 center" style="margin-bottom: 10px;">
				<select id="areaCode" class="form-select" name="areaCode"
					aria-label="areaCode" required>
					<option value="99">지역별</option>
					<option value="99">전체 검색</option>
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
				
				<select id="rateId" class="form-select" name="rateId"
					aria-label="rateId" required>
					<option value="6">시간별</option>
					<option value="6">[충전권] 10시간</option>
					<option value="7">[충전권] 30시간</option>
					<option value="8">[충전권] 50시간</option>
					<option value="9">[충전권] 100시간</option>
					<option value="10">[충전권] 150시간</option>
					<option value="11">[충전권] 200시간</option>
					<option value="12">[기간권] 1주 자유석</option>
					<option value="13">[기간권] 2주 자유석</option>
					<option value="14">[기간권] 4주 자유석</option>
					<option value="15">[기간권] 4주 고정석</option>
				</select> 

				<input type="text" id="name" class="searchBox" placeholder="장소명">					

				<button type="submit" class="searchBtn btn">
					<i class="fi fi-rr-search color"></i>
				</button>
			</div>
			
			<div class="filter max-wd800 center">
 				<i class="fi fi-rr-settings-sliders color"></i> 필터로 최적의 장소 찾기 
 			
				<div class="optionMenus">
						<label class="selectAllDiv">
						<input type="checkbox" class="selectAll"> 전체 선택
						<i class="fi fi-rr-check color"></i>
						</label>
						<button type="button" class="noOptionSearchBtn btn">초기화
							<i class="fi fi-rr-refresh color"></i>
						</button>
					</div>
			</div>
		
			<br>
			
			<div class="max-wd800 center">
			<input type="checkbox" class="btn-check bookstand"
				id="btn-check-2-outlined bookstand" name="option" value="9">
			<label class="btn" for="btn-check-2-outlined bookstand"> <small>#담요</small>
			</label> <input type="checkbox" class="btn-check bookstand"
				id="btn-check-2-outlined bookstand" name="option" value="10">
			<label class="btn" for="btn-check-2-outlined bookstand"> <small>#독서대</small>
			</label> <input type="checkbox" class="btn-check phoneCharger"
				id="btn-check-2-outlined phoneCharger" name="option" value="11">
			<label class="btn" for="btn-check-2-outlined phoneCharger"> <small>#핸드폰
					충전기</small>
			</label> <input type="checkbox" class="btn-check lamp"
				id="btn-check-2-outlined lamp" name="option" value="12"> <label
				class="btn" for="btn-check-2-outlined lamp"> <small>#스탠드</small>
			</label> <input type="checkbox" class="btn-check cushion"
				id="btn-check-2-outlined cushion" name="option" value="13">
			<label class="btn" for="btn-check-2-outlined cushion"> <small>#방석</small>
			</label> <input type="checkbox" class="btn-check coffee"
				id="btn-check-2-outlined coffee" name="option" value="1"> <label
				class="btn" for="btn-check-2-outlined coffee"> <small>#커피</small>
			</label> <input type="checkbox" class="btn-check drinks"
				id="btn-check-2-outlined drinks" name="option" value="2"> <label
				class="btn " for="btn-check-2-outlined drinks">
				<small>#음료</small>
			</label> <input type="checkbox" class="btn-check snack"
				id="btn-check-2-outlined snack" name="option" value="3"> <label
				class="btn " for="btn-check-2-outlined snack">
				<small>#간식</small>
			</label> <input type="checkbox" class="btn-check cafeteria"
				id="btn-check-2-outlined cafeteria" name="option" value="15">
			<label class="btn" for="btn-check-2-outlined cafeteria"> <small>#취식가능</small>
			</label> <input type="checkbox" class="btn-check wifi"
				id="btn-check-2-outlined wifi" name="option" value="14"> <label
				class="btn" for="btn-check-2-outlined wifi"> <small>#와이파이</small>
			</label> <input type="checkbox" class="btn-check seperate_restroom"
				id="btn-check-2-outlined seperate_restroom" name="option" value="16">
			<label class="btn" for="btn-check-2-outlined seperate_restroom">
				<small>#남/여 구분된 화장실</small>
			</label> <input type="checkbox" class="btn-check locker"
				id="btn-check-2-outlined locker" name="option" value="6"> <label
				class="btn" for="btn-check-2-outlined locker"> <small>#사물함</small>
			</label> <input type="checkbox" class="btn-check meetingRoom"
				id="btn-check-2-outlined meetingRoom" name="option" value="8">
			<label class="btn" for="btn-check-2-outlined meetingRoom"> <small>#회의실</small>
			</label> 
			<input type="checkbox" class="btn-check parking"
				id="btn-check-2-outlined parking" name="option" value="7"> 
				<label class="btn" for=" parking"> 
				<small>#주차</small>
			</label> 
			<input type="checkbox" class="btn-check printer"
				id="btn-check-2-outlined printer" name="option" value="4"> <label
				class="btn" for="btn-check-2-outlined printer"> <small>#프린터</small>
			</label> 
			<input type="checkbox" class="btn-check scanner"
				id="btn-check-2-outlined scanner" name="option" value="5"> <label
				class="btn" for="btn-check-2-outlined scanner"> <small>#스캐너</small>
			</label>
			</div>
				
	
			
		</div>


	<div class="result" style="display: inline"></div>
	
<%-- 	<%@ include file="../footer.jsp" %>
 --%></body>
</html>

<style>
.color{
	color: #20c997;
}
body {
margin: 0;
font-family: "Noto Sans","맑은 고딕","Malgun Gothic",Arial,Helvetica,sans-serif,Lucida,Grande,"Microsoft YaHei","Hiragino Sans GB",SimSun,Meiryo;

}
.maxwd-80{
	max-width: 80%;
}
.nav {
	width: 80%;
	margin: 0px auto 30px;
}
.form-select {
	width: initial;
	border: 1px solid #20c997;
	border-radius: 15px;
	display: inline-block;
}
small {
	font-size: 13px;
}
.btn {
	border: 1px solid #20c997;
	border-radius: 15px;
	margin-bottom: 10px;
}
.searchBox {
	border-radius: 15px;
	padding: 6px;
	border: 1px solid #20c997;
}
option {
	color: black;
}
.card-title{
	color: black;
}
.searchBox {
	border-radius: 15px;
	padding: 6px;
	border: 1px solid #20c997;
}

#option-button {
	border: 0.2px solid #20c997;
	padding: 0.3rem;
	border-radius: 5px;
	margin: 0.1rem 0.2rem 0.3rem 0;
	margin: 0.1rem 0.2rem 0.3rem 0;
}

.options {
	border: 1px solid black;
	max-width: 800px;
	margin: 1% auto;
	border-radius: 5px;
	padding: 2%;
	height: 340px;
}

.max-wd800 {
	max-width: 800px;
}

.center {
	margin: 0 auto;
}

.option-title {
	margin: 10px 10px 10px 0;
}

input#name {
	width: 400px;
}

.form-select {
	width: 150px;
}


.noOptionSearchBtn {
	width: max-content;
	float: right;
}

.cursor {
	cursor: pointer;
}

#option-button {
	display: inline-block;
	width: 110px;
}

#option-button:active {
	background-color: #20c997;
}

.optionImage {
	width: 20px;
	height: 20px;
}

.thumbnail {
	height:200px;
	object-fit: fill;
}
.col-md-8 {
	background-image: url('../images/grass.png');
	background-repeat: no-repeat;
	background-position: right top;
	background-size: 200px 130px;
}

.card {
	border-color: #20c997;
}
.cardOpt {
	border: 1px solid #20c997; 
	width: max-content; 
	padding: 6px;
	border-radius: 15px; 
	display: block;
	margin: 2px;
}
.selectAllDiv {
	border: 1px solid #20c997;
	padding: 6px 12px;
	display: inline-block;
	border-radius: 15px;
	cursor: pointer;
	margin-right: 10px;
}
input[type="checkbox"]:checked + label {
  color: #34b93d;
}
input[type="checkbox"] {
  display: none;
}
.nav-link{
color: black;
}
.optionMenus{
float: right;
}
</style> 
