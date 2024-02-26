/**
 * 핸드폰번호: - 포함안될시 int -> String error
 * 추가정보 추가 or 멈춤 정하기
 * 
 * <공부>
 * .is(":checked")
 * 객체 안에 쌍따옴표, 홑따옴표
 * requestBody로 데이터 받을때 content-type:application/json 지정
 * data: JSON.stringify
 */
$(document).ready(function() {

	$(".submitBtn").click(function() {

		let placeName = $("#name").val();
		let address = $("#address").val();
		let phone = $("#phone").val();
		let areaCode = $("#areaCode").val();
		let blanket = $("#blanket").is(":checked");
		let bookstand = $("#bookstand").is(":checked");
		let phoneCharger = $("#phoneCharger").is(":checked");
		let lamp = $("#lamp").is(":checked");
		let cushion = $("#cushion").is(":checked");

		const placePostReq = {
			name: placeName,
			address: address,
			phone: phone,
			areaCode: areaCode,
			blanket: blanket,
			bookstand: bookstand,
			phoneCharger: phoneCharger,
			lamp: lamp,
		}

		saveBasicInfoAjax(placePostReq);
	})


})


//기본정보 저장
function saveBasicInfoAjax(placePostReq) {

	$.ajax({
		url: "http://localhost:8080/place/post",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(placePostReq),
		success: function(data) {
			console.log(data)
			//alert("저장성공")
			//추가정보 저장 버튼, 다음에 저장하기 버튼 생성
			$(".appendBtn").append(
				`<button class="goNextBtn">상세정보 추가하러 가기</button>`)
		},
		error: function() {
			//alert("저장실패")
			//저장실패시 다음 버튼 못 누르게 막기
		}
	})//ajax end
}