/**
 * 
 */
$(document).ready(function() {

	$(".submitBtn").click(function() {
		let userId = $("#userId").val();
		let userPw = $("#userPw").val();
		let userName = $("#name").val();
		let nickname = $("#nickname").val();
		let email = $("#email").val();
		let address = $("#address").val();

		const userEntity = {
			userId: userId,
			userPw: userPw,
			name: userName,
			nickname: nickname,
			email: email,
			address: address
		}

		signup(userEntity);
	})
})

function signup(userEntity) {
	$.ajax({
		url: "/user/post",
		type: "POST",
		contentType: "application/json; charset=UTF-8",
		data: JSON.stringify(userEntity),
		success: function(response) {
			alert(response);
			if (response === "회원가입에 성공했습니다.") {
				// 페이지 이동: window.location.href
				window.location.href = "/"
			}
		},
		error: function(error) {
			console.log(error);
		}
	});
}