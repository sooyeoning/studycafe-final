$(document).ready(function(){
	
	//유료 제공인 항목만 값 수정 가능
	for(i=0; i<15; i++){
		let value = $('input[name="placeServiceDTOList['+i+'].feeStatus"]:checked').val();
		console.log(i+value);
		if(value == "free" || value == "N/A"){
			$('input[name="placeServiceDTOList['+i+'].pricePaid"]').attr('hidden', true);
		}	
	
	}
	
	for(i=0; i<15; i++){
		$(document).on('change', 'input[name="placeServiceDTOList['+i+'].feeStatus"]', function(){
			let changedVal = $(this).val();
			alert(changedVal);
			if(changedVal == "paid"){ //작성 가능하게 변경!!!!!!!!!
				$('input[name="placeServiceDTOList['+i+'].pricePaid"]').removeAttr('hidden');
			} else {
				$('input[name="placeServiceDTOList['+i+'].pricePaid"]').hide();
			}
		} 
		
	)}
})