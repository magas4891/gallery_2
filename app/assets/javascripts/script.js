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

});
