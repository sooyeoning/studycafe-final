/**

 */
$(document).ready(function() {

	$('#eye1').on('click', function(){
		$('#originPw').prop('type', 'text');
		$('.eye1').html(`<i id="eyeClosed1" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed1', function(){
		$('#originPw').prop('type', 'password');
		$('.eye1').html(`<i id="eye1" class="fi fi-rr-eye"></i>`);
	})
	
	$('#eye2').on('click', function(){
		$('#newPw').prop('type', 'text');
		$('.eye2').html(`<i id="eyeClosed2" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed2', function(){
		$('#newPw').prop('type', 'password');
		$('.eye2').html(`<i id="eye2" class="fi fi-rr-eye"></i>`);
	})
	
	$('#eye3').on('click', function(){
		$('#checkNewPw').prop('type', 'text');
		$('.eye3').html(`<i id="eyeClosed3" class="fi fi-rr-eye-crossed"></i>`);
	})
	
	$(document).on('click', '#eyeClosed3', function(){
		$('#checkNewPw').prop('type', 'password');
		$('.eye3').html(`<i id="eye3" class="fi fi-rr-eye"></i>`);
	})
	
}); //ready end
