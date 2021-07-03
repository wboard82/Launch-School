function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);

// Here is the 'hoisted' version:
function hello() {
  var a = undefined;

  a = 'hello';
  console.log(a);

  if (false) {
    a = 'hello again';
  }
}

hello();
console.log(a);

// This shows that we will output `hello` and then throw an error. The error is
// thrown because `a` is out of scope on the last line of the program. This is
// tricky because it seems like `a` is going to be a property on the global
// object since it is assigned with no declaration on `line 2`. However, the
// `var` declaration on `line 6` is hoisted to the top of the function level
// meaning it is declared at the function scope and then it is not accessible
// outside of the function.

function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    let a = 'hello again';
  }
}

hello();
console.log(a);

// This logs `hello`, `hello`. This is very similar to above but the `let`
// declaration on `line 41` is not hoisted to the function level. Thus when we
// assign `hello` to `a` it creates a property on the global object which is
// logged on the next line but then also accessible after execution of `hello()`
// completes, so no error is thrown this time.

