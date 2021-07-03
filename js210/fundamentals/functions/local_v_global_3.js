var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);

// Here we output `This is local`. Since a new variable is not declared within
// the function scope, `myVar` on `line 4` refers to the global variable from
// the outer scope and reassigns it. Even though we are logging it from outside
// the function scope, it has changed what the global `myVar` refers to.
