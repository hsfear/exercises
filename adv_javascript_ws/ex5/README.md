# Instructions

1. In this exercise, you will revisit your work from exercise 3 (the note taking app). You will need to copy in your fixed code from "ex3.js" into the "ex5.js", as your starting point.

2. Using what you learned about closure and the module pattern, modify your previous code to wrap all the functionality up into a simple object (call it "NotesManager" or something appropriate), with a simple API, consisting of:
  - an `init()` method, which you will call from the outside when jQuery's `document.ready` event is fired, and pass in the data from the "database".
  - a public method to add in notes "in bulk" after retrieval from the "database". hint: this can/should be called **before** you run the "init" method.

3. Make sure you have a "private" storage of the `notes` data list inside your module. Why is it a good idea to keep the data "private" inside the module?

4. What do you notice about the structure of this code as it relates to the DOM access and the usage of jQuery? Would it make sense to "generalize" this code so that the module didn't have hardcoded into it the various DOM elements it would operate on? Explore how you would modify the code in this fashion. What are the benefits and tradeoffs?