  // Category Owl Carousel
  var objowlcarousel = $(".owl-carousel-category");
  if (objowlcarousel.length > 0) {
    objowlcarousel.owlCarousel({
      responsive: {
        0: {
          items: 1,
        },
        600: {
          items: 3,
          nav: false,
        },
        1000: {
          items: 4,
        },
        1200: {
          items: 8,
        },
      },
      loop: true,
      lazyLoad: true,
      autoplay: true,
      autoplaySpeed: 1000,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
      nav: true,
      navText: [
        "<i class='fa fa-chevron-left'></i>",
        "<i class='fa fa-chevron-right'></i>",
      ],
    });
  }

  // Login Owl Carousel
  var mainslider = $(".owl-carousel-login");
  if (mainslider.length > 0) {
    mainslider.owlCarousel({
      items: 1,
      lazyLoad: true,
      loop: true,
      autoplay: true,
      autoplaySpeed: 1000,
      autoplayTimeout: 2000,
      autoplayHoverPause: true,
    });
  }