/**
 1 회원의 사용 지점(id, 이름) 가져오기
 2 사용 지점 id를 통해 해당 지점의 좌석표 가져오기
 3 예약된 좌석 리스트 가져오기
 4 예약된 내 자리 가져오기
 */

$(document).ready(function() {
	
	//초기 좌석도 가져오기
	getSeatsImage($("#newPlace").val())
		.then(()=>{
			getReservedSeatLists($("#newPlace").val());
		})
		.catch((error)=>{
			console.log(error);
		})
	
	//다른 지점 좌석도 확인하기
	$('#newPlace').on('change', function(){
		getSeatsImage($(this).val())
		.then(()=>{
			getReservedSeatLists($(this).val());
		})
		.catch((error)=>{
			console.log(error);
		})
		
	})
	
	//좌석 클릭시 로그인 필요한 서비스입니다 띄우기
	$(".result").on('click',".seatContainer", function(){
		alert("로그인이 필요한 서비스입니다.")
		location.href="/login"

	})
});

function getSeatsImage(placeId){
	return new Promise((resolve, reject) => {

		$.ajax({
			url: "http://localhost:8080/getSeatsImage/"+placeId,
			method: "GET",
			success: function(result){
				console.log("getSeatsImage start");
				$('.result').html(result);
				resolve();
			},
			error: function(error){
				reject(error)
			}
		})
	})
}

//전체 예약된 좌석 리스트
function getReservedSeatLists(newPlaceId){
	console.log("getReservedSeatList, newPlaceId:"+newPlaceId);

	$.ajax({
		url: "http://localhost:8080/seats/"+newPlaceId,
		method: "get",
		success: function(result){
			console.log(result);
			alert("조회 성공");
			$('#totalCounts').html(`🔒 예약된 좌석수 : `+result.length+`개`);
			for(let seat of result){
				$('#'+seat.id).attr("class", "reservedSeat");
				$('#'+seat.id).click(false); // 클릭 막기
			}
		},
		error: function(){
			alert("조회 실패")
		}
	})
	
}