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

	$(".findIdBtn").click(function() {
		let userName = $("#name").val();
		let email = $("#email").val();

		const findIdReq = {
			name: userName,
			email: email
		}

		findId(findIdReq);
	})

})


//기본정보 저장
function findId(findIdReq) {

	$.ajax({
		url: "http://localhost:8080/user/findId",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(findIdReq),
		success: function(response) {
			alert(response)
		},
		error: function(error) {
			alert(error)
		}
	})//ajax end
}