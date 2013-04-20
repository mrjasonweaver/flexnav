###
	FlexNav.js 0.6

	Copyright 2013, Jason Weaver http://jasonweaver.name
	Released under the WTFPL license
	http://sam.zoy.org/wtfpl/

//
###

$.fn.flexNav = (options) ->
	settings = $.extend
		'transitionSpeed': '0.4s'
		'itemHeight': 50
		options
			
	$nav = $(@)
	nav_open = false
	transition = 'all '+settings.transitionSpeed+' ease-in-out'
	
	# Set some classes and data attrs in the markup
	$nav.find("li").each ->
		if $(@).has("ul").length
			$(@).addClass("item-with-ul")
			$sub_nav = $(@).find('>ul')
			count = $sub_nav.find('li').length
			$sub_nav.attr("data-height", settings.itemHeight*count)
			$nav.attr("data-height", settings.itemHeight*count)

	nav_count = $nav.find('li').length
	$nav.attr("data-height", settings.itemHeight*nav_count)	
	
	if $nav.data('breakpoint') then breakpoint = $nav.data('breakpoint')
	# if data-breakpoint is in ems, do some em calc
	if $nav.data('breakpoint-em')
		hidden_text = "<div class='hidden-text'>M and FlexNav</div>"
		$('body').append(hidden_text)
		$sneaky_div = $('.hidden-text')
		$sneaky_div.css 
			'display':'inline-block'
			'padding':'0'
			'line-height':'1'
			'position':'absolute'
			'visibility':'hidden'
			'font-size':'1em'
		em_unit = $nav.data('breakpoint-em')
		base_font = $sneaky_div.css('font-size')
		breakpoint = em_unit * parseInt(base_font)
		console.log(breakpoint)
		$sneaky_div.remove()
	
	resizer = ->
		if $(window).width() <= breakpoint
			$nav.removeClass("lg-screen").addClass("sm-screen")
			# set all drops to max-height: 0
			$nav.css("maxHeight": 0).find(".item-with-ul ul").css("maxHeight":0)
			# Toggle nav menu closed for one pager after anchor clicked
			$('.one-page li a').on( 'click', ->
				$nav.removeClass('show')
			)
			$('.item-with-ul').off()
		else
			$nav.removeClass("sm-screen").addClass("lg-screen")
			$nav.removeClass('show')
			$nav.css("maxHeight": settings.itemHeight).find(".item-with-ul ul").css("maxHeight":0)
			$('.item-with-ul').on(
				mouseenter: ->	
					$(@).find('>ul').addClass('show')
				mouseleave: ->
					$(@).find('>ul').removeClass('show')			
			)
			
	# set transitions
	$(".flexnav, .item-with-ul ul, .show").css(
		WebkitTransition : transition
		MozTransition : transition
		MsTransition : transition
		OTransition : transition
		transition : transition
	)
		
	# Add in touch buttons	
	$('.item-with-ul, .menu-button').append('<span class="touch-button"><i class="navicon">&#9660;</i></span>')

	# Toggle touch for nav menu
	$('.menu-button, .menu-button .touch-button').on('touchstart click', (e) ->
		e.stopPropagation()
		e.preventDefault()
		nav_drop_height = $nav.data("height")
		if nav_open is false
			$nav.css("maxHeight":nav_drop_height).addClass('show')
			nav_open = true
		else if nav_open is true
			$nav.css("maxHeight":0).removeClass('show')			
			nav_open = false
		)
				
	# Toggle for sub-menus
	$('.touch-button').on('touchstart click', (e) ->
		e.stopPropagation()
		e.preventDefault()
		$sub = $(@).parent('.item-with-ul').find('>ul')
		drop_height = $sub.data("height")

		# remove class of show from all elements that are not current
		if $nav.hasClass('lg-screen') is true
			$(@).parent('.item-with-ul').siblings().find('ul.show').removeClass('show')
		# add class of show to current
		if $sub.hasClass('show') is true
			$sub.css("maxHeight":0).removeClass('show')
		else if $sub.hasClass('show') is false
			$sub.css("maxHeight":drop_height).addClass('show')		
	)
	
	# Sub ul's should have a class of 'open' if an element has focus
	$('.item-with-ul *').focus ->
		# remove class of open from all elements that are not focused
		$(@).parent('.item-with-ul').parent().find(".open").not(@).removeClass("open")
		# add class of open to focused ul
		$(@).parent('.item-with-ul').find('>ul').addClass("open")

	# Call once to set		
	resizer()

	# Call on browser resize	
	$(window).on('resize', resizer);
