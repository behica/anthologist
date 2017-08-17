var animatePoints = function() {        
    var revealPoint = function() {
        $(this).css({
            opacity: 1,
            transform: 'scaleX(1) translateY(0)'
        });
    };
    $.each($('.points'), revealPoint);
};

var fadeInHero = function(){
	$(".hero-content").fadeIn(1000);
}

$(document).on('turbolinks:load', function() {
    fadeInHero();
    if($(window).height() > 950) {
        setTimeout(function(){
        	animatePoints();}, 750)
    }

    var scrollDistance = $('.selling-points').offset().top - $(window).height() + 200;
    
    $(window).scroll(function(event) {
        if ($(window).scrollTop() >= scrollDistance) {
        animatePoints();
        }         
    });
});