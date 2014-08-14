$(document).ready(function(){
	// need to change this if prize steps change
	var fill_bar = $(".progress_bar_wrapper").find(".filled")
	var referral_count = fill_bar.data('referralCount');
	fill_bar.css({
		width: ((referral_count / 30) * 100) + 5 + "%"
	})

})