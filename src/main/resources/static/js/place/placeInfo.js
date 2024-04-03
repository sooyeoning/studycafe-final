/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */
var slideIndex = 1;

$(document).ready(function() {

	const url = new URL(location.href);
	const placeId = url.searchParams.get('placeId');
	let address = getPlace(placeId);

	console.log(address);
	getMap(address);

	showDivs(slideIndex);

});

function getPlace(placeId) {
	let address;
	$.ajax({
		url: '/place/' + placeId,
		type: "GET",
		async: false,
		success: function(response) {
			console.log(response)
			$("#title").append(response.name);
			//$(".result").append(`<p>` + response.img + `</p>`);

			//$(".thumbnail").attr("src", "http://localhost:8080/mypage/" + response.uploadFileName);

			for (let fileName of response.uploadFileNames) {
				$(".images").append(`<img class="max-wd800 mySlides" src="/image/${fileName}"/>`);
				//"http://localhost:8080/mypage/" + fileName
			}

			$("#address").append(response.address);
			address = response.address;
			$("#phone").append(response.phone);

			//제공 물품
			for (let placeServiceDTO of response.placeServiceDTOList) {
				if(placeServiceDTO.feeStatus != '미제공'){
					if (placeServiceDTO.serviceId == 1) {
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-coffee center"></i>
								<small>커피</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 2) {
							$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-drink-alt center"></i>
								<small>음료</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 3) {
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-candy center"></i>
								<small>간식</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 4) { //<i class="fi fi-rr-print"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-print center"></i>
								<small>프린터</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 5) {
						$(".supply").append(
						`<div class="wd40 disInlineGrid marginR10">
						<i class="fi fi-rr-qr-scan color"></i> 
						<small>스캐너</small>
						</div>`);
					}
					if (placeServiceDTO.serviceId == 6) { //<i class="fi fi-rr-archive"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-archive center"></i>
								<small>사물함</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 7) { //<i class="fi fi-rr-car-alt"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-car-alt center"></i>
								<small>주차</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 8) { //<i class="fi fi-rr-meeting"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-meeting center"></i>
								<small>회의실</small>
								<small>${placeServiceDTO.feeStatus}</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 9) {
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-blanket center"></i>
								<small>담요</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 10) { //<i class="fi fi-rr-e-learning"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-e-learning center"></i>
								<small>받침대</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 11) { //<i class="fi fi-rr-battery-bolt"></i>
							$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-battery-bolt center"></i>
								<small>핸드폰 충전기</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 12) { //<i class="fi fi-rr-lamp-desk"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-lamp-desk center"></i>
								<small>스탠드</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 13) { //<i class="fi fi-rr-loveseat"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-loveseat center"></i>
								<small>방석</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 14) {
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-wifi center"></i>
								<small>와이파이</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 15) { //<i class="fi fi-rr-restaurant"></i>
						$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-restaurant center"></i>
								<small>취식 가능</small>
							</div>`);
					}
					if (placeServiceDTO.serviceId == 16) { //<i class="fi fi-rr-restroom-simple"></i>
							$(".supply").append(
							`<div class="wd40 disInlineGrid marginR10">
								<i class="fi fi-rr-restroom-simple center"></i>
								<small>남/여 구분된 화장실</small>
							</div>`);
					}
				}
			}

				for (let fileName of response.uploadFileNames) {
					if (fileName.includes('price')) {
						$(".priceimage").attr('href', "/mypage/" + fileName);
					}
					//"http://localhost:8080/mypage/" + fileName
				}

				//가격 정보
				for(let placeRateDTO of response.placeRateDTOList){
					if (placeRateDTO.rateId == 6) {
						$(".price").append(`
						<h5 class="color">시간 충전권</h5>
						<p>10 시간 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 7) {
						$(".price").append(`<p>30 시간 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 8) {
						$(".price").append(`<p>50 시간 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 9) {
						$(".price").append(`<p>100 시간 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 10) {
						$(".price").append(`<p>150 시간 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 11) {
						$(".price").append(`<p>200 시간 요금: ${placeRateDTO.price}원</p><hr>`)
					}
					if (placeRateDTO.rateId == 12) {
						$(".price").append(`
						<h5 class="color">기간권</h5>
						<p>1주 자유석 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 13) {
						$(".price").append(`<p>2주 자유석 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 14) {
						$(".price").append(`<p>4주 자유석 요금: ${placeRateDTO.price}원</p>`)
					}
					if (placeRateDTO.rateId == 15) {
						$(".price").append(`<p>4주 고정석 요금: ${placeRateDTO.price}원</p>`)
					}
					
				}
				
			},
			error: function(result) {
				alert("해당 지점 번호는 없는 지점입니다.");
				location.href="/";
			}
		});
	return address;
}

function getMap(address) {
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">💫목적지💫</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
		}
	});
}


function plusDivs(n) {
	showDivs(slideIndex += n);
}

function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");
	if (n > x.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = x.length }
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	x[slideIndex - 1].style.display = "block";
}