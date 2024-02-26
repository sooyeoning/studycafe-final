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
	//장소 추가시 사용하는 곳 - input id:imageFile 변경시 
	$("#imageFile").on("change", function(event) {

		var file = event.target.files[0];
		
		var reader = new FileReader();
		reader.onload = function(event) {
			$("#preview").attr("src", event.target.result);
		}

		reader.readAsDataURL(file);
	});
	
	//장소 수정
	$("#thumbnail").on("change", function(event) {

		var file = event.target.files[0];

		var reader = new FileReader();
		reader.onload = function(e) {

			$("#previewThumb").attr("src", e.target.result);
		}

		reader.readAsDataURL(file);
	});
	
	$("#subImage").on("change", function(event) {

		var reader = new FileReader();
		[...event.target.files].forEach(file => {
			reader.readAsDataURL(file);
			reader.onload = function(e){
				$(".subImages").append(
					`<img id="previewSub" class="subImage" src="${e.target.result}"/>`)
			}
		})

		reader.onload = function(e) {

			$("#previewSub").attr("src", e.target.result);
		}

	});
	
	$("#price").on("change", function(event) {

		var file = event.target.files[0];

		var reader = new FileReader();
		reader.onload = function(e) {

			$("#previewPrice").attr("src", e.target.result);
		}

		reader.readAsDataURL(file);
	});

});

function readURL(input) {
	if (input.file) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.file);
	} else {
		document.getElementById('preview').src = "";
	}
}