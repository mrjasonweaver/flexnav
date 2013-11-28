# FlexNav jQuery Plugin

### A Device Agnostic Approach to Complex Site Navigation with Support for Touch and Keyboard Accessibility

* * *
### The Details

* [View Demo](http://jasonweaver.name/lab/flexiblenavigation/)
* [Single page site with fixed navigation demo](http://jasonweaver.name/lab/flexiblenavigation/single-page-pattern.html)

A mobile-first example of using media queries and jQuery to make a decent site menu with drop downs. Special attention is paid to touch screens using touch events and tap targets. This is something I use to test different navigation techniques and may change as I iterate over different solutions to the problem. Basically I want a simple model to build upon when working on sites from scratch.

**Note:** If you find a bug, please [file an issue](https://github.com/indyplanets/flexnav/issues) and note device and browser versions. Use [the Demo](http://jasonweaver.name/lab/flexiblenavigation/) as a point of reference for bugs. I can't offer my time to debug your specific code.

### Resources
* [Theming a Multi-level Responsive Menu in Drupal 7](http://highrockmedia.com/blog/theming-multi-level-responsive-menu-drupal-7)
* [Gratis Drupal 7 Responsive Theme](http://gratis.themehuis.com/)
* [Dreamweaver support forum](http://forums.adobe.com/message/5811244)
* [Using FlexNav with WordPress](http://wordpress.stackexchange.com/questions/101021/using-flexnav-with-wordpress)
* [FlexNav with WordPress Genesis 2.0 demo](http://bradpotter.com/themes/genesis20flex/)

### Features
* Multiple nested sub menus
* Tap targets to reveal sub menus for touch screens
* Hover reveal for desktop
* Keyboard tab input accessibility
* Use class `.one-page` on the `body`, `.menu-button`, and `ul.flexnav` for single page fixed menu
* Use with [hoverIntent jQuery plugin](http://cherne.net/brian/resources/jquery.hoverIntent.html) (not included)

### Browser Support
* IE7-10
* Latest Safari
* Latest Chrome
* Latest FireFox
* Android 2.2 to Latest
* Mobile Safari

### License
FlexNav is unlicensed. Do whatever you want with it. :) [Set Your Code Free](http://unlicense.org/)

* * *
### Usage

Start with a simple unordered list, adding in the class and data attributes:
```xhtml
<ul class="flexnav" data-breakpoint="800"> <li>...</li> </ul>
```
Add the small screen menu button somewhere outside your navigation markup:
```xhtml
<div class="menu-button">Menu</div>
```		
For a single page site with id anchors, add `.one-page` class to `<body>`, `.menu-button`, and FlexNav `<ul>`:
```xhtml
<ul class="flexnav one-page" data-breakpoint="800"> <li>...</li> </ul>	
```								
Add flexnav.css to the head of your document
```xhtml		
<link href="css/flexnav.css" rel="stylesheet" type="text/css" / >
```		
Add jquery.flexnav.min.js before closing body tag and after jQuery
```xhtml		
<script type="text/javascript" src="js/jquery.flexnav.min.js"></script>
```		
Initialize
```xhtml
<script>
	$(".flexnav").flexNav();
</script>
```

### Options
```js
$(".flexnav").flexNav({
  'animationSpeed':     250,            // default for drop down animation speed
  'transitionOpacity':  true,           // default for opacity animation
  'buttonSelector':     '.menu-button', // default menu button class name
  'hoverIntent':        false,          // Change to true for use with hoverIntent plugin
  'hoverIntentTimeout': 150,            // hoverIntent default timeout
  'calcItemWidths':     false,          // dynamically calcs top level nav item widths
  'hover':              true            // would you like hover support?  	  
});
```	

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

see [Todos](https://github.com/indyplanets/flexnav/wiki/Todos)

* * *
### Changelog

see [Changelog](https://github.com/indyplanets/flexnav/wiki/Changelog)
