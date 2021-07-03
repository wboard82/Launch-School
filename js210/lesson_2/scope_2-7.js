let a = 1;

function foo() {
  a = 2;
  let bar = function() {
    a = 3;
    return 4;
  };

  return bar();
}

console.log(foo());
console.log(a);

// This will log `4`, `3`. We have a global variable, `a` declared on `line 1`
// and initialized to `1`. We then call the function `foo` on `line 13` from
// within the call to `console.log`. In the function call we have access to the
// global variable `a` and reassign it to `2`. We then call the nested function
// `bar` which reassigns `a` again to 3 and returns `4`. This return value is
// then returned from `foo` as well and gets logged on `line 13`. The value of
// `a` is `3` and that is logged on `line 14`.
