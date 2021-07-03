let total = 50;
let increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);

// `50`
// `60`
// `15`
// Global variables `total` and `increment` are declared and assigned the values
// `50` and `15` respectively.
// `total` is logged (`50`)
// We then pass `10` to the function `incrementBy()`. This function creates a
// new local variable `increment` at the function scope and assigns it the
// value `10` which was passed as an argument. This shadows the global variable
// `increment`, but `total` is not declared within the function, so `total` on
// `line 5` is the global variable.
// Thus, we have added `10` to its value which is reflected when we log it on
// `line 10`. When we log `increment` it is the global `increment` since the
// function parameter `increment` is now out of scope again.

