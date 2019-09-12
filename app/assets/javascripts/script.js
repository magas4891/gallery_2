/* JS for Plugins */

$( document ).on('turbolinks:load', function(){


    /* Sticky menu */
	$(".navsticky").sticky({
		topSpacing:0,
	});


    /* Nice Scroll */
    $("body").niceScroll({
        cursorwidth: '10px',
        scrollspeed: '60',
        mousescrollstep: '45'
    });


    $('ul.nav li.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true);
        $(this).addClass('open');
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true);
        $(this).removeClass('open');
    });

});
