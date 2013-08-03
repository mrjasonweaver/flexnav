/*
	FlexNav.js 0.9

	Copyright 2013, Jason Weaver http://jasonweaver.name
	Released under http://unlicense.org/

//
*/


(function() {
  var $;

  $ = jQuery;

  $.fn.flexNav = function(options) {
    var $nav, breakpoint, nav_open, resizer, selector, settings;
    settings = $.extend({
      'animationSpeed': 150,
      'buttonSelector': '.menu-button',
      'flexbox': true
    }, options);
    $nav = $(this);
    nav_open = false;
    $nav.find("li").each(function() {
      if ($(this).has("ul").length) {
        return $(this).addClass("item-with-ul").find("ul").hide();
      }
    });
    if (settings.flexbox = true) {
      $nav.addClass('flexbox');
    }
    if ($nav.data('breakpoint')) {
      breakpoint = $nav.data('breakpoint');
    }
    resizer = function() {
      if ($(window).width() <= breakpoint) {
        $nav.removeClass("lg-screen").addClass("sm-screen");
        $('.one-page li a').on('click', function() {
          return $nav.removeClass('show');
        });
        return $('.item-with-ul').off();
      } else if ($(window).width() > breakpoint) {
        $nav.removeClass("sm-screen").addClass("lg-screen");
        $nav.removeClass('show');
         return $('.item-with-ul').hoverIntent({
	            over: showMenu,
	            out: resetMenu,
	            timeout: 100
	        });
      }
    };
    $(settings['buttonSelector']).data('navEl', $nav);
    selector = '.item-with-ul, ' + settings['buttonSelector'];
    $(selector).append('<span class="touch-button"><i class="navicon">&#9660;</i></span>');
    selector = settings['buttonSelector'] + ', ' + settings['buttonSelector'] + ' .touch-button';
    $(selector).on('touchstart mousedown', function(e) {
      var $btnParent, $thisNav, bs;
      e.preventDefault();
      e.stopPropagation();
      bs = settings['buttonSelector'];
      $btnParent = $(this).is(bs) ? $(this) : $(this).parent(bs);
      $thisNav = $btnParent.data('navEl');
      if (nav_open === false) {
        $thisNav.addClass('show');
        return nav_open = true;
      } else if (nav_open === true) {
        $thisNav.removeClass('show');
        return nav_open = false;
      }
    });
    $('.touch-button').on('touchstart click', function(e) {
      var $sub;
      e.stopPropagation();
      e.preventDefault();
      $sub = $(this).parent('.item-with-ul').find('>ul');
      if ($nav.hasClass('lg-screen') === true) {
        $(this).parent('.item-with-ul').siblings().find('ul.show').removeClass('show').hide();
      }
      if ($sub.hasClass('show') === true) {
        return $sub.removeClass('show').slideUp(settings.animationSpeed);
      } else if ($sub.hasClass('show') === false) {
        return $sub.addClass('show').slideDown(settings.animationSpeed);
      }
    });
    $nav.find('.item-with-ul *').focus(function() {
      $(this).parent('.item-with-ul').parent().find(".open").not(this).removeClass("open").hide();
      return $(this).parent('.item-with-ul').find('>ul').addClass("open").show();
    });
    resizer();
    return $(window).on('resize', resizer);
  };

}).call(this);

function showMenu(){
    $(this).find('> ul').fadeIn(100);
}
function resetMenu(){
    $(this).find('> ul').fadeOut(100);
}
