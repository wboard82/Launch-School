let a = 'outer';

function testScope() {
  let a = 'inner';
  console.log(a);
}

console.log(a); // 'outer'
testScope();    // 'inner'
console.log(a); // 'outer'

// On `line 1` the global variable `a` is declared and initialized to the string
// `outer`. Then, on lines `3-6` the function `testScope` is declared. Within
// the scope of this function, a new local variable `a` is declared which
// shadows the `a` from the outer scope. Thus, any assignment to this `a` will
// not affect the value of the global `a`.
//
// So, on line 8 we log the outer `a` and get the output `outer`. Then we invoke
// the `testScope` function on line `9`. Execution jumps to `line 4` where the
// local variable `a` is declared within the scope of the function. This
// variable has the value `inner` which we log on `line 5`.
//
// Execution returns to `line 10` where we again log the outer local variable
// `a`. This is unchanged since the `a` within `testScope` shadowed this outer
// `a`, so we once again get the output `outer`.

// LS Solution:
// Line 8 is the first invocation of console.log; here, a is the global variable
// a from line 1. Line 9 calls the testScope function; in the function, a is a
// local variable on line 4, so line 5 logs inner. After testScope returns, the
// a on line 10 is the global variable on line 1 again; therefore, it logs
// outer.


