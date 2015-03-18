jQuery(document).foundation();

jQuery(document).ready(function(){
    var $slider = jQuery(".slider");
    if ($slider.length > 0) {
        $slider.slick({
            arrows: true,
            dots: true
        });
    }
});
