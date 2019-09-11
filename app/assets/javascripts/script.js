/* JS for Plugins */

$(document).ready(function(){


    /* Sticky menu */
	$(".navsticky").sticky({
		topSpacing:0,
	});


    /* Nice Scroll */
    $("html").niceScroll({
        cursorwidth: '10px',
        scrollspeed: '60',
        mousescrollstep: '45'
    });


    /* Pretty Photo */
    $("a[rel^='prettyPhoto']").prettyPhoto({
        animationSpeed: 'fast',
        opacity: 0.7,
        social_tools: "",
        deeplinking: false
    });

    $('ul.nav li.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true);
        $(this).addClass('open');
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true);
        $(this).removeClass('open');
    });

    enquire.register("screen and (min-width:992px)", {
        match : function() {

            $('ul.nav li.dropdown').hover(function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeIn();
            }, function () {
                $(this).find('.dropdown-menu').stop(true, true).delay(100).fadeOut();
            });
        },
        unmatch : function() {


        }

    });
});
