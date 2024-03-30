/**

 */
$(document).ready(function() {

	$(".searchBtn").click(function() {
		let placeName = $("#name").val();
		let priceCategory = $("#priceCategory").val();
		let areaCode = $("#areaCode").val();

		const placeGetReq = {
			name: placeName,
			priceCategory: priceCategory,
			areaCode: areaCode
		}

		search(placeGetReq);
	});

});


//기본정보 저장
function search(placeGetReq) {

	$.ajax({
		url: "/place/list",
		type: "POST",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(placeGetReq),
		success: function(response) {
			console.log(response);
			for (let i = 0; i < response.length; i++) {
				$(".result").append(response[i].name);
				$(".result").append(' ');
				$(".result").append(response[i].sixHrs);
				$(".result").append('<br>');

			}
		},
		error: function(error) {
			alert(error);
		}
	});//ajax end
}