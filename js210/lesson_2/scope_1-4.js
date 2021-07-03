function hello() {
  a = 'hi';
}

hello();
console.log(a);

// Here the output is `'hi'`. We invoke `hello` where a `'hi' is assigned to
// variable `a`. Since there is no declaration of the `a` variable with `let`,
// `const`, or `var`, JS creates a global variable `a` and assigns the value
// `'hi'`. This variable remains in scope after the function execution completes
// and so we are able to log the value on `line 6`.

// LS Solution:
// hi
// Here, we call the hello function, so we assign a value of hi to the variable.
// The variable is a global variable since we don't declare it with let, const,
// var, or function. Thus, line 6 logs hi.
//
// Note that this is nearly identical to what happens when we explicitly declare
// a at the global level:

let a;

function hello() {
  a = 'hi';
}

hello();
console.log(a);
 
// However, there is a subtle difference: without an explicit declaration, a
// becomes a property of the global object. We discuss objects in more detail
// later and why this extremely subtle distinction matters. For now, though, you
// just need to know that a is available everywhere in the program.
// --------------------------------------------------------------------------------

function hello() {
  let a = 'hello';
}

hello();
console.log(a);

// This raises an exception. `a` is declared as a local variable within the
// function scope of `hello`. This means that after execution of `hello`
// finishes, `a` will be out of scope and thus unavailable when we try to log
// it.

// --------------------------------------------------------------------------------

console.log(a);

var a = 1;

// This will log `undefined`. When we declare a variable using `var`, that
// declaration is hoisted to the top of the program and the variable is
// initialized to `undefined`. When we log the value on the first line, this is
// what it will be set to.

// LS Solution:
// After hoisting, this program is equivalent to:

var a;
console.log(a);
a = 1;

// Line 1 in the original code logs undefined since a is not assigned a value until line 3.

// --------------------------------------------------------------------------------

console.log(a);

let a = 1;

// This will raise an error. Unlike `var`, when a variable that is declared with
// `let` is hoisted it is not assigned a value at all. JS will raise an error
// since we are trying to access a variable before it has been assigned.
//
// LS:
// ReferenceError: Cannot access 'a' before initialization
//
// After hoisting, JavaScript can tell that there is an a variable, but that
// variable lives in the Temporal Dead Zone; it is unset and cannot be accessed.

// --------------------------------------------------------------------------------

console.log(a);

function hello() {
  a = 1;
}

// This will raise an error. Even though the function is hoisted, it is never
// executed, meaning that `a` is never actually declared.
