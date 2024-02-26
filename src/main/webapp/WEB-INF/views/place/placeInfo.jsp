<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cb82938aa63d7304f2ffb5269d561d6&libraries=services&autolod=false"></script>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.1.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>

</head>

<body>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="/js/place/placeInfo.js"></script>

	<%@ include file="../header.jsp"%>

	<div class="result max-wd800 center">

		<!-- 대표 사진 -->
		<div class="w3-content w3-display-container images">
			<button class="w3-button w3-black w3-display-left"
				onclick="plusDivs(-1)">&#10094;</button>
			<button class="w3-button w3-black w3-display-right"
				onclick="plusDivs(1)">&#10095;</button>
		</div>

		<!-- 장소 기본 정보 및 좌석 예약, 좌석 반납 -->
		<div class="contents basicInfo" style="height: 200px;">
			<h5 id="title"></h5>
			<p id="address">
				<i class="fi fi-rr-marker"></i>
			</p>
			<p id="phone">
				<i class="fi fi-rr-phone-call"></i>
			</p>
		</div>
		<hr>

		<!-- 지도: 찾아 오는 길 -->
		<div class="contents map" style="height: 500px;">
			<h5>찾아 오는 길</h5>
			<div id="map" class="center"></div>
		</div>
		<hr>

		<!-- 부대 시설 -->
		<div class="contents services">

			<h5>제공 물품</h5>
			<div class="supply">
				
			</div>
		<hr>

		<h5 class="disIb">가격 정보</h5>
		<!-- 위치 이동 -->
			<a class="priceimage flRight disIb" href="">가격표 이미지로 보기</a>
			<div class="price">
				
			</div>
	</div>

	</div>

</body>
</html>

<style>
.flRight{
	float: right;
}
.disIb{
	 display: inline-block;
}
.nav-link {
	margin: 0;
}
.max-wd800 {
	max-width: 800px;
}
i{
	color: #20c997;
}
.center {
	margin: 0 auto;
}

.contents {
	margin: 20px 10px 20px 10px;
}

p, h5, a {
	margin: 20px 10px 20px 10px;
}
small {
	margin: 0 auto;
}
#map {
	width: 760px;
	height: 400px;
}
.thumbnail, .mySlides {
	width: 800px;
	height: 500px;
}
.price>p {
margin: 5px 10px;
}
.wd40{
	width: 40px;
}
.disInlineGrid{
	display: inline-grid;
}
.marginR10{
	margin-right: 10px;
}
hr {
	background: #20c997;
    height:1px;
    border:0;
}
.color{
	color: #20c997;
}
</style>