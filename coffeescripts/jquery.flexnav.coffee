###
	FlexNav.js 0.5

	Copyright 2013, Jason Weaver http://jasonweaver.name
	Released under the WTFPL license
	http://sam.zoy.org/wtfpl/

//
###

$.fn.flexNav = (options) ->
	settings = $.extend
		'animationSpeed': 'fast'
		options

		$nav = $(@)
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
				# Toggle nav menu closed for one pager after anchor clicked
				$('.sm-screen.one-page li a').on( 'click', ->
					$nav.removeClass('show')
				)
				$('.item-with-ul').off()
			else
				$nav.removeClass("sm-screen").addClass("lg-screen")
				$nav.removeClass('show')
				$('.item-with-ul').on(
					mouseenter: ->	
						$(@).find('>ul').slideDown(settings.animationSpeed)
					mouseleave: ->
						$(@).find('>ul').slideUp(settings.animationSpeed)				
				)

		# Set class on $nav for touch/no-touch
		is_touch_device = ->
			!!('ontouchstart' in window)

		if is_touch_device()
			$nav.addClass('flexNav-touch')
		else
			$nav.addClass('flexNav-no-touch')
		
		# Set some classes in the markup
		$(@).find("li").each ->
			if $(@).has("ul").length
				$(@).addClass("item-with-ul")
		
		# Toggle for nav menu
		$('.menu-button').on( 'click', ->
			$nav.toggleClass('show')
		)
				
		# Add in touch buttons	
		$('.menu-button, .item-with-ul').append('<span class="touch-button"><i class="navicon">&#9660;</i></span>')
			
		# Toggle click for sub-menus on touch and or small screens
		$('.touch-button').on('click', ->	
			$(@).parent('.item-with-ul').find('>ul').slideToggle(settings.animationSpeed)					
		)
		
		# Sub ul's should have a class of 'open' if an element has focus
		$('.item-with-ul *').focus ->
			# remove class of open from all elements that are not focused
			$(@).parent('.item-with-ul').parent().find(".open").not(@).hide().removeClass("open")
			# add class of open to focused ul
			$(@).parent('.item-with-ul').find('>ul').addClass("open").show()
				
	# Call once to set		
	resizer()
	
	# Call on browser resize	
	$(window).on('resize', resizer);