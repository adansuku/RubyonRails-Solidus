var removeActive = function () {
	$('#grid-th').removeClass('active');
	$('#grid-th-vertical').removeClass('active');
	$('#grid-th-large').removeClass('active');
	$('#grid-th-extra-large').removeClass('active');
};


$('document').ready( function () {

	// Added to activate mobile or desktop icon   

	var windowWidth = $(window).width();
	if (windowWidth > 767){
		$('#grid-th-large').addClass('active');
	} else {
		$('#grid-th-vertical').addClass('active');
	}
 
	$('a#grid-th-extra-large').on('click', function(){
		removeActive();
		$('#grid-th-extra-large').addClass('active');
		$('ul.product-list li').each( function() {
			$(this).css('width','25%');
		});
		$('ul.product-listing  li').each( function() {
			$(this).css('width','25%');
		});
	});

	$('a#grid-th-large').on('click', function(){
		removeActive();
		$('#grid-th-large').addClass('active');
		$('ul.product-list li').each( function() {
			$(this).css('width','33.33333%');
		});

		$('ul.product-listing  li').each( function() {
			$(this).css('width','33.33333%');
		});
	});

	$('a#grid-th').on('click', function(){
		removeActive();
		$('#grid-th').addClass('active');
		$('ul.product-list  li').each( function() {
			$(this).css('width','49%');
			$('span.cost-price.selling').css('margin-right','0px');
			$('span.cost-price.selling').css('font-size','12px');
			$('.product-list div.texts h3').css('font-size','12px');
			$('span.price.selling').css('margin','0px');
			$('span.price.selling').css('padding','0px');
			$('span.price.selling').css('font-size','12px');
		});
		$('ul.product-listing  li').each( function() {
			$(this).css('width','49%');
			$('span.cost-price.selling').css('margin-right','0px');
			$('span.cost-price.selling').css('font-size','12px');
			$('.product-list div.texts h3').css('font-size','12px');
			$('span.price.selling').css('margin','0px');
			$('span.price.selling').css('padding','0px');
			$('span.price.selling').css('font-size','12px');;
		});
	});

	$('a#grid-th-vertical').on('click', function(){
		removeActive();
		$('#grid-th-vertical').addClass('active');
		$('ul.product-list  li').each( function() {
			$(this).css('width','100%');
		});
		$('ul.product-listing  li').each( function() {
			$(this).css('width','100%');
		});
	});
});


