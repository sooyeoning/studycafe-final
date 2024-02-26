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
		<div class="seat-image seatContainer">
			<img src="../images/seats/117.png" />
			<div class="rows relative wd-250" id="move1">
				<div class="seat" id="19">19</div>
				<div class="seat" id="20">20</div>
				<div class="seat" id="21">21</div>
				<div class="seat" id="22">22</div>
				<div class="seat" id="23">23</div>
			</div>
			<div class="rows relative wd-250" id="move2">
				<div class="seat" id="24">24</div>
				<div class="seat" id="25">25</div>
				<div class="seat" id="26">26</div>
				<div class="seat" id="27">27</div>
				<div class="seat" id="28">28</div>
			</div>
			<div class="rows relative wd-250" id="move3">
				<div class="seat" id="29">29</div>
				<div class="seat" id="30">30</div>
				<div class="seat" id="31">31</div>
				<div class="seat" id="32">32</div>
				<div class="seat" id="33">33</div>
			</div>

			<div class="rows relative wd-250" id="move4">
				<div class="seat" id="34">34</div>
				<div class="seat" id="35">35</div>
				<div class="seat" id="36">36</div>
				<div class="seat" id="37">37</div>
				<div class="seat" id="38">38</div>
			</div>
			<div class="rows relative wd-250" id="move5">
				<div class="seat" id="39">39</div>
				<div class="seat" id="40">40</div>
				<div class="seat" id="41">41</div>
				<div class="seat" id="42">42</div>
				<div class="seat" id="43">43</div>
			</div>

			<div class="rows relative wd-250" id="move6">
				<div class="seat" id="44">44</div>
				<div class="seat" id="45">45</div>
				<div class="seat" id="46">46</div>
				<div class="seat" id="47">47</div>
				<div class="seat" id="48">48</div>

			</div>
			<div class="rows relative wd-250" id="move7">
				<div class="seat" id="49">49</div>
				<div class="seat" id="50">50</div>
				<div class="seat" id="51">51</div>
				<div class="seat" id="52">52</div>
				<div class="seat" id="53">53</div>
			</div>
			<div class="rows relative wd-250" id="move8">
				<div class="seat" id="54">54</div>
				<div class="seat" id="55">55</div>
				<div class="seat" id="56">56</div>
				<div class="seat" id="57">57</div>
				<div class="seat" id="58">58</div>
			</div>
			<div class="rows relative wd-100" id="move9">
				<div class="seat" id="1">1</div>
				<div class="seat" id="2">2</div>
			</div>
			<div class="rows relative wd-100" id="move10">
				<div class="seat" id="3">3</div>
				<div class="seat" id="4">4</div>
			</div>
			<div class="rows relative wd-100" id="move11">
				<div class="seat" id="5">5</div>
				<div class="seat" id="6">6</div>
			</div>
			<div class="rows relative wd-100" id="move12">
				<div class="seat" id="7">7</div>
				<div class="seat" id="8">8</div>
			</div>
			<div class="rows relative wd-100" id="move13">
				<div class="seat" id="9">9</div>
				<div class="seat" id="10">10</div>
			</div>
			<div class="rows relative wd-100" id="move14">
				<div class="seat" id="11">11</div>
				<div class="seat" id="12">12</div>
			</div>
			<div class="rows relative wd-100" id="move15">
				<div class="seat" id="13">13</div>
				<div class="seat" id="14">14</div>
			</div>
			<div class="rows relative wd-100" id="move16">
				<div class="seat" id="15">15</div>
				<div class="seat" id="16">16</div>
			</div>
			<div class="rows relative wd-100" id="move17">
				<div class="seat" id="17">17</div>
				<div class="seat" id="18">18</div>
			</div>
		</div>

	</div>

	<div class="max-wd800 center buttons">
		<button class="reserveBtn" value="117">좌석 예약</button>
		<button class="returnBtn" value="117">좌석 반납</button>
	</div>


</body>
</html>

<style>
.reserveBtn, .returnBtn {
	/* 	background-color: #20c997;
 */
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

.wd-100 {
	width: 100px;
}

.wd-250 {
	width: 250px;
}

body {
	margin: 0;
	font-family: "Noto Sans", "맑은 고딕", "Malgun Gothic", Arial, Helvetica,
		sans-serif, Lucida, Grande, "Microsoft YaHei", "Hiragino Sans GB",
		SimSun, Meiryo;
	width: 100%;
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
	display: inline-block;
}

.seatContainer img {
	display: block;
	margin: 0 auto;
}

.rows {
	display: flex;
}

.relative {
	position: relative;
	z-index: 9999;
}

#move1 {
	top: -945px;
	right: -25px;
}

#move2 {
	top: -840px;
	right: -25px;
}

#move3 {
	top: -840px;
	right: -25px;
}

#move4 {
	top: -740px;
	right: -25px;
}

#move5 {
	top: -740px;
	right: -25px;
}

#move6 {
	top: -635px;
	right: -25px;
}

#move7 {
	top: -635px;
	right: -25px;
}

#move8 {
	top: -545px;
	right: -25px;
}

#move9 {
	top: -945px;
	right: -417px;
}

#move10 {
	top: -945px;
	right: -417px;
}

#move11 {
	top: -887px;
	right: -417px;
}

#move12 {
	top: -887px;
	right: -417px;
}

#move13 {
	top: -820px;
	right: -417px;
}

#move14 {
	top: -1340px;
	right: -655px;
}

#move15 {
	top: -1340px;
	right: -655px;
}

#move16 {
	top: -1294px;
	right: -655px;
}

#move17 {
	top: -1294px;
	right: -655px;
}
</style>



