var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();

// 'This is local'
// Here the `myVar` that is local to `someFunction` is in scope and shadows the
// global `myVar` within the function. This is the `myVar` that is passed to
// `console.log`.
