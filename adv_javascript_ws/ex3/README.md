# Instructions

1. Familiarize yourself with the HTML and the CSS for this exercise. Take note of CSS classes which are defined but not obviously in use.

2. Take a look at the "ex3.js" file. Take note of where the "TODO" comments are (suggestions of where you will add your code). Assume that the data in the `notes` array would normally have been loaded from a database.

3. Looking through the code, identify places where the code has problems, as we saw in the "DOM Management" and "Event Management" sections of the workshop. Refer back to the slides as necessary. Fix them as necessary. Hints:
  - are there places where DOM lookups and manipulations are happening one-at-a-time when they could be combined for better performance?
  - are there places where repeat DOM lookups could be cached to avoid the duplicate effort? what are the tradeoffs to that?
  - what types of event binding/propagation (capturing, bubbling/delegation) do you see?

4. You need to add some functionality to this exercise. Add event binding functionality to:
  - make it so a click on the help button doesn't do anything but open the help dialog.
  - handle the closing of the help dialog after it's been opened. the behavior should be that if you click anywhere, the help box closes, but nothing else should happen on that click.
  - handle clicks on the notes items (only) which will highlight the clicked item (using the appropriate CSS class) and remove any highlighting from other items.
  - use the appropriate CSS class to "activate" the notes area whenever any note item is highlighted.

5. Take note of how all these functions are in the global scope (we'll be talking about scope next!), and how that affects variables used across the functions. How might you refactor this code to avoid some of those issues?
