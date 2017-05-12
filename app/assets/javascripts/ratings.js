$(function() {
	$('.rating-btn').click(function(e) {
		e.preventDefault();

		$('#rating').addClass('is-opened');
		orderId = $(this).attr('data-order');
		$('#rating_order_id').val(orderId);
	});

	$('.close-rating').click(function(e) {
		e.preventDefault();
		
		$('#rating').removeClass('is-opened');
	});

	$('[class^="quality-rating"]').click(function(e) {
		ratingValue = $(this).attr('data-rating');
		$('[class^="quality-rating"]').hide();
		$('.rated-quality').html(ratingValue);
		$('.rated-quality').removeClass('hide');
		$('#rating_quality').val(ratingValue);
	});

	$('[class^="quantity-rating"]').click(function(e) {
		ratingValue = $(this).attr('data-rating');
		$('[class^="quantity-rating"]').hide();
		$('.rated-quantity').html(ratingValue);
		$('.rated-quantity').removeClass('hide');
		$('#rating_quantity').val(ratingValue);
	});

	$('[class^="time-rating"]').click(function(e) {
		ratingValue = $(this).attr('data-rating');
		$('[class^="time-rating"]').hide();
		$('.rated-time').html(ratingValue);
		$('.rated-time').removeClass('hide');
		$('#rating_time').val(ratingValue);
	});
});
