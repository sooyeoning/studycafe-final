/**
 * 이메일 중복확인
 * 이메일 빈칸 확인
 */


$(document).ready(function() {

	//비밀번호 노출
	$(document).on('click', '#eye', function(){
		$('#userPw').prop('type', 'text');
		$('.pw').html(`<i id="eyeClosed" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed', function(){
		$('#userPw').prop('type', 'password');
		$('.pw').html(`<i id="eye" class="fi fi-rr-eye"></i>`);
	})
	
	$(document).on('click', '#eyeDoubleCheck', function(){
		$('#checkPw').prop('type', 'text');
		$('.pwDoubleCheck').html(`<i id="eyeClosedDoubleCheck" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosedDoubleCheck', function(){
		$('#checkPw').prop('type', 'password');
		$('.pwDoubleCheck').html(`<i id="eyeDoubleCheck" class="fi fi-rr-eye"></i>`);
	})

	let sentAuthKey;

	$(".sendEmailAuthBtn").click(function() {
		//event.preventDefault();
		//$(this).unbind('click').click();

		let email = $("#email").val();

		if (email == '') {
			$(".emailHelp").html("이메일을 입력해주세요!")
		} else if( !isEmail(email) ){
			$(".emailHelp").html("올바른 형식의 이메일을 입력해주세요!")
		}else {
			$(this).attr("disabled", "disabled");

			let emailDuplicateCheck = checkEmailExists(email);

			if (emailDuplicateCheck) {
				alert(emailDuplicateCheck);
				alert("이미 사용중인 이메일입니다. 다른 이메일 주소를 입력 후 인증번호 받기 버튼을 눌러주세요.");
				$(this).removeAttr("disabled");
			} else {
				sentAuthKey = getEmailAuth(email);
				$(".hasSentEmailAuth").attr("value", true);
			}
		}

	});

	$(".checkEmailAuthBtn").click(function() {
		let inputAuthKey = $("#emailAuth").val();
		checkEmailAuth(inputAuthKey, sentAuthKey);
	})
}); //ready

function checkEmailExists(email) {
	let emailDuplicateCheck;

	//console.log(JSON.stringify(email));
	let param = {
		"email": email
	};
	//console.log(param);
	//console.log(JSON.stringify(param));

	$.ajax({
		url: "/signup/emailDuplicateCheck",
		type: "POST",
		data: JSON.stringify(param),
		contentType: "application/json; charset=UTF-8",
		async: false,
		success: function(response) {
			emailDuplicateCheck = response.emailDuplicated;
		},
		error: function(error) {
			console.log("ajax 오류" + error);
		}
	})
	return emailDuplicateCheck;
}

function getEmailAuth(email) {
	let authKey;
	$.ajax({
		url: "/email/sendAuth",
		type: "POST",
		data: { email: email },
		async: false,
		success: function(response) {
			alert("기입하신 메일로 인증번호가 전송되었습니다.")
			authKey = response;
		},
		error: function() {
			alert("인증번호 전송 실패했습니다.")
		}
	});
	return authKey;
}

function checkEmailAuth(inputAuthKey, sentAuthKey) {
	if (sentAuthKey == inputAuthKey) { //=== 안됨
		alert("인증번호 확인 완료되었습니다.")
		$(".hasCheckedEmailAuth").attr("value", true);
	} else {
		alert("올바른 인증번호가 아닙니다. 인증번호를 다시 확인하여 입력해주세요.")
	}

}

  //이메일 정규식 체크하는 함수
  function isEmail(email) {
  
  	// 이메일 형식에 맞게 입력했는지 체크
    let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
  
    return regExp.test(email); // 형식에 맞는 경우에만 true 리턴	
  
  }