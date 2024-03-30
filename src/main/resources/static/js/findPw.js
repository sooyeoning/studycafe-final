/**
 * 핸드폰번호: - 포함안될시 int -> String error
 * 추가정보 추가 or 멈춤 정하기
 * 
 * <공부>
 * .is(":checked")
 * 객체 안에 쌍따옴표, 홑따옴표
 * requestBody로 데이터 받을때 content-type:application/json 지정
 * data: JSON.stringify
 * 
 * sessio 저장소
 */
$(document).ready(function() {

	$(".findPwBtn").click(function() {
		let userName = $("#name").val();
		let userId = $("#userId").val();

		const findPwReq = {
			name: userName,
			userId: userId
		}

		findPw(findPwReq);
	})

})


//기본정보 저장
function findPw(findPwReq) {

	$.ajax({
		url: "/user/findPw",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(findPwReq),
		success: function(response) {
			alert(response)
		},
		error: function(error) {
			alert(error)
		}
	})//ajax end
}