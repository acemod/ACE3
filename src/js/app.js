jQuery(document).foundation();

jQuery(document).ready(function(){
    var $slider = jQuery(".slider");
    if ($slider.length > 0) {
        $slider.slick({
            arrows: true,
            dots: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 6000,
            responsive: [
                {
                    breakpoint: 640,
                    settings: {
                        arrows: false
                    }
                }
            ]
        });
    }
});
