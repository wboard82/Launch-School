var a = 'hello';

for (var index = 0; index < 5; index += 1) {
  var a = index;
}

console.log(a);

// This will output '4'. The `var` declaration on `line 3` is hoisted out of the
// block up to the global level (since it is not contained in a function). This
// means it is initally set to `undefined`, then assigned to `hello`, but then
// it is assigned to the value of `index` with each loop iteration. Since the
// last value of `index` which the loop executes on is `4`, that is the value of
// `a` when we log it on `line 7`.

let a = 'hello';

for (let index = 0; index < 5; index += 1) {
  let a = index;
}

console.log(a);

// Here `hello` is logged. The `a` that is declared in the `for` loop is
// contained to the scope of that block. Thus, when the `for` loop completes
// that `a` goes out of scope and no longer shadows the global `a` which was
// declared and initialized on the first line.
