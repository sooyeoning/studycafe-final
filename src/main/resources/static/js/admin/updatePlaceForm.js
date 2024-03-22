$(document).ready(function(){
	
	/*//유료 제공인 항목만 값 수정 가능
	for(i=0; i<15; i++){
		let value = $('input[name="placeServiceDTOList['+i+'].feeStatus"]:checked').val();
		console.log(i+value);
		if(value == "free" || value == "N/A"){
			$('input[name="placeServiceDTOList['+i+'].pricePaid"]').attr('hidden', true);
		}	
	
	}
	
	for(i=0; i<15; i++){
		$('input[name="placeServiceDTOList['+i+'].feeStatus"]').on('change', function(){
			let changedVal = $(this).val();
			alert(changedVal);
			if(changedVal=="paid"){ //작성 가능하게 변경!!!!!!!!!
				$('input[name="placeServiceDTOList['+i+'].pricePaid"]').removeAttr('hidden');
			} else {
				$('input[name="placeServiceDTOList['+i+'].pricePaid"]').hide();
			}
		} 
		
	)}*/
	
	//기존에 유료 서비스인 항목들 가격 수정 가능
	//기존에 무료/미제공 서비스인 항목들 가격 수정 불가
	for(i=0; i<15; i++){
		let value = $('input[name="placeServiceDTOList['+i+'].feeStatus"]:checked').val();
		console.log(i+value);
		if(value == "free" || value == "N/A"){
			$('input[name="placeServiceDTOList['+i+'].pricePaid"]').prop('disabled', true);
		}	
	}
	
	//유료 서비스로 수정시 가격 수정 가능하게 변경
	/*let list = [];
	for(i=0; i<15; i++){		
		 list.push($('input[name="placeServiceDTOList['+i+'].feeStatus"]'));
	}
	
	list.forEach((item)=>{
		item.addEventListener("change", (e)=>{
			const current = e.currentTarget();
			if(current=="paid"){
				$('input[name="placeServiceDTOList['+e+'].pricePaid"]').prop('disabled', false);
			}
		})
	})*/
})