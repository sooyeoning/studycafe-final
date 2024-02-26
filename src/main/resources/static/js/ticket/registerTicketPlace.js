/**
1 구매한 티켓 조회
(조건) 한개의 티켓으로 모든 지점 사용가능
2개의 지점 이용하는데 구매권 2개를 사용하고 싶으면?
이용자(부모) - 여러개의 티켓
한개의 티켓 - 한개의 지점
한개의 티켓 - 한개의 좌석

Q 다른 지점에 예약되어 있는데 또 다른 지점에 동시에 예약하려고 할때 
 */

$(document).ready(function() {

	//회원의 사용지점, 지점id 가져오기
	

	//가지고 있는 티켓 목록 가져오기 - 구매한 티켓이 없을 경우!
	
	let areaCode;
	
	//선택한 지역에 따른 지점명 보여주기
	$('#areaCode').change(function(){
		//alert(this.value);
		areaCode = this.value;
		//안에 위치 - 지점 리스트 가져오기
		getPlaceList(areaCode);
	})
	
	//티켓 등록
	//등록된 티켓 다른 티켓으로 변경
	$('.submitBtn').click(function(){
		let patchTicketCodeReq = {
			placeId: $('#place').val(), 
			code: $('#code').val(),
			userId: 0
		}
		if( $('#place').val() == "99" || $('#areaCode').val() == "99"){
			alert("지점 선택 후 사용 가능한 서비스입니다.")
		} else {		
			registerTicket(patchTicketCodeReq)
		}
	})
	
	//좌석권 예약화면으로 이동
	$('.reserveSeatBtn').click(function(){
		location.href="http://localhost:8080/seats"
	})
	
	//좌석권 구매화면으로 이동
	$('.buyTicketBtn').click(function(){
		location.href="http://localhost:8080/seats/buy"
	})
});

function buyTicket(buyTicketReq){
	$.ajax({
		url: "http://localhost:8080/ticket/buy",
		method: "POST",
		data: JSON.stringify(buyTicketReq),	//직렬화
		contentType: "application/json; charset=utf-8",
		success: function(){
			alert("좌석권 구매가 완료되었습니다.");
			location.reload();
		},
		error: function(){
			alert("좌석권 구매 실패했습니다.")

		}
	})
}

function registerTicket(patchTicketCodeReq){
	$.ajax({
		url: "http://localhost:8080/ticket/add",
		method: "patch",
		data: JSON.stringify(patchTicketCodeReq),
		contentType: "application/json; charset=utf-8",
		success: function(){
			alert("성공적으로 등록이 완료되었습니다. 좌석 예약 페이지로 이동합니다.")
			location.href="http://localhost:8080/seats"
		},
		error: function(response){
			console.log(response);
			if(response.responseJSON.code == 4302){
				alert("해당 지점에 이미 등록된 좌석권이 있습니다. 기존에 등록된 좌석권을 이용해주세요!");
				location.href="http://localhost:8080/seats/buy";
			}
		}
	})
}

function getPlaceList(areaCode){
	$.ajax({
		url: "http://localhost:8080/place/list?areaCode="+areaCode,
		method: "GET",
		success: function(response){
			//사용가능한 지점 리스트 
			$('#place').html('');
			for(let i=0; i<response.length; i++){
				$('#place').append(`<option value='${response[i].id}'> ${response[i].name}</option>`);
			}
		},
		error: function(){
			
		}
	})
}

