
// global variables 
var compareWidth, //previous width used for comparison
	detector, //the element used to compare changes
	smallScreen; // Size of maximum width of single column media query
jQuery(document).ready(function(){

    //set the initial values
    detector = jQuery('.js');
    compareWidth = detector.width();
	smallScreen = '820'; 

	if ($(window).width() < smallScreen) {
		$("body").addClass("one-column");		
	}
	else {
		$("body").addClass("two-column");	
	}

	// Toggle for nav menu
	$('.js .menu-button').click(function() {
		$('[role="navigation"]').slideToggle('fast', function() {});			
	});	
	// Toggle click for sub-menus on touch and or small screens
	$('.touch .item-with-ul, .one-column .item-with-ul').click(function() {
		$(this).find('.sub-menu').slideToggle('fast', function() {});
	});	
	// Credit: http://webdeveloper2.com/2011/06/trigger-javascript-on-css3-media-query-change/
    jQuery(window).resize(function(){
        //compare everytime the window resize event fires
        if(detector.width()!=compareWidth){

            //a change has occurred so update the comparison variable
            compareWidth = detector.width();
			
			if (compareWidth < smallScreen) {
				$("body").removeClass("two-column").addClass("one-column");				
			}
			else {
				$("body").removeClass("one-column").addClass("two-column");	
			}
			if (compareWidth >= smallScreen) {
				$('[role="navigation"]').show();
			}
        }

    });	
	
 });	