# Instructions

1. Take a look at "ex4.js" and "ex4b.js". Note the scopes in these two files. Run the example and note the errors shown in your browser's developer tools console. Why are these errors happening? Do you see circular dependencies between the two files?

2. The spirit of this exercise is to fix these errors while keeping the existing logic in "ex4.js" and "ex4b.js" respectively (do not combine the files or move the main logic bits between them). The two `console.log` statements should still run in their respective order, and should output the appropriate values as obvious from the logic.

3. Try not to modify the core logic too much (other than rearranging declarations as necessary), but instead use what you learned about function scopes and `this` binding to resolve the issues. Try to minimize the amount of variables in the "global scope" (best practice!). Remember that you can pass functions around.