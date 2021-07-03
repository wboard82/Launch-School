let a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};
//With hoisting, the above code is equivalent to:

var setScope;

let a = 'outer';

console.log(a);
setScope();
console.log(a);

setScope = function () {
  a = 'inner';
};
// `outer`
// `inner`
//
// Global variable `a` is assigned the value `outer`
// We log this value
// WRONG: Within the call to `setScope`, the global variable `a` is reassigned
// We log the new value `inner`
//
// Line 6 tries to call setScope as a function. However, setScope is just a
// declared global variable whose value is undefined. Note that unlike function
// declarations, with function expressions using var, the name of the function is
// hoisted, but not the function body.
