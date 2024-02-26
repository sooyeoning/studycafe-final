/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */

$(document).ready(function() {
	//가지고 있는 티켓 목록 가져오기 - 구매한 티켓이 없을 경우!
	getTicketList();
	
	//좌석권 구매하기 버튼
	$('.submitBtn').click(function(){
		let ticketType = $('#ticket').val();
		//확인용 alert(ticketType);
		let buyTicketReq = {
			ticketType : ticketType
		}
		buyTicket(buyTicketReq);
	})



});

function buyTicket(buyTicketReq){
	$.ajax({
		url: "http://localhost:8080/ticket/buy",
		method: "POST",
		data: JSON.stringify(buyTicketReq),	//직렬화
		contentType: "application/json; charset=utf-8",
		success: function(){
			alert("티켓 구매가 완료되었습니다.");
			location.reload();
		},
		error: function(result){
			if(result.responseJSON.code == 4101){
				alert("로그인 후 사용 가능합니다.")
				location.href="/login"
			} else {
				alert("티켓 구매 실패했습니다.")				
			}

		}
	})
}


function getTicketList(){
	$.ajax({
		url: "http://localhost:8080/ticket/list",
		method: "get",
		success: function(response){
			console.log("getTicketList "+response);
			for(let i=0; i<response.length; i++){
				let status = "미등록";
				let placeName = "-";
				
				if(response[i].placeName != null){
					placeName = response[i].placeName;
					status = "등록완료";
				}
				
				if(response[i].residualTimes == '00:00:00'){
					status = "사용완료";
					$('#result').append(`
					<tr>
						<td>${response[i].name}</td>
						<td>${response[i].residualTimes}</td>
						<td>`+placeName+`</td>
						<td style="color: red;">`+status+`</td>
					</tr>`);
				} else {					
					$('#result').append(`
						<tr>
							<td>${response[i].name}</td>
							<td>${response[i].residualTimes}</td>
							<td>`+placeName+`</td>
							<td>`+status+`</td>
							<td><button class="addBtn" onClick="location.href='http://localhost:8080/ticket/add/${response[i].code}'">지점 등록/수정</button></td>
						</tr>`);
					}
				}
				
			
		},
		error: function(result){
			if(result.responseJSON.code == 4101){
				alert("로그인 후 사용 가능합니다.")
				location.href="/login"
			} 

		}
	})
}
