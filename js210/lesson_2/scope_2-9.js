let a = 'outer';
let b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}

// outer
// outer
// outer
// inner

// We define two global variables `a` and `b` and both are assigned the value
// `outer`. Even though the function `setScope` is hoisted, it is not executed
// before the variables are declared, so no property on the global object will
// be created.
//
// We log both `a` and `b` on `lines 4-5`.
// We then invoke `setScope`, passing `a` as an argument. Since `a` contains a
// string which is a primitive value, it is passed by value to the function and
// a local variable `foo` is created at the function scope. `foo` is reassigned
// to `inner` on `line 11` but this does not affect `a` in the outer scope.
// However, `b` on `line 12` is referencing the global variable `b` and so that
// gets reassigned. We see this on `lines 7 and 8` when we log the two values
// and get `outer` then `inner`.
