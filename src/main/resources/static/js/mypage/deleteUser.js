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

	$(".submitBtn").click(function() { //회원 탈퇴
		let id = $(".submitBtn").val();

		deleteUser(id);
	})

	$(".cancelBtn").click(function(){
		alert("홈 화면으로 이동합니다.");
		location.href = "/";
	})
})


function deleteUser(id){
	$.ajax({
		method: "delete",
		url: "/web/mypage/out/"+id,
		success: function(response){
			alert("회원 탈퇴가 완료되었습니다. 그동안 사용해주셔서 감사합니다.");
			location.href = "/";
		},
		error: function(error){
			alert("회원 탈퇴 중 오류가 발생했습니다.");
		}
	})
}