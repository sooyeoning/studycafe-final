<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script src="/js/admin/placeList.js"></script>

	<%@ include file="../header.jsp"%>	

	<div class="maxwd-80 center" id="searchDiv">
		<div class="max-wd800 center mb-10">
			<select id="areaCode" class="form-select mr-5" name="areaCode"
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

			<input type="text" id="name" class="searchBox mr-5" placeholder="장소명">

			<!-- 옵션제외 기본 정보만 검색 -->
			<button type="button" class="btn btn-outline-secondary searchBtn">
				검색</button>
		</div>
	</div>
	
	<div class="result" style="display: inline"></div>
</body>
</html>

<style>
.h55{
height: 55px;
}
.fl-r{
float: right;
}
.color{
	color: #20c997;
}
.mr-5{
	margin-right: 5px;
 }
.mb-10{
	margin-bottom: 10px;
}
.mt-10{
	margin-top: 10px;
}
.pb-10{
	padding-bottom: 10px;
}
.pt-10{
	padding-top: 10px;
}
.maxwd-80{
	max-width: 80%;
}
.bt{
border-top: 1px solid #dee2e6;
}
.bd{
border-bottom: 1px solid #dee2e6;
}
body {
	margin: 0;
	font-family: "Noto Sans", "맑은 고딕", "Malgun Gothic", Arial, Helvetica,
		sans-serif, Lucida, Grande, "Microsoft YaHei", "Hiragino Sans GB",
		SimSun, Meiryo;
}

.form-select {
	width: 200px;
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
#deleteBtn{
	margin-top: 130px;
	margin-left: 10px;
}
#updateBtn{
	margin-top: 130px;
	margin-left: 200px;
}
.searchBtn{
width: 70px;}
#deleteSelectedBtn{
	background-color:white;
	border: 1px solid #dee2e6;
	
 }
.searchBox { /*검색창*/
	border-radius: 15px;
	padding: 6px;
	border: 1px solid #20c997;
}
input#name { /*검색창*/
	width: 500px;
}
.card-title {
	color: black;
}

.cardOpt {
	border: 1px solid #20c997; 
	width: max-content; 
	padding: 6px;
	border-radius: 15px; 
	display: block;
	margin: 2px;
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
.dis-inlineblock {
 	display: inline-block;
}
.option-title {
	margin: 10px 10px 10px 0;
}


.cursor {
	cursor: pointer;
}
#option-button {
	display: inline-block;
	width: 180px;
}
.card {
	background-image: url('../images/grass.png');
	background-repeat: no-repeat;
	background-position: right top;
	background-size: 200px 130px;
	border-color: #20c997;
}
.nav-link {
	color: black;
}

.optionMenus {
	float: right;
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

</style>