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

	$('form').on('submit', function(event) {
		event.preventDefault();
		$(".findPwBtn").attr("disabled", "disabled");
		//스피너 적용
		this.submit();
	})

	$("#email").keypress(function(event) {
		if (event.keyCode == 13) {
			$(".findPwBtn").attr("disabled", "disabled");
			//스피너 적용
			$('form').submit();
		}
	})
})
