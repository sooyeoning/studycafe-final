/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */
const urlParams = new URL(location.href).searchParams;

let placeId = urlParams.get('id');

$(document).ready(function() {

	alert("수정에 성공했습니다.");
	window.location.href = "/";
});