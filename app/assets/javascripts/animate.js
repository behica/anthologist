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
  setTimeout(function(){
    animatePoints();}, 500)
  setTimeout(function() {
      $('.alert-success').slideUp();
  }, 2500);
});
