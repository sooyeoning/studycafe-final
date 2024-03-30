/**
 1 회원의 사용 지점(id, 이름) 가져오기
 2 사용 지점 id를 통해 해당 지점의 좌석표 가져오기
 3 예약된 좌석 리스트 가져오기
 4 예약된 내 자리 가져오기
 
 좌석 예약수, 남은 좌석 수
 */

$(document).ready(function() {
	
	let mySeat = 0;
	let newPlaceId;
	
	//로그인한 회원이 아닌 경우
	let url = location.href;

	if(url.endsWith("guest")){ 	
		$(".reserveBtn").on('click', function(){ //예약 버튼 서비스 중단
			$(this).click(false);
			alert("로그인 후 사용 가능한 서비스입니다.")
			location.href="/login"
		})
		$(".returnBtn").on('click', function(){	//반납 버튼 서비스 중단
			$(this).click(false);
			alert("로그인 후 사용 가능한 서비스입니다.")
			location.href="/login"
		});
		
	} else {
		getReservedSeatList(sessionStorage.getItem('currentPlaceId'))
    		.then(() => getMyReservedSeatId(sessionStorage.getItem('currentPlaceId')))
   			.then((seatId) => {
    	    // mySeatId를 처리하는 부분
	    	    console.log("getMyReservedSeatId success:"+seatId);
				mySeat = seatId;
				$('#'+mySeat).attr("class", "myReservedSeat");		
			
				$(".seatContainer").on('click', function(){	
					$(this).click(false);
					alert("예약하신 좌석 반납 후 사용 가능합니다.")
				})
    		})
    		.catch((error) => {
				if(error == 4101){ //로그인x
					$(".seatContainer").on('click', function(){	
						$(this).click(false);
						alert("내가 예약한 좌석 번호는 로그인 후 확인 가능합니다.");
					})
				}
				if(error == 4201){ //예약한 좌석 없음
					$(".seatContainer").on('click', function(e){
						let newSelectedSeatId = e.target.id;
						if(!isExistsSelectedSeat()) {
							onSeat(newSelectedSeatId);
						} else {
							let currentSeatId = getCurrentSeatId();
							offSeat(currentSeatId);
							if(!isSame(currentSeatId, newSelectedSeatId)) {
								onSeat(newSelectedSeatId);
							}
						}
					})
				}
				else {					
	       			alert(error);
				}
    		});
    		
		//좌석 반납
		$('.returnBtn').on('click',function(){
			returnSeat(mySeat);
		});
		
		$(".reserveBtn").on('click',function(){
			newPlaceId = sessionStorage.getItem('currentPlaceId');
			//해당 지점에 등록된 회원권 있는지 확인
			console.log("새로운 장소 id"+newPlaceId);
			
			let reservedSeatId = $(".selectedSeat").attr('id');
			if(reservedSeatId == undefined){
				alert("좌석 지정 후 다시 시도해주세요!")
			} else {
				//좌석 지정 후 예약
				let postSeatReq = {
					placeId: newPlaceId,
					id: reservedSeatId,
					ticketCode: ""
				}
				
				reserveSeat(postSeatReq);
			}
		})
			
	}

	
	
});

function getCurrentSeatId() {
	return sessionStorage.getItem("selectedSeatId");
}

function isSame(args1, args2) {
	return args1 == args2;
}

function isExistsSelectedSeat() {
	let selectedSeatId = getCurrentSeatId();
	return selectedSeatId != null;
}

function onSeat(seatNo) {
	// 1. CLASS 활성
	// 2. session storage 등록
	$('#' + seatNo).attr("class", "selectedSeat");
	sessionStorage.setItem("selectedSeatId", seatNo);
}

function offSeat(seatNo) {
	// 1. CLASS 비활성
	// 2. session storage 제거
	$('#' + seatNo).attr("class", "seat");
	sessionStorage.removeItem("selectedSeatId");
}

function reserveSeat(postSeatReq){
	console.log(postSeatReq);
	$.ajax({
		url: "/reserve/"+postSeatReq.seatId,
		method: "POST",
		data: JSON.stringify(postSeatReq),	//직렬화
		contentType: "application/json; charset=utf-8",
		success: function(response){
			console.log("reserveSeat")
			alert(response);
			location.reload();
		},
		error: function(response){
			if(response.responseJSON.code == 4101){
				alert("로그인 후 가능한 서비스입니다. 로그인 페이지로 이동합니다.");
				location.href="/login"
			}
			if(response.responseJSON.code == 4202){
				alert("타지점 사용중으로 타지점에서 예약된 좌석 반납 후 사용가능합니다.");
			}
			if(response.responseJSON.code == 4203){
				alert("다른 사용자에 의해 예약된 좌석입니다. 다른 좌석 예약 부탁드립니다.");
				location.href="/seats";
			}
			if(response.responseJSON.code == 4301){
				alert("좌석권 구매가 필요합니다. 좌석권 구매 페이지로 이동합니다.");
				location.href="/seats/buy";
			}
			
			if(response.responseJSON.code == 4303){
				alert("좌석권 등록이 필요합니다. 좌석권 등록 페이지로 이동합니다.");
				location.href="/seats/buy";
			}
			
		}
	})
}

