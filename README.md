# FlexNav jQuery Plugin

### A Device Agnostic Approach to Complex Site Navigation with Support for Touch and Keyboard Accessibility

* * *
### The Details

* [View Demo](http://jasonweaver.name/lab/flexiblenavigation/)
* [Single page site with fixed navigation demo](http://jasonweaver.name/lab/flexiblenavigation/single-page-pattern.html)

A mobile-first example of using media queries and jQuery to make a decent site menu with drop downs. Special attention is paid to touch screens using touch events and tap targets. This is something I use to test different navigation techniques and may change as I iterate over different solutions to the problem. Basically I want a simple model to build upon when working on sites from scratch.

**Note:** If you find a bug, please [file an issue](https://github.com/indyplanets/flexnav/issues) and note device and browser versions

### Features
* Multiple nested sub menus
* Tap targets to reveal sub menus for touch screens
* Hover reveal for desktop
* Keyboard tab input accessibility
* Use class `.one-page` on the `body`, `.menu-button`, and `ul.flexnav` for single page fixed menu
* Use with hoverIntent jQuery plugin

### Browser Support
* IE7-10
* Latest Safari
* Latest Chrome
* Latest FireFox
* Android 2.2 to Latest
* Mobile Safari

* * *
### Usage

Start with a simple unordered list, adding in the class and data attributes:

	<ul class="flexnav" data-breakpoint="800"> <li>...</li> </ul>

Add the small screen menu button somewhere outside your navigation markup:

	<div class="menu-button">Menu</div>
		
For a single page site with id anchors, add `.one-page` class to `<body>`, `.menu-button`, and FlexNav `<ul>`:

	<ul class="flexnav one-page" data-breakpoint="800"> <li>...</li> </ul>	
								
Add flexnav.css to the head of your document
		
		<link href="css/flexnav.css" rel="stylesheet" type="text/css" / >
		
Add jquery.flexnav.min.js before closing body tag and after jQuery
		
		<script type="text/javascript" src="js/jquery.flexnav.min.js"></script>
		
Initialize

		<script>
			$(".flexnav").flexNav();
		</script>		

### Options
	'animationSpeed' : '250', // default for drop down animation speed
	'transitionOpacity': true, // default for opacity animation
	'buttonSelector': '.menu-button', // default menu button class name
	'hoverIntent': false, // Change to true for use with hoverIntent plugin
	'hoverIntentTimeout': 150 // hoverIntent default timeout		

* * *
### Contributors
* [Jason Weaver](http://jasonweaver.name) - (Primary)
* [James Sinclair](https://github.com/jrsinclair)
* [Allison Wagner](https://github.com/alliwagner)
* [Sean Breakerfall](https://github.com/breakerfall)
* [Robin Cawser](https://github.com/robcaw)
* [pallandt](https://github.com/pallandt)
* [ac-bristol](https://github.com/ac-bristol)

* * *		
### Todo

* Make several demo themes
* Figure out a better fallback for users without js

* * *
### Changelog

#### v.1.2 : October 6th, 2013
* Removed touchstart for fast clicks—possible cause of problems in some Android browsers.

#### v.1.1.1 : August 19th, 2013
* Changed css to not show menu by default. This will hide the menu if users don't have js. Need to work on better fix but for now devs are wanting this.

#### v.1.1 : August 11th, 2013
* Adds timeout flags to aid in stopping double touch/click events for some Android browsers

#### v.1.0.1 : August 5th, 2013
* Fixes hover out bug if user clicks arrow on large screens

#### v.1.0 : August 5th, 2013
* Added support for hoverIntent jQuery Plugin
* Fixed several touch/tap reveal bugs for touch screens
* Support jQuery noConflict mode

#### v.0.9 : July 4th, 2013
* Added support for multiple flexnavs on one page
* Fixed IE8 hover reveal bug

#### v.0.8 : June 4th, 2013
* Changed license to http://unlicense.org/
* Using Grunt for tasks now

#### v.0.7 : April 28th, 2013
* Reverting back to jQuery animations
* No longer supporting em units due to miscalculations during testing

#### v.0.6.1 : April 22th, 2013
* Fixed tabbed accessibility bug

#### v.0.6 : April 20th, 2013
* Better animation support using css transitions
* touch events added to get rid of 300ms delay on touch screens

#### v.0.5.2 : March 19th, 2013
* IE 7/8 large screen bug fixes

#### v.0.5.1 : March 14th, 2013
* Reverted back to no full responsive support for old IE

#### v.0.5 : March 13th, 2013
* Added full responsive support for IE 7/8 (not tested)

#### v.0.4.9 : March 7th, 2013
* Added support for em units

#### v.0.4.8 : March 6th, 2013
* Updated the way FlexNav hides and shows menu. Using a class `.show` and css transitions instead of js
* Update fixes bug where menu closed when user users scroll on small screens 

#### v.0.4.7 : March 5th, 2013
* Added the ability to have FlexNav on a one page site. Nav links are anchors to single page content. Need to add `.one-page` class to `body`, `.menu-button`, and FlexNav `ul`.
* Updated js to close mobile menu when one-page FlexNav anchor links are clicked/tapped.

#### v.0.4.6 : February 27th, 2013
* Fixed bug where keyboard accessibility didn't work after mousenter/mouseleave
* Use data attribute on element to set breakpoint instead of plugin option (more flexible if wanting a single column flexnav or two flexnavs on one page)

#### v.0.4.5 : February 26th, 2013
* Adding support for js mousenter/mouseleave
* Falls back to :hover with no js

#### v.0.4.4 : February 25th, 2013
* Moved adding .sm/.lg-screen from `body` to `.flexnav` element
* Moved adding flexNav-touch/-no-touch from `html` to `.flexnav` element
* Removed superfluous classes from markup (`.first-level`, `.second-level`, `.sub-menu`)
* Cleaned up sass/css
* Using class name instead of id for example (`#nav` changed to `.flexnav`)

#### v.0.4.3 : February 24th, 2013
* Rethinking using js hover events. Reverted back and now issue regarding [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16) is reopened
* Added Support for keyboard tab input accessibility. Hat tip [alliwagner](https://github.com/alliwagner)  https://github.com/alliwagner/flexnav/blob/852cd7838aebe635df43d6e8c32e4b9cbf4d74d9/index.html

#### v.0.4.2 : February 23rd, 2013
* Fixed bug where nav doesn't open on hover after clicking drop arrow: [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16)

#### v.0.4.1 : February 22nd, 2013
* Added CSS support and markup conditionals for IE7/8

#### v.0.4 : February 22nd, 2013
* Added in span elements via js for touch targets on touch screens
* Aded unicode navicon instead of image
* Fixed recursive sub-menu bug that didn't allow users to open/close 3rd/4th level sub-menus on small screens
* Using Sass, Jade and CoffeeScript for preprocessing and compiling

#### v.0.3.2 : January 17th, 2013
* Started adding class names via js

#### v.0.3.1 : January 16th, 2013
* Got rid of js that closes menu after click/touch of menu links (caused more trouble than it was worth leaving it in)
* Started support for multi-level sub menus

#### v.0.3 : July 8th, 2012
* Close menu after click/touch of menu links (makes sense for single page navigation with anchors)

#### v.0.2 : July 4th, 2012
* Changed to jQuery Plugin
* No more Modernizr - Uses a simple function to detect touch screens
