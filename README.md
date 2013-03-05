# FlexNav jQuery Plugin

## A Device Agnostic Approach to Complex Site Navigation

### The Details
* [View Demo](http://jasonweaver.name/lab/flexiblenavigation/)
* [Single page site with fixed navigation demo](http://jasonweaver.name/lab/flexiblenavigation/single-page-pattern.html)

A mobile-first example of using media queries and jQuery to make a decent site menu with drop downs. Special attention is paid to touch screens using click events for tap targets. This is something I use to test different navigation techniques and may change as I iterate over different solutions to the problem. Basically I want a simple model to build upon when working on sites from scratch.

### Features
* Multiple nested sub menus
* Tap targets to reveal sub menus for touch screens
* Hover reveal for desktop
* Keyboard tab input accessibility
* Fallback for no JavaScript
* Use class `.one-page` on the `body`, `.menu-button`, and `ul.flexnav` for single page fixed menu

### Browser Support
* IE7-10
* Latest Safari
* Latest Chrome
* Latest FireFox
* Android 2.2 to Latest
* Mobile Safari

### Usage
Start with a simple unordered list, adding in the class and data attributes.

	<ul class="flexnav" data-breakpoint="800"> <li>...</li> </ul>
								
Add flexnav.css to the head of your document
		
		<link href="css/flexnav.css" rel="stylesheet" type="text/css" / >
		
Add jquery.flexnav.min.js before closing body tag and after jQuery
		
		<script type="text/javascript" src="js/jquery.flexnav.min.js"></script>
		
Initialize

		<script>
			$(".flexnav").flexNav();
		</script>		

you can change the default speed too
	
		<script>
			$(".flexnav").flexNav({
				'animationSpeed' : 'fast' // default			
			});			
		</script>	
		
### Todo

* Make several demo themes

### Changelog

#### v.0.2 : July 4th, 2012

* Changed to jQuery Plugin
* No more Modernizr - Uses a simple function to detect touch screens

#### v.0.3 : July 8th, 2012

* Close menu after click/touch of menu links (makes sense for single page navigation with anchors)

#### v.0.3.1 : January 16th, 2013

* Got rid of js that closes menu after click/touch of menu links (caused more trouble than it was worth leaving it in)
* Started support for multi-level sub menus

#### v.0.3.2 : January 17th, 2013

* Started adding class names via js

#### v.0.4 : February 22nd, 2013
* Added in span elements via js for touch targets on touch screens
* Aded unicode navicon instead of image
* Fixed recursive sub-menu bug that didn't allow users to open/close 3rd/4th level sub-menus on small screens
* Using Sass, Jade and CoffeeScript for preprocessing and compiling

#### v.0.4.1 : February 22nd, 2013
* Added CSS support and markup conditionals for IE7/8

#### v.0.4.2 : February 23rd, 2013
* Fixed bug where nav doesn't open on hover after clicking drop arrow: [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16)

#### v.0.4.3 : February 24th, 2013
* Rethinking using js hover events. Reverted back and now issue regarding [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16) is reopened
* Added Support for keyboard tab input accessibility. Hat tip [alliwagner](https://github.com/alliwagner)  https://github.com/alliwagner/flexnav/blob/852cd7838aebe635df43d6e8c32e4b9cbf4d74d9/index.html

#### v.0.4.4 : February 25th, 2013
* Moved adding .sm/.lg-screen from `body` to `.flexnav` element
* Moved adding flexNav-touch/-no-touch from `html` to `.flexnav` element
* Removed superfluous classes from markup (`.first-level`, `.second-level`, `.sub-menu`)
* Cleaned up sass/css
* Using class name instead of id for example (`#nav` changed to `.flexnav`)

#### v.0.4.5 : February 26th, 2013
* Adding support for js mousenter/mouseleave
* Falls back to :hover with no js

#### v.0.4.6 : February 27th, 2013
* Fixed bug where keyboard accessibility didn't work after mousenter/mouseleave
* Use data attribute on element to set breakpoint instead of plugin option (more flexible if wanting a single column flexnav or two flexnavs on one page)