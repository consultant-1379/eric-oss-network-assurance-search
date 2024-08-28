# middleware module

middleware functions are functions that have access to the request object (req), the response object (res), and the next middleware function.

Next middleware function in the app request-response cycle. The next middleware function is commonly denoted by a variable named next.

middleware functions can perform the following tasks:

1. Execute any code.
2. Make changes to the request and the response objects.
3. End the request-response cycle.
4. Call the next middleware function in the stack.

_Note: Must call next() in your end of function._

## example of create new middleware

1. Create new file
2. import your file in index.js
3. add `app.use(<your-function()>);`
