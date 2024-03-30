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

	$(".submitBtn").click(function() {
		//지금 로그인된 회원 정보
		let loginId = $(".submitBtn").val();

		let userId = $("#userId").val();
		let userPw = $("#userPw").val();

		const loginReq = {
			userId: userId,
			userPw: userPw
		}

		console.log("loginId : "+loginId);
		if (loginId != userId) {
			alert("로그인된 회원님과 다른 회원님입니다. 로그인한 회원님 정보를 입력해주세요!")
		} else {
			login(loginReq);
		}
	})

	$(document).on('click', '#eye', function(){
		$('#userPw').prop('type', 'text');
		$('.pos-ab').html(`<i id="eyeClosed" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed', function(){
		$('#userPw').prop('type', 'password');
		$('.pos-ab').html(`<i id="eye" class="fi fi-rr-eye"></i>`);
	})
})


//기본정보 저장
function login(loginReq) {
	alert("시작")
	$.ajax({
		url: "/user/login",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(loginReq),
		success: function(response) {
			if (response == "로그인 실패") {
				//아이디 or 비번 오류
				$(".helpInline").html(
					"<p>아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.입력하신 내용을 다시 확인해주세요.</p>");
			} else {
				location.href = "/web/mypage/out" //홈으로 이동
			}
		},
		error: function(error) {
			alert(error)
		}
	})//ajax end
}