// 예약된 내 좌석 찾기
function getMyReservedSeatId(newPlaceId) {
    console.log("getMyReservedSeatId, newPlaceId:" + newPlaceId);
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/myseat/"+newPlaceId,
            method: "GET",
            contentType: "application/json; charset=utf-8",
            success: function (seatId) {
                console.log("getMyReservedSeatId success:" + seatId);
                resolve(seatId);
            },
            error: function (result) {
                console.log("reservedSeatIdException: " + JSON.stringify(result));
                console.log(result)
                reject(result.responseJSON.code);
            }
        });
    });
}

// 전체 예약된 좌석 리스트
function getReservedSeatList(newPlaceId) {
    console.log("getReservedSeatList, newPlaceId:" + newPlaceId);
    return new Promise((resolve, reject) => {
        $.ajax({
            url: "/seats/" + newPlaceId,
            method: "GET",
            success: function (result) {
                console.log(result);
				$('#totalCounts').html(`🔒 예약된 좌석수 : `+result.length+`개`);
                for (let seat of result) {
                    console.log(seat);
                    $('#' + seat.id).attr("class", "reservedSeat");
                    $('#' + seat.id).off('click'); // 클릭 이벤트 제거
                }
                resolve();
            },
            error: function () {
                reject("조회 실패");
            }
        });
    });
}

/*
//예약된 내 좌석 찾기
function getMyReservedSeatId(newPlaceId){
	console.log("getMyReservedSeatId, newPlaceId:"+newPlaceId );
	let mySeat;
	$.ajax({
		url: "http://localhost:8080/myseat",
		method: "GET",
		async: false, // 동기식: 기다려줌
		data: {
			placeId: newPlaceId,
			userId: 0
		},	//직렬화
		contentType: "application/json; charset=utf-8",
		success: function(seatId){
			console.log("getMyReservedSeatId success:"+seatId);
			mySeat = seatId;
			$('#'+seatId).attr("class", "myReservedSeat");		
		
			$(".seatContainer").on('click', function(){	
				$(this).click(false);
				alert("예약하신 좌석 반납 후 사용 가능합니다.")
			})
		},
		error: function(result){
			console.log("reservedSeatIdException: "+JSON.stringify(result));
			//console.log("reservedSeatIdException: "+result.responseJSON.code);

			if(result.responseJSON.code == 4100){ //로그인x
				$(".seatContainer").on('click', function(){	
					$(this).click(false);
					alert("내가 예약한 좌석 번호는 로그인 후 확인 가능합니다.");
				})
			}
			if(result.responseJSON.code == 4201){ //예약한 좌석 없음

				$(".seatContainer").on('click', function(e){
					let newSelectedSeatId = e.target.id;
					if(!isExistsSelectedSeat()) {
						onSeat(newSelectedSeatId);
					} else {
						let currentSeatId = getCurrentSeatId();
						offSeat(currentSeatId);
						if(!isSame(currentSeatId, newSelectedSeatId)) {
							onSeat(newSelectedSeatId);
						}
					}
				})
			}
		}
	})
		return mySeat;
}

//전체 예약된 좌석 리스트
function getReservedSeatList(newPlaceId){
	console.log("getReservedSeatList, newPlaceId:"+newPlaceId);

	$.ajax({
		url: "http://localhost:8080/seats/"+newPlaceId,
		method: "get",
		success: function(result){
			console.log(result);
			for(let seat of result){
				console.log(seat);
				if($('#'+seat.id).attr("class")!="myReservedSeat"){					
					$('#'+seat.id).attr("class", "reservedSeat");
					$('#'+seat.id).click(false); // 클릭 막기
				}
			}
		},
		error: function(){
			alert("조회 실패")
		}
	})
	
}
*/
//예약된 자리 없는데 반납 누르면 에러 난다
function returnSeat(mySeat){
	console.log("ajax " +mySeat);
	$.ajax({
		url: "/return/"+mySeat,
		method: "get",
		success: function(){
			alert("좌석이 반납되었습니다.");
			location.reload();
		},
		error: function(response){
			if(response.responseJSON.code == 4201){
				alert("예약된 좌석만 반납 가능합니다.");
			} else {
				alert("좌석 반납 중 오류가 발생했습니다. 다시 시도해주세요");
			}
		}
	})
}