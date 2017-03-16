$(function() {
	$('.is-blocked').click(function(e) {
		e.preventDefault();

		var date = $(this).html();
		alert(date + " " +  "th is not available");
	});
})