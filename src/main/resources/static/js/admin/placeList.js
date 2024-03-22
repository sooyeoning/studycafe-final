/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */
$(document).ready(function() {

	//시작되자마자 전지역 리스트 출력
	let placeName = $("#name").val();
	let areaCode = $("#areaCode").val();

	const getAdminPlaceListReq = {
		name: placeName,
		areaCode: areaCode
	}
	search(getAdminPlaceListReq);
	
	$("#name").keypress(function(event) {
		if (event.keyCode == 13) {
			let placeName = $("#name").val();
			let areaCode = $("#areaCode").val();

			const placeGetReq = {
				name: placeName,
				areaCode: areaCode
			}

			search(placeGetReq);
		}
	})

	//옵션 없이 기본 검색
	$(".searchBtn").click(function() {
		let placeName = $("#name").val();
		let areaCode = $("#areaCode").val();

		const getAdminPlaceListReq = {
			name: placeName,
			areaCode: areaCode
		}
		search(getAdminPlaceListReq);
	});

	//장소 전체 선택
	$(document).on('click', "#selectAll", function() {
		//checked 설정
		selectAll();
	})

	//상세페이지 이동
	//this <-> .card-body 차이
	$(".card-title").click( function() {
		let placeId = $('#updateBtn').val();
		console.log(placeId);
		window.location.href = 'place?placeId=' + placeId;
	});

	$("#deleteSelectedBtn").on('click',function(){
		//체크된 체크박스 value 값 가져오기
		let checkArr = [];
		$("input[class='checkbox']:checked").each(function(){
			checkArr.push($(this).val());
		})
		//for문 돌면서 삭제 - 삭제 alert 삭제한 갯수만큼 나옴
		$.each(checkArr, function(index, value){
			deletePlace(value)
		})
	})
});


//전체 검색
function search(getAdminPlaceListReq) {
	//http://localhost:8080/mypage/+response.uploadFileName
	$.ajax({
		url: "http://localhost:8080/place/adminList",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(getAdminPlaceListReq),
		success: function(response) {
			console.log(response);
			$(".result").html('');
			$(".result").append(`<div class="max-wd800 center mt-10">
			
			<div class="pt-10 pb-10 bt bd h55">
			<button type="button" class="btn-outline-secondary fl-r" id="deleteSelectedBtn">삭제❌</button>
			<label for="selectAll" class="fl-r mr-5">전체 선택✔️</label><input type="checkbox" id="selectAll" class="fl-r"/>
			</div>
			<h5 class="bd pt-10 pb-10">🔎 ${response.length} 건이 검색되었습니다.</h5>
			</div>`);

			for (let i = 0; i < response.length; i++) {
				
				$(".result").append(`
				<div class="max-wd800 center">
					<input type="checkbox" class="checkbox" value="${response[i].id}"/>
				</div>
				<div class="card mb-3 max-wd800 center">
					<div class="row g-0">
							<div class="card-body cursor" onclick="getPlaceDetail(${response[i].id})">
								<h5 class="card-title">${response[i].name}</h5>
								<p class="card-text">${response[i].address}</p>
								<p class="card-text">${response[i].phone}</p>
							</div>
						
						<div class="card-body col-md-5" id="${response[i].id}"></div>
						<div class="card-body col-md-5 right" id="${response[i].id}service"></div>`);
					//가격
					for(let placeRateDTO of response[i].placeRateDTOList){
					
						if (placeRateDTO.rateId == 6) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 10시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 7) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 30시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 8) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 50시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 9) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 100시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 10) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 150시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 11) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[시간 충전권] 200시간 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 12) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[기간권] 1주 자유석 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 13) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[기간권] 2주 자유석 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 14) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[기간권] 4주 자유석 요금: ${placeRateDTO.price}원</small></p>`);
						}
						if (placeRateDTO.rateId == 15) {
							$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[기간권] 4주 고정석 요금: ${placeRateDTO.price}원</small></p>`);
						}
						$(".result").append(`</div><div>`);
	
						
					}
				
									
				for(let placeServiceDTO of response[i].placeServiceDTOList){
					
					if (placeServiceDTO.serviceId == 1) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-coffee color center"></i> 커피 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 2) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-drink-alt center color"></i> 음료 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 3) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-candy center color"></i> 간식 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 4) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-print center color"></i> 프린터 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 5) {
						$('#' + response[i].id + 'service').append( //<i class="fi fi-rr-qr-scan"></i>
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-qr-scan color"></i> 스캐너 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 6) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-archive center color"></i> 사물함 ${placeServiceDTO.feeStatus}  
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 7) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-car-alt center color"></i> 주차 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 8) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-meeting center color"></i> 회의실 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 9) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-blanket center color"></i> 담요 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 10) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-e-learning center color"></i> 책 받침대 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}	
					if (placeServiceDTO.serviceId == 11) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
							<small class="text-body-secondary">
							<i class="fi fi-rr-battery-bolt center color"></i> 충전기 ${placeServiceDTO.feeStatus} </small></span>`);
					}
					if (placeServiceDTO.serviceId == 12) {
						$('#' + response[i].id + 'service').append(`
						<span id = "option-button" class= "card-text" > 
							<small class="text-body-secondary">
								<i class="fi fi-rr-lamp-desk center color"></i> 스탠드 ${placeServiceDTO.feeStatus} 
							</small>
						</span>`);
					}
					if (placeServiceDTO.serviceId == 13) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
									<i class="fi fi-rr-loveseat center color"></i> 방석 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 14) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary"> 
									<i class="fi fi-rr-wifi center color"></i>와이파이 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 15) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary"> 
								<i class="fi fi-rr-restaurant center color"></i> 취식가능 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
					if (placeServiceDTO.serviceId == 16) {
						$('#' + response[i].id + 'service').append(
							`<span id = "option-button" class= "card-text" > 
								<small class="text-body-secondary">
								<i class="fi fi-rr-restroom-simple center color"></i> 남/녀 구분된 화장실 ${placeServiceDTO.feeStatus} 
								</small>
							</span>`);
					}
						
				}

				$('#' + response[i].id + 'service').append(`
					<button type="button" class="btn btn-outline-secondary" id="updateBtn" onclick="updatePlace(${response[i].id})">수정</a>
					<button type="button" class="btn btn-outline-secondary" id="deleteBtn" onclick="deletePlace(${response[i].id})">삭제</p>
							</div>
						</div>
					</div>
				</div>`)

			}
		},
		error: function(error) {
			alert(error);
		}
	});//ajax end
}

function updatePlace(placeId){
	location.href = "place/updateForm?id=" + placeId;
}

function deletePlace(id) {
	$.ajax({
		url: "http://localhost:8080/place/delete/" + id,
		method: "DELETE",
		success: function(response) {
			alert(response);
			window.location.reload();
		},
		error: function() {
			alert("ajax 삭제 오류");
		}
	})
}

function selectAll() {
	//전체 리스트 선택

	$('.checkbox').each(function(index, item) {
		item.checked = $('#selectAll').is(":checked");
	})
}

function getPlaceDetail(placeId){
	location.href="/place?placeId="+placeId;
}