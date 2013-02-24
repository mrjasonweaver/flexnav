# FlexNav jQuery Plugin

## A Device Agnostic Approach to Complex Site Navigation

### The Details
[View Demo](http://jasonweaver.name/lab/flexiblenavigation/)

A mobile-first example of using media queries and jQuery to make a decent site menu with drop downs. Special attention is paid to touch screens using click events. This is something I use to test different navigation techniques and may change as I iterate over different solutions to the problem. Basically I want a simple model to build upon when working on sites from scratch.

### Features
* Multiple nested sub menus
* Tap targets to reveal sub menus for touch screens
* Hover reveal for desktop
* Keyboard tab input accessibility

### Browser Support
* IE7-10
* Latest Safari
* Latest Chrome
* Latest FireFox
* Android 2.2 to Latest
* Mobile Safari

### Usage

Add flexnav.css to the head of your document
		
		<link href="css/flexnav.css" rel="stylesheet" type="text/css" / >
		
Add jquery.flexnav.min.js before closing body tag and after jQuery
		
		<script type="text/javascript" src="js/jquery.flexnav.js"></script>
		
Initialize

		<script>
			$("#nav").flexNav();
		</script>		

you can change the defaults too
	
		<script>
			$("#nav").flexNav({
				'breakpoint' : '800', // default
				'animationSpeed' : 'fast' // default			
			});			
		</script>	
		
### Todo

* Add all class names to markup via js

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

#### v.0.4.2 : February 23nd, 2013
* Fixed bug where nav doesn't open on hover after clicking drop arrow: [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16)

#### v.0.4.3 : February 24nd, 2013
* Rethinking using js hover events. Reverted back and now issue regarding [Click vs. mouse over](https://github.com/indyplanets/flexnav/issues/16) is reopened
* Added Support for keyboard tab input accessibility. Hat tip [alliwagner](https://github.com/alliwagner)  https://github.com/alliwagner/flexnav/blob/852cd7838aebe635df43d6e8c32e4b9cbf4d74d9/index.html
