
$(document).ready(function() {

	$("#email").keypress(function(event) {
		if (event.keyCode == 13) {

			let userName = $("#name").val();
			let email = $("#email").val();

			const findIdReq = {
				name: userName,
				email: email
			}

			findId(findIdReq);
		}
	})


})

