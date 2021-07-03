var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);

// This code will log `This is global`.
// We first declare the global variable `myVar` on `line 1` and assign the value
// `This is global`.  Within the function `someFunction`, we use `var` to declare a local variable
// `myVar` which is in function scope. This is separate from the global variable
// and so the global variable is not changed at all by the assignment to `This
// is local` within the function. That only affects the local variable.
