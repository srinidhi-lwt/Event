$(function() {
	$('.is-blocked').click(function(e) {
		e.preventDefault();

		var date = $(this).html();
		alert(date + " " +  "th is not available");
	});

	var blockedDates = []

	$('.block-date').click(function(e) {
		e.preventDefault();

		var date = $(this).siblings('.get-date').html();
		
		if (confirm("Are you sure to block" + " " + date )) {
			blockedDates.push(date);
			$('#_block_date').val(blockedDates);
		}
	});

	$('.column-hover-content').hover(function(e) {
		$('.column-hover-content').removeClass('show-btn');
		$(this).addClass('show-btn');
	});
});


// $btn = $(this).find('a');
// $height = $btn.height();
// $width = $btn.width();
// $btn.css('margin-top', - $height / 2);
// $btn.css('margin-left', - $width / 2);