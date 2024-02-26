/**
 1 회원의 사용 지점(id, 이름) 가져오기
 2 사용 지점 id를 통해 해당 지점의 좌석표 가져오기
 3 예약된 좌석 리스트 가져오기
 4 예약된 내 자리 가져오기
 */

$(document).ready(function() {
	
	//윗부분
	let placeId = getPlaceNameByUserId(); //회원의 사용지점 가져오기

	//사용지점으로 select 값 변경	
	$("#newPlace").val(placeId).prop("selected", true);
		
	if(placeId != null){ //처음 사용지점 좌석도 가져오기
		getSeatsImage($("#newPlace")[0]);
		console.log("처음 사용지점 좌석도 가져오기")	
	}

	//좌석권 구매 페이지로 이동
	$('.buyTicketBtn').on('click', function(){
		location.href="/seats/buy";
	})
	
	//좌석권 등록 페이지로 이동
	$('.registerTicketBtn').on('click', function(){
		location.href="/ticket/add";
	})
});

//로그인하지 않은 user의 경우
function getPlaceNameByUserId(){
	let placeId;
	$.ajax({
		url: "http://localhost:8080/getPlaceName",
		method: "GET",
		async: false,
		success: function(result){
			$('#placeName').html(result.name);
			placeId = result.placeId;
		},
		error: function(result){
			console.error(result);
			if(result.responseJSON.message=="noLogin"){
				alert("로그인 후 사용가능한 서비스입니다.")
				location.href="/login";
			}
		}
	})
	return placeId;
}

function getSeatsImage(obj){
	let placeId = obj.value;
	$.ajax({
		url: "http://localhost:8080/getSeatsImage/"+placeId,
		method: "GET",
		success: function(result){
			sessionStorage.setItem('currentPlaceId', placeId);
			$('.result').html(result);
		},
		error: function(){
			
		}
	})
}
