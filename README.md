# A Device Agnostic Approach to Complex Site Navigation

## The Details
A mobile-first example of using media queries and javascript to make a decent site menu with drop downs. Special attention is paid to touch screens using click events. This is something I use to test different navigation techniques and may change as I iterate over different solutions to the problem. Basically I want a simple model to build upon when working on sites from scratch.
			
## Caveats
Right now you have to refresh after resizing through the media query (currently only one at 820px). This is the case in order to see the sub menu of each top level menu item. I'd like to be able to have a seamless interaction when resizing the browser but I believe web designers are the only users that are testing for responsiveness. I'm also pulling in [Modernizr](http://www.modernizr.com/) and the latest jQuery. More details to come as I keep testing.