/* JS for Plugins */

$( document ).on('turbolinks:load', function(){


    /* Sticky menu */
	$(".navsticky").sticky({
		topSpacing:0,
	});

    $('.navsticky').on('sticky-start', function() { console.log("Started"); });
    $('.navsticky').on('sticky-end', function() { console.log("Ended"); });


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



    $('.menu__icon').on('click', function() {
        $(this).closest('.menu')
            .toggleClass('menu_state_open');
    });

    $('.menu__links-item').on('click', function() {
        // do something

        $(this).closest('.menu')
            .removeClass('menu_state_open');
    })(jQuery);


});
