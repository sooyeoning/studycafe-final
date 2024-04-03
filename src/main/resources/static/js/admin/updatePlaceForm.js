$(document).ready(function(){
	
	//기존에 유료 서비스인 항목들 가격 수정 가능
	//기존에 무료/미제공 서비스인 항목들 가격 수정 불가
	for(i=0; i<15; i++){
		let value = $('input[name="placeServiceDTOList['+i+'].feeStatus"]:checked').val();
		console.log(i+value);
		if(value == "free" || value == "N/A"){
			$('input[name="placeServiceDTOList['+i+'].pricePaid"]').prop('disabled', true);
		}	
	}
	
})