/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */
$(document).ready(function() {
	
	//회원이 관심 가는 지역으로 정해놓은 지역으로 검색하여 장소 리스트 노출
	let placeName = $("#name").val();
	let priceCategory = $("#priceCategory").val();
	let areaCode = $("#areaCode").val();
	
	const placeGetReq = {
		name: placeName,
		priceCategory: priceCategory,
		areaCode: areaCode
	}

	search(placeGetReq);
	
	$("#name").keypress(function(event) {
		if (event.keyCode == 13) {
			let placeName = $("#name").val();
			let rateId = $("#rateId").val();
			let areaCode = $("#areaCode").val();
			let blanket;
			let bookstand;
			let phoneCharger;
			let lamp;
			let cushion;
			let coffee;
			let drinks;
			let snack;
			let printer;
			let scanner;
			let locker;
			let meetingRoom;
			let parking;
			let seperateRestroom;
			let wifi;
			let serviceIdtotalCount = 0;
			let placeServiceIdList = [];
			if ($(".blanket").is(":checked")) {
				blanket = $(".blanket").val();
				placeServiceIdList.push(blanket);
				serviceIdtotalCount++;
			} else {
				blanket = 0;
			}
			if ($(".bookstand").is(":checked")) {
				bookstand = $(".bookstand").val();
				placeServiceIdList.push(bookstand);
				serviceIdtotalCount++;
			} else {
				bookstand = 0;
			}
			if ($(".phoneCharger").is(":checked")) {
				phoneCharger = $(".phoneCharger").val();
				placeServiceIdList.push(phoneCharger);
				serviceIdtotalCount++;
			} else {
				phoneCharger = 0;
			}
			if ($(".lamp").is(":checked")) {
				lamp = $(".lamp").val();
				placeServiceIdList.push(lamp);
				serviceIdtotalCount++;
			} else {
				lamp = 0;
			}
			if ($(".cushion").is(":checked")) {
				cushion = $(".cushion").val();
				placeServiceIdList.push(cushion);
				serviceIdtotalCount++;
			} else {
				cushion = 0;
			}
			if ($(".coffee").is(":checked")) {
				coffee = $(".coffee").val();
				placeServiceIdList.push(coffee);
				serviceIdtotalCount++;
			} else {
				coffee = 0;
			}
			if ($(".drinks").is(":checked")) {
				drinks = $(".drinks").val();
				placeServiceIdList.push(drinks);
				serviceIdtotalCount++;
			} else {
				drinks = 0;
			}
			if ($(".snack").is(":checked")) {
				snack = $(".cushion").val();
				placeServiceIdList.push(snack);
				serviceIdtotalCount++;
			} else {
				snack = 0;
			}
			if ($(".printer").is(":checked")) {
				printer = $(".printer").val();
				placeServiceIdList.push(printer);
				serviceIdtotalCount++;
			} else {
				printer = 0;
			}
			if ($(".scanner").is(":checked")) {
				scanner = $(".scanner").val();
				placeServiceIdList.push(scanner);
				serviceIdtotalCount++;
			} else {
				scanner = 0;
			}
			if ($(".locker").is(":checked")) {
				locker = $(".locker").val();
				placeServiceIdList.push(locker);
				serviceIdtotalCount++;
			} else {
				locker = 0;
			}
			if ($(".meetingRoom").is(":checked")) {
				meetingRoom = $(".meetingRoom").val();
				placeServiceIdList.push(meetingRoom);
				serviceIdtotalCount++;
			} else {
				meetingRoom = 0;
			}
			if ($(".parking").is(":checked")) {
				parking = $(".parking").val();
				placeServiceIdList.push(parking);
				serviceIdtotalCount++;
			} else {
				parking = 0;
			}
			if ($(".wifi").is(":checked")) {
				wifi = $(".wifi").val();
				placeServiceIdList.push(wifi);
				serviceIdtotalCount++;
			} else {
				wifi = 0;
			}
			if ($(".cafeteria").is(":checked")) {
				cafeteria = $(".cafeteria").val();
				placeServiceIdList.push(cafeteria);
				serviceIdtotalCount++;
			} else {
				cafeteria = 0;
			}
			if ($(".seperate_restroom").is(":checked")) {
				seperateRestroom = $(".seperate_restroom").val();
				placeServiceIdList.push(seperateRestroom);
				serviceIdtotalCount++;
			} else {
				seperateRestroom = 0;
			}

			const placeGetReq = {
				name: placeName,
				rateId: rateId,
				areaCode: areaCode,
				placeServiceIdList: placeServiceIdList,
				serviceIdtotalCount: serviceIdtotalCount
			}

			search(placeGetReq);
		}
	})

	//옵션 검색
	$(".searchBtn").click(function() {
		let placeName = $("#name").val();
		let rateId = $("#rateId").val();
		let areaCode = $("#areaCode").val();
		let blanket;
		let bookstand;
		let phoneCharger;
		let lamp;
		let cushion;
		let coffee;
		let drinks;
		let snack;
		let printer;
		let scanner;
		let locker;
		let meetingRoom;
		let parking;
		let seperateRestroom;
		let wifi;
		let serviceIdtotalCount = 0;
		let placeServiceIdList = [];
		if ($(".blanket").is(":checked")) {
			blanket = $(".blanket").val();
			placeServiceIdList.push(blanket);
			serviceIdtotalCount++;
		} else {
			blanket = 0;
		}
		if ($(".bookstand").is(":checked")) {
			bookstand = $(".bookstand").val();
			placeServiceIdList.push(bookstand);
			serviceIdtotalCount++;
		} else {
			bookstand = 0;
		}
		if ($(".phoneCharger").is(":checked")) {
			phoneCharger = $(".phoneCharger").val();
			placeServiceIdList.push(phoneCharger);
			serviceIdtotalCount++;
		} else {
			phoneCharger = 0;
		}
		if ($(".lamp").is(":checked")) {
			lamp = $(".lamp").val();
			placeServiceIdList.push(lamp);
			serviceIdtotalCount++;
		} else {
			lamp = 0;
		}
		if ($(".cushion").is(":checked")) {
			cushion = $(".cushion").val();
			placeServiceIdList.push(cushion);
			serviceIdtotalCount++;
		} else {
			cushion = 0;
		}
		if ($(".coffee").is(":checked")) {
			coffee = $(".coffee").val();
			placeServiceIdList.push(coffee);
			serviceIdtotalCount++;
		} else {
			coffee = 0;
		}
		if ($(".drinks").is(":checked")) {
			drinks = $(".drinks").val();
			placeServiceIdList.push(drinks);
			serviceIdtotalCount++;
		} else {
			drinks = 0;
		}
		if ($(".snack").is(":checked")) {
			snack = $(".cushion").val();
			placeServiceIdList.push(snack);
			serviceIdtotalCount++;
		} else {
			snack = 0;
		}
		if ($(".printer").is(":checked")) {
			printer = $(".printer").val();
			placeServiceIdList.push(printer);
			serviceIdtotalCount++;
		} else {
			printer = 0;
		}
		if ($(".scanner").is(":checked")) {
			scanner = $(".scanner").val();
			placeServiceIdList.push(scanner);
			serviceIdtotalCount++;
		} else {
			scanner = 0;
		}
		if ($(".locker").is(":checked")) {
			locker = $(".locker").val();
			placeServiceIdList.push(locker);
			serviceIdtotalCount++;
		} else {
			locker = 0;
		}
		if ($(".meetingRoom").is(":checked")) {
			meetingRoom = $(".meetingRoom").val();
			placeServiceIdList.push(meetingRoom);
			serviceIdtotalCount++;
		} else {
			meetingRoom = 0;
		}
		if ($(".parking").is(":checked")) {
			parking = $(".parking").val();
			placeServiceIdList.push(parking);
			serviceIdtotalCount++;
		} else {
			parking = 0;
		}
		if ($(".wifi").is(":checked")) {
			wifi = $(".wifi").val();
			placeServiceIdList.push(wifi);
			serviceIdtotalCount++;
		} else {
			wifi = 0;
		}
		if ($(".cafeteria").is(":checked")) {
			cafeteria = $(".cafeteria").val();
			placeServiceIdList.push(cafeteria);
			serviceIdtotalCount++;
		} else {
			cafeteria = 0;
		}
		if ($(".seperate_restroom").is(":checked")) {
			seperateRestroom = $(".seperate_restroom").val();
			placeServiceIdList.push(seperateRestroom);
			serviceIdtotalCount++;
		} else {
			seperateRestroom = 0;
		}

		const placeGetReq = {
			name: placeName,
			rateId: rateId,
			areaCode: areaCode,
			placeServiceIdList: placeServiceIdList,
			serviceIdtotalCount: serviceIdtotalCount
		}

		search(placeGetReq);
	});

	$(".noOptionSearchBtn").click(function() {
		let placeName = $("#name").val();
		let priceCategory = $("#priceCategory").val();
		let areaCode = $("#areaCode").val();
		//클릭된 옵션들을 원상태로 복구 
		let blanket = $(".blanket").attr("checked", false);
		let bookstand = $(".bookstand").attr("checked", false);
		let phoneCharger = $(".phoneCharger").attr("checked", false);
		let lamp = $(".lamp").attr("checked", false);
		let cushion = $(".cushion").attr("checked", false);
		let coffee = $(".coffee").attr("checked", false);
		let drinks = $(".drinks").attr("checked", false);
		let snack = $(".snack").attr("checked", false);
		let printer = $(".printer").attr("checked", false);
		let scanner = $(".scanner").attr("checked", false);
		let locker = $(".locker").attr("checked", false);
		let meetingRoom = $(".meetingRoom").attr("checked", false);
		let parking = $(".parking").attr("checked", false);
		let wifi = $(".wifi").attr("checked", false);
		let seperateRestroom = $(".seperate_restroom").attr("checked", false);
		let cafeteria = $(".cafeteria").attr("checked", false);

		const placeGetReq = {
			name: placeName,
			priceCategory: priceCategory,
			areaCode: areaCode
		}

		search(placeGetReq);
	})

	//상세 화면
	$(document).on("click", ".card-body", function() {
		let placeId = $(this).attr('id');
		window.location.href = 'place?placeId=' + placeId;
	});

	$(".selectAll").click(function() {
		selectAll()
	})
})//ready end

