/**
 엔터치면 검색됨
 장소 누르면 상세조회로 연결
 */
$(document).ready(function() {
	
	showPricePaid(0);
	showPricePaid(1);
	showPricePaid(2);
	showPricePaid(3);
	showPricePaid(4);
	showPricePaid(5);
	showPricePaid(6);
	showPricePaid(7);
	showPricePaid(8);
	showPricePaid(9);
	showPricePaid(10);
	showPricePaid(11);
	showPricePaid(12);
	
});

function showPricePaid(i){
	let feeStatus = $("input[name='placeServiceDTOList["+i+"].feeStatus']");
			
			/* Checkbox change event */
			$(feeStatus).change(function() {
		   		// 모든 radio를 순회한다.
		   		$(feeStatus).each(function() {
		        	let value = $(this).val();              // value
		        	let checked = $(this).prop('checked');  // jQuery 1.6 이상 (jQuery 1.6 미만에는 prop()가 없음, checked, selected, disabled는 꼭 prop()를 써야함)
					console.log("value: checked {}:{}",value,checked);
		        	// var checked = $(this).attr('checked');   // jQuery 1.6 미만 (jQuery 1.6 이상에서는 checked, undefined로 return됨)
		        	// var checked = $(this).is('checked');
		       	
					 if(checked && (value == "paid")) {
						 $("input[name='placeServiceDTOList["+i+"].pricePaid']").prop('hidden',false);	
					 }
					 if(checked && (value != "paid")){
						 $("input[name='placeServiceDTOList["+i+"].pricePaid']").prop('hidden',true);	
		
					 }
		  	  	});
			
			})
}

