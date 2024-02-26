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
	<script src="/js/seats/reserveSeats.js"></script>
 
		<!-- 전체 좌석수, 예약된 좌석수 -->
		<!-- 지점마다 (이미지)좌석도 + html  -->
		<div class="max-wd800 center">
		<div class="seat-image seatContainer" >
 			<img src="../images/seats/118.png"/>
 			<div class="rows relative wd-100" id="move1">
				<div class="seat" id="1">1</div>
				<div class="seat" id="2">2</div>
			</div>
			<div class="rows relative wd-100" id="move2">
				<div class="seat" id="3">3</div>
				<div class="seat" id="4">4</div>
			</div>
			<div class="rows relative wd-100" id="move3">
				<div class="seat" id="5">5</div>
				<div class="seat" id="6">6</div>
			</div>
			<div class="rows relative wd-100" id="move4">
				<div class="seat" id="7">7</div>
				<div class="seat" id="8">8</div>
			</div>
		
			<div class="rows relative wd-50" id="move5">
				<div class="seat" id="9">9</div>
			</div>
			<div class="rows relative wd-100" id="move6">
				<div class="seat" id="10">10</div>
				<div class="seat" id="11">11</div>
			</div>
			<div class="rows relative wd-100" id="move7">
				<div class="seat" id="12">12</div>
				<div class="seat" id="13">13</div>
			</div>
			<div class="rows relative wd-100" id="move8">			
				<div class="seat" id="14">14</div>
				<div class="seat" id="15">15</div>
			</div>			
			<div class="rows relative wd-100" id="move9">
				<div class="seat" id="16">16</div>
				<div class="seat" id="17">17</div>
			</div>
			<div class="rows relative wd-50" id="move10">
				<div class="seat" id="18">18</div>
			</div>	
			<div class="rows relative wd-100" id="move11">
				<div class="seat" id="19">19</div>
				<div class="seat" id="20">20</div>
			</div>
			<div class="rows relative wd-100" id="move12">
				<div class="seat" id="21">21</div>
				<div class="seat" id="22">22</div>
			</div>
			<div class="rows relative wd-100" id="move13">
				<div class="seat" id="23">23</div>
				<div class="seat" id="24">24</div>
			</div>
			<div class="rows relative wd-100" id="move14">
				<div class="seat" id="25">25</div>
				<div class="seat" id="26">26</div>
			</div>
			<div class="rows relative wd-100" id="move15">
				<div class="seat" id="27">27</div>
				<div class="seat" id="28">28</div>
			</div>
			<div class="rows relative wd-100" id="move16">
				<div class="seat" id="29">29</div>
				<div class="seat" id="30">30</div>
			</div>
			<div class="rows relative wd-100" id="move17">
				<div class="seat" id="31">31</div>
				<div class="seat" id="32">32</div>
			</div>
			<div class="rows relative wd-100" id="move18">
				<div class="seat" id="33">33</div>
				<div class="seat" id="34">34</div>
			</div>
			<div class="rows relative wd-100" id="move19">
				<div class="seat" id="35">35</div>
				<div class="seat" id="36">36</div>
			</div>
			<div class="rows relative wd-100" id="move20">
				<div class="seat" id="37">37</div>
				<div class="seat" id="38">38</div>
			</div>
			<div class="rows relative wd-100" id="move21">
				<div class="seat" id="39">39</div>
				<div class="seat" id="40">40</div>
			</div>
			<div class="rows relative wd-100" id="move22">
				<div class="seat" id="41">41</div>
				<div class="seat" id="42">42</div>
			</div>
 				<div class="seat relative wd-50" id="move43">43</div>
				<div class="seat relative wd-50" id="move44">44</div>
				<div class="seat relative wd-50" id="move45">45</div>
				<div class="seat relative wd-50" id="move46">46</div>
				<div class="seat relative wd-50" id="move47">47</div>
				<div class="seat relative wd-50" id="move48">48</div>
				<div class="seat relative wd-50" id="move49">49</div>
				<div class="seat relative wd-50" id="move50">50</div>
			
		</div>
		
	</div>
	<div class="max-wd800 center buttons">
		<button class="reserveBtn" value="118">좌석 예약</button>
		<button class="returnBtn" value="118">좌석 반납</button>
	</div>

</body>
</html>

<style>
.reserveBtn, .returnBtn{
	width: 200px;
 	height: 40px;
	background-color: white;
	border: 2px solid #20c997;
	border-radius: 10px;
}
.buttons {
    display: block;
    position: absolute;
    z-index: 2;
    right: 260px;
    top: 1250px;
}
body {
margin: 0;
font-family: "Noto Sans","맑은 고딕","Malgun Gothic",Arial,Helvetica,sans-serif,Lucida,Grande,"Microsoft YaHei","Hiragino Sans GB",SimSun,Meiryo;
}
.nav {
	width: 80%;
	margin: 0 auto;
}
small {
	font-size: 13px;
	color: #653517;
}

.max-wd800 {
	max-width: 800px;
}
.wd-100{
width: 100px;
}
.wd-50{
width: 50px;
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
	border: 1px solid gray;
	z-index: 9999;
	background-color: blue;
}
.reservedSeat {
	width: 50px;
	height: 50px;
	border: 1px solid gray;
	z-index: 9999;
	background-color: gray;
}
.myReservedSeat {
	width: 50px;
	height: 50px;
	border: 1px solid gray;
	z-index: 9999;
	background-color: yellow;
}
.seat-image {
	width: 901px;
	position: absolute;
	z-index: 1;
	height: -webkit-fill-available;
}
.rows {
	display: flex;
}
.relative {
	position: relative;
	z-index: 9999;
}
#move1{
	top: -937px;
    right: -67px;
}
#move2{
	top: -987px;
	right: -267px;
}
#move3{
	top: -1034px;
    right: -470px;
}
#move4{
	top: -1084px;
    right: -670px;
}
#move5{
	top: -1135px;
    right: -813px;
}
#move6{
	top: -1137px;
    right: -67px;
}
#move7{
	 top: -1185px;
    right: -267px;
}
#move8{
	top: -1235px;
	right: -470px;
}
#move9{
	top: -1285px;
	right: -670px;
}
#move10{
	top: -1335px;
    right: -813px;
}
#move11{
	top: -1250px;
	right: -268px;
}
#move12{
	top: -1250px;
	right: -268px;
}
#move13{
	top: -1350px;
	right: -445px;
}
#move14{
	top: -1350px;
	right: -445px;
}
#move15{
	top: -1450px;
	right: -620px;
}
#move16{
	top: -1450px;
	right: -620px;
}
#move17{
	top: -1400px;
	right: -270px;
}
#move18{
	top: -1400px;
	right: -270px;
}
#move19{
	top: -1500px;
	right: -445px;
}
#move20{
	top: -1500px;
	right: -445px;
}
#move21{
	top: -1600px;
	right: -620px;
}
#move22{
	top: -1600px;
	right: -620px;
}
#move43{
    top: -1847px;
    left: 811px;}
#move44{
    top: -1845px;
    left: 811px;}
#move45{
    top: -1843px;
    left: 811px;}
#move46{
    top: -1841px;
    left: 811px;}
#move47{
    top: -1839px;
    left: 811px;}
#move48{
    top: -1837px;
    left: 811px;}
#move49{
    top: -1835px;
    left: 811px;}
#move50{
    top: -1833px;
    left: 811px;}
</style>