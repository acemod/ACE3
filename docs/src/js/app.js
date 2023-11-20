jQuery(document).ready(function(){

    const $navigation = jQuery("nav.top-bar");
    const $navigationToggle = $navigation.find(".toggle-topbar a");
    $navigationToggle.on("click", (e) => {
        e.preventDefault();
        $navigation.toggleClass("expanded");
    });


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


    var $toc = jQuery("#toc");
    if ($toc.length > 0) {
        $toc.toc({
            headers: "#content h2, #content h3, #content h4, #content h5, #content h6",
            showEffect: "none",
            noBackToTopLinks: true
        });

        if ($toc.html() === "") {
            jQuery(".js-expandToc").remove();
            jQuery(".toc-header").remove();
        }
    }


    var $tables = $("#content table");
    $tables.each(function(index, item) {
        var $table = $(item);
        $table.wrap("<div class=\"table-wrapper\">")
    });
});

window.app = window.app || {};

window.app.contentSearch.init();