//기본정보 저장
function search(placeGetReq) {

	$.ajax({
		url: "/place/list",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(placeGetReq),
		success: function(response) {
			console.log(response);
			$(".result").html('');
			$(".result").append(`<div class="max-wd800 center"><br><h5>총 ${response.length} 건</h5><hr></div>`);
			
			for (let i = 0; i < response.length; i++) {
				//console.log(response[i].imageVO.uploadFileName);

				if (response[i].imageDTO == null) {
					$(".result").append(`<div class="card max-wd800 center cursor mb-10">
					<div class="row g-0">
						<div class="col-md-4 ">
							<img src="../images/noimage.jpg" class="img-fluid rounded-start thumbnail" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body" id="${response[i].id}">
								<h5 class="card-title">${response[i].name}</h5>
								<p class="card-text">${response[i].address}</p>
								<p class="card-text">${response[i].phone}</p>`);
				} else {
					$(".result").append(`<div class="card max-wd800 center cursor mb-10">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="/mypage/${response[i].imageDTO.uploadFileName}" class="img-fluid rounded-start thumbnail" alt="...">
						</div>
						<div class="col-md-8">
							<div class="card-body" id="${response[i].id}">
								<h5 class="card-title">${response[i].name}</h5>
								<p class="card-text">${response[i].address}</p>
								<p class="card-text">${response[i].phone}</p>`);
				}
				$(".result").append(`<div class="max-wd800 center mb-3 service${response[i].id}" style="display: flex; flex-wrap: wrap;"></div>`);

				//가격
				let rateId = response[i].placeRateDTOList[0].rateId;
			
				if (rateId == 6) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 10시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 7) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 30시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 8) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 50시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 9) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 100시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 10) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 150시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 11) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[시간 충전권] 200시간 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 12) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[기간권] 1주 자유석 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 13) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[기간권] 2주 자유석 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 14) {
					$('#' + response[i].id).append(`<p class="card-text"><small class="text-body-secondary">[기간권] 4주 자유석 요금: ${response[i].placeRateDTOList[0].price}원</small></p>`);
				}
				if (rateId == 15) {
					$('#' + response[i].id).append(`<p class= "card-text" > <small class="text-body-secondary">[기간권] 4주 고정석 요금: ${placeRateDTO.price}원</small></p>`);
				}
				
				
//		
				
				//서비스
				for (let placeServiceDTO of response[i].placeServiceDTOList) {
			
					if (placeServiceDTO.serviceId == 1) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									 # 커피 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 2) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 음료 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 3) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 간식 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 15) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 취식가능 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 4) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 프린터 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 5) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 스캐너 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 7) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 주차 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 8) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 회의실 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 9) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 담요 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 10) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 독서대 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 11) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 충전기 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 12) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 스탠드 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 13) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 방석 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 14) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 와이파이 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
					if (placeServiceDTO.serviceId == 16) {
						$(".service"+response[i].id).append(
							`<div class="cardOpt">
								<small class="cardOpt-text">
									# 남/여 화장실 구분 ${placeServiceDTO.feeStatus}
								</small>
							</div>`
						);
					}
				}

			$(".result").append(
					`</div>
					</div>
				</div>
				</div> </div>`)
				

			

			}//for
		},
		error: function(error) {
			alert(error);
		}
	});//ajax end
}

function selectAll() {
	$("input[name=option]").each(function(index, item) {
		item.checked = $('.selectAll').is(":checked");
	})
}
