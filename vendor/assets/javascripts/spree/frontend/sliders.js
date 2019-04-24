$(document).ready(function () {

    // Hero slider
  $('#js-hero-slider').slick({
    dots: false,
    lazyLoad: 'ondemand',
    infinite: true,
    autoplay: true,
    autoplaySpeed:3000,
    fade: true,
    cssEase: 'linear',
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="icon-arrow-left"><span class="hidden">&nbsp;</span></i></span></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="icon-arrow-right"><span class="hidden">&nbsp;</span></i></span></a>'
  });

  // Taxonomies slyder home
  $('#js-below-slider').slick({
      dots: false,
      lazyLoad: 'ondemand',
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3,
      autoplay:false,
        responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
          dots: true
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          dots: true
        }
      }
    ],
      prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="fa fa-long-arrow-left"><span class="hidden">&nbsp;</span></i></span></a>',
      nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="fa fa-long-arrow-right"><span class="hidden">&nbsp;</span></i></span></a>'
  });

  // Product slider
  $('#js-product-slider').slick({
    dots: true,
    lazyLoad: 'ondemand',
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="icon-arrow-left"><span class="hidden">&nbsp;</span></i></span></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="icon-arrow-right"><span class="hidden">&nbsp;</span></i></span></a>'
  });

  // Product slider
  $('.js-products-related-list').slick({
    lazyLoad: 'ondemand',
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><i class="icon-arrow-left"><span class="hidden">&nbsp;</span></i></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><i class="icon-arrow-right"><span class="hidden">&nbsp;</span></i></a>',
    slidesToShow: 3,
    slidesToScroll: 3,
    infinite: true,
    autoplay: true,
    autoplaySpeed:3000,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('.js-products-accesories-list').slick({
    lazyLoad: 'ondemand',
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><i class="icon-arrow-left"><span class="hidden">&nbsp;</span></i></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><i class="icon-arrow-right"><span class="hidden">&nbsp;</span></i></a>',
    slidesToShow: 3,
    slidesToScroll: 3,
    infinite: true,
    autoplay: true,
    autoplaySpeed:3000,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('#js-product-thumbnails-slider').slick({
    dots: false,
    lazyLoad: 'ondemand',
    infinite: true,
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay:false,
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="icon-arrow-left"></i></span></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="icon-arrow-right"></i></span></a>',
    responsive: [
      {
        breakpoint: 768,
        settings: {
          vertical: false,
          verticalSwiping: false,
          prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="fa fa-angle-left"></i></span></a>',
          nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="fa fa-angle-right"></i></span></a>'
        }
      }
    ]
  });

  $('#js-product-thumb').slick({
    dots: true,
    infinite: true,
    autoplay: true,
    autoplaySpeed:3000,
    prevArrow: '<a href="javascript:void(0);" class="slick-prev"><span><i class="icon-arrow-left"><span class="hidden">&nbsp;</span></i></span></a>',
    nextArrow: '<a href="javascript:void(0);" class="slick-next"><span><i class="icon-arrow-right"><span class="hidden">&nbsp;</span></i></span></a>'
  });


    // Adjust height of slider
  $('div.slick-slider--hero__item').height($(window).height() - $('#header').height() + 50);
});
