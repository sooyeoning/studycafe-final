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

	$(document).on('click', '#eye', function(){
		$('#inputUserPw').prop('type', 'text');
		$('.pos-ab').html(`<i id="eyeClosed" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed', function(){
		$('#inputUserPw').prop('type', 'password');
		$('.pos-ab').html(`<i id="eye" class="fi fi-rr-eye"></i>`);
	})
	
	$("#inputUserPw").keypress(function(event) {
		if (event.keyCode == 13) {
			let userId = $("#inputUserId").val();
			let userPw = $("#inputUserPw").val();

			let idResult = idNullCheck(userId);
			let pwResult = pwNullCheck(userPw);

			if (idResult && pwResult) {
				const loginReq = {
					userId: userId,
					userPw: userPw
				}

				login(loginReq);
			}
		}
	});

	//문제!!
	$(".submitBtn").click(function() {

		let userId = $("#inputUserId").val();
		let userPw = $("#inputUserPw").val();

		let idResult = idNullCheck(userId);
		let pwResult = pwNullCheck(userPw);

		if (idResult && pwResult) {
			const loginReq = {
				userId: userId,
				userPw: userPw
			}

			login(loginReq);
		}

	});

})


//기본정보 저장
function login(loginReq) {
	$.ajax({
		url: "http://localhost:8080/user/login",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(loginReq),
		success: function(response) {
			//아이디 or 비번 오류 발생 후 다시 아이디 or 비번 입력 안하고 로그인 누르면 이전 경고 문구 남아있음
			if (response == "로그인 실패") {
				//아이디 or 비번 오류
				$(".helpInline").html(
					"<p>아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다.</p><p>입력하신 내용을 다시 확인해주세요.</p>");
			} else {
				alert(response) //응답: 로그인한 회원 번호				
				location.href = "/" //홈으로 이동
			}
		},
		error: function(error) {
			alert(error);
		}
	})//ajax end
}

function idNullCheck(userId) {
	if (userId == null || userId == '') {
		$(".idHelpInline").html("아이디를 입력하세요");
		return false;
	}
	return true;
}

function pwNullCheck(userPw) {
	if (userPw == null || userPw == '') {
		$(".pwHelpInline").html("비밀번호를 입력하세요");
		return false;
	}
	return true;
}