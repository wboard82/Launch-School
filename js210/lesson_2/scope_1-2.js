let a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);

// Here the output is `outer`, `inner`, `inner`. As in the last example, a global
// variable `a` is declared and assigned the value `outer` on `line 1`. This is
// the value that is output on `line 8`. On `line 9` the function `testScope` is
// invoked and execution jumps to `line 4`. Here `a` is referring to the global
// variable `a`. This is because the function scope has access to the outer scope.
// Since `a` was declared in the outer scope, the expression on `line 4` is a
// reassignment to the value `inner`. This is logged on `line 5`.
// On `line 10` we once again log the value of `a` which is now `inner` since it
// has been mutated from within the function `testScope`.
