function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();

// WRONG:
// This will raise an error. Within execution of the function `say` we have an
// `if` statement. The block of code associated with the `if` creates its own
// scope and `a` is not available outside of this scope when we try to log it.
//
// ** The above is true for the code below (declared with `let`). But for this
// code `var` creates a variable at the function scope, not the block scope, and
// so this code above outputs `undefined`.


function say() {
  if (false) {
    let a = 'hello from inside a block';
  }

  console.log(a);
}

say();

// See above 'WRONG' explanation for the previous example.


