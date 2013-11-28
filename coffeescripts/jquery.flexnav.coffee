###
	FlexNav.js 1.3.3

	Created by Jason Weaver http://jasonweaver.name
	Released under http://unlicense.org/

//
###

# Use local alias for $.noConflict() compatibility
$ = jQuery

$.fn.flexNav = (options) ->
  settings = $.extend
    'animationSpeed': 250,
    'transitionOpacity': true,
    'buttonSelector': '.menu-button',
    'hoverIntent': false,
    'hoverIntentTimeout': 150,
    'calcItemWidths': false,
    'hover': true
    options

  $nav = $(@)

  # Set some classes in the markup
  $nav.addClass('with-js')
  if settings.transitionOpacity is true
    $nav.addClass('opacity')
  $nav.find("li").each ->
    if $(@).has("ul").length
      $(@).addClass("item-with-ul").find("ul").hide()

  # Find the number of top level nav items and set widths
  if settings.calcItemWidths is true
    $top_nav_items = $nav.find('>li')
    count = $top_nav_items.length
    nav_width = 100 / count
    nav_percent = nav_width+"%"
  
  # Get the breakpoint set with data-breakpoint
  if $nav.data('breakpoint') then breakpoint = $nav.data('breakpoint')
	
  # Functions for hover support
  showMenu = ->
    if $nav.hasClass('lg-screen') is true and settings.hover is true
      if settings.transitionOpacity is true
        $(@).find('>ul')
          .addClass('flexnav-show')
          .stop(true, true)
          .animate(
            height: [ "toggle", "swing" ],
            opacity: "toggle",
            settings.animationSpeed
          )
      else
        $(@).find('>ul')
         .addClass('flexnav-show')
         .stop(true, true)
         .animate(
           height: [ "toggle", "swing" ],
           settings.animationSpeed
         )
  resetMenu = ->
    if $nav.hasClass('lg-screen') is true and $(@).find('>ul').hasClass('flexnav-show') is true and settings.hover is true
      if settings.transitionOpacity is true
        $(@).find('>ul')
          .removeClass('flexnav-show')
          .stop(true, true)
          .animate(
            height: [ "toggle", "swing" ],
            opacity: "toggle",
            settings.animationSpeed
          )
      else
        $(@).find('>ul')
          .removeClass('flexnav-show')
          .stop(true, true)
          .animate(
            height: [ "toggle", "swing" ],
            settings.animationSpeed
          )

  # Changing classes depending on viewport width and adding in hover support
  resizer = ->
    if $(window).width() <= breakpoint
      $nav.removeClass("lg-screen").addClass("sm-screen")
      if settings.calcItemWidths is true
        $top_nav_items.css('width','100%')
      selector = settings['buttonSelector'] + ', ' + settings['buttonSelector'] + ' .touch-button'
      $(selector).removeClass('active')
      # Toggle nav menu closed for one pager after anchor clicked
      $('.one-page li a').on( 'click', ->
        $nav.removeClass('flexnav-show')
      )
    else if $(window).width() > breakpoint
      $nav.removeClass("sm-screen").addClass("lg-screen")
      if settings.calcItemWidths is true
        $top_nav_items.css('width',nav_percent)
      # Make sure navigation is closed when going back to large screens
      $nav.removeClass('flexnav-show').find('.item-with-ul').on()
      $('.item-with-ul').find('ul').removeClass('flexnav-show')
      resetMenu()
      if settings.hoverIntent is true
        # Requires hoverIntent jquery plugin http://cherne.net/brian/resources/jquery.hoverIntent.html
        $('.item-with-ul').hoverIntent(
          over: showMenu,
          out: resetMenu,
          timeout: settings.hoverIntentTimeout
        )
      else if settings.hoverIntent is false
        $('.item-with-ul').on('mouseenter', showMenu).on('mouseleave', resetMenu)
	
  # Set navigation element for this instantiation
  $(settings['buttonSelector']).data('navEl', $nav)

  # Add in touch buttons
  touch_selector = '.item-with-ul, ' + settings['buttonSelector']
  $(touch_selector).append('<span class="touch-button"><i class="navicon">&#9660;</i></span>')

  # Toggle touch for nav menu
  toggle_selector = settings['buttonSelector'] + ', ' + settings['buttonSelector'] + ' .touch-button'
  $(toggle_selector).on('click', (e) ->
    $(toggle_selector).toggleClass('active')
    e.preventDefault()
    e.stopPropagation()
    bs = settings['buttonSelector']
    $btnParent = if ($(@).is(bs)) then $(@) else $(@).parent(bs)
    $thisNav = $btnParent.data('navEl')
    $thisNav.toggleClass('flexnav-show')
  )
				
  # Toggle for sub-menus
  $('.touch-button').on('click', (e) ->
    $sub = $(@).parent('.item-with-ul').find('>ul')
    $touchButton = $(@).parent('.item-with-ul').find('>span.touch-button')
    # remove class of flexnav-show from all elements that are not current
    if $nav.hasClass('lg-screen') is true
      $(@).parent('.item-with-ul').siblings().find('ul.flexnav-show').removeClass('flexnav-show').hide()
    # add class of flexnav-show to current
    if $sub.hasClass('flexnav-show') is true
      $sub.removeClass('flexnav-show').slideUp(settings.animationSpeed)
      $touchButton.removeClass('active')
    else if $sub.hasClass('flexnav-show') is false
      $sub.addClass('flexnav-show').slideDown(settings.animationSpeed)
      $touchButton.addClass('active')
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
  $(window).on('resize', resizer)