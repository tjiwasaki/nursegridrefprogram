$(document).ready(function(){
	// need to change this if prize steps change
	var fill_bar = $(".progress_bar_wrapper").find(".filled")
	var referral_count = fill_bar.data('referralCount');
	fill_bar.css({
		width: ((referral_count / 40) * 100) + 5 + "%"
	})

  // adjusting size of body for mobile to keep things above the fold
  var window_height = parseInt($(window).height());
  $("body.mobile").find(".hero.referral_page").css({
    height: (window_height - 250) + "px"
  });
  $("body.mobile").find(".hero.main_page").css({
    height: (window_height - 150) + "px"
  });


});