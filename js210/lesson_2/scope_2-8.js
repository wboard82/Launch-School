var a = 'global';

function checkScope() {
  var a = 'local';

  const nested = function() {

    var a = 'nested';

    let superNested = () => {
      a = 'superNested';
      return a;
    };

    return superNested();
  };

  return nested();
}

console.log(checkScope());
console.log(a);

// Execution:
// - line 1 a global variable `a` is declared and assigned the value `'global'`
// - line 21, `checkScope()` is called
// - line 4 - inside `checkScope()` a new local variable `a` is declared and
// assigned the value `local`
// - line 18 - we call `nested()`
// - line 8 - a new local variable is declared and scoped to the function
// `nested`. It has a value of `nested`.
// - line 15 - we call `superNested()`
// - line 11 - within `superNested()` we assign `a` to the value `superNested`.
// This sill affect the local variable `a` scoped to the `nested` function since
// all other versions of `a` are shadowed.
// - line 12 - we return the value `superNested` and the `a` scoped to `nested`
// has the same value at this time
// - line 15 - `nested()` returns the value returned by `superNested()` which is
// `superNested`
// - line 18 - `checkScope()` returns the return value of `nested()` which is
// `superNested`
// - line 21 - we log the return value of `checkScope()` which is `superNested`
// - line 22 - we log the value of the global `a` which remains `global` since
// all the reassignments were happening to local variables at the various
// function scopes.

