###
	FlexNav.js 0.9

	Copyright 2013, Jason Weaver http://jasonweaver.name
	Released under http://unlicense.org/

//
###

$.fn.flexNav = (options) ->
	settings = $.extend
		'animationSpeed': 100,
		'buttonSelector': '.menu-button'
		options
			
	$nav = $(@)
	nav_open = false
	isDragging = false
	
	# Set some classes in the markup
	$nav.find("li").each ->
		if $(@).has("ul").length
			$(@).addClass("item-with-ul").find("ul").hide()
	
	if $nav.data('breakpoint') then breakpoint = $nav.data('breakpoint')
	
	resizer = ->
		if $(window).width() <= breakpoint
			$nav.removeClass("lg-screen").addClass("sm-screen")
			# Toggle nav menu closed for one pager after anchor clicked
			$('.one-page li a').on( 'click', ->
				$nav.removeClass('show')
			)
			$('.item-with-ul').off()
		else
			$nav.removeClass("sm-screen").addClass("lg-screen")
			$nav.removeClass('show')
			$('.item-with-ul').on('mouseenter', ->
				$(@).find('>ul').addClass('show').stop(true, true).slideDown(settings.animationSpeed)
			).on('mouseleave', ->
				$(@).find('>ul').removeClass('show').stop(true, true).slideUp(settings.animationSpeed)	
			)
	
	# Set navigation element for this instantiation
	$(settings['buttonSelector']).data('navEl', $nav)

	# Add in touch buttons
	selector = '.item-with-ul, ' + settings['buttonSelector'];
	$(selector).append('<span class="touch-button"><i class="navicon">&#9660;</i></span>')

	# Toggle touch for nav menu
	selector = settings['buttonSelector'] + ', ' + settings['buttonSelector'] + ' .touch-button'
	$(selector).on('touchstart mousedown', (e) ->
		e.preventDefault()
		e.stopPropagation()
		console.log(isDragging)
		$(@).on( 'touchmove mousemove', (e) ->
			msg = e.pageX
			isDragging = true
			$(window).off("touchmove mousemove")
		)		
	).on('touchend mouseup', (e) ->
		e.preventDefault()
		e.stopPropagation()
		bs         = settings['buttonSelector']
		$btnParent = if ($(@).is(bs)) then $(@) else $(@).parent(bs)
		$thisNav   = $btnParent.data('navEl')
		isDragging = false
		if isDragging is false
			console.log('clicked')
			if nav_open is false
				$thisNav.addClass('show')
				nav_open = true
			else if nav_open is true
				$thisNav.removeClass('show')
				nav_open = false
		)
			
				
	# Toggle for sub-menus
	$('.touch-button').on('touchstart mousedown', (e) ->
		e.stopPropagation()
		e.preventDefault()
		$(@).on( 'touchmove mousemove', (e) ->
			isDragging = true
			$(window).off("touchmove mousemove")
		)
	).on('touchend mouseup', (e) ->
		e.preventDefault()
		e.stopPropagation()
		$sub = $(@).parent('.item-with-ul').find('>ul')
		# remove class of show from all elements that are not current
		if $nav.hasClass('lg-screen') is true
			$(@).parent('.item-with-ul').siblings().find('ul.show').removeClass('show').hide()
		# add class of show to current
		if $sub.hasClass('show') is true
			$sub.removeClass('show').slideUp(settings.animationSpeed)
		else if $sub.hasClass('show') is false
			$sub.addClass('show').slideDown(settings.animationSpeed)	
	)
	
	# Sub ul's should have a class of 'open' if an element has focus
	$nav.find('.item-with-ul *').focus ->
		# remove class of open from all elements that are not focused
		$(@).parent('.item-with-ul').parent().find(".open").not(@).removeClass("open").hide()
		# add class of open to focused ul
		$(@).parent('.item-with-ul').find('>ul').addClass("open").show()

	# Call once to set		
	resizer()

	# Call on browser resize	
	$(window).on('resize', resizer);
