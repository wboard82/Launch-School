let basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  let shop2 = function() {
    basket = 'computer';
  };

  const shop3 = () => {
    let basket = 'play station';
    console.log(basket);
  };

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();

// Here we have one global variable, `basket` and a function `goShopping` which
// itself has several nested functions. After declaring and assigning `basket`
// to `"empty"` on `line 1`, the execution moves to `line 26` where the
// `goShopping` function is invoked.
//
// The first line within the function that is executed is `line 8`. This will
// output `empty` since the global variable has not yet been changed at all.
//
// Execution continues at `line 19` where each of the nested functions declared
// above are each executed in turn. `shop1` is executed and on `line 5` the
// value of `basket` is reassigned to `'tv'`. `shop1` is able to access the
// global scope since inner scope is able to access variables from surrounding
// scopes.
//
// Execution continues by invoking `shop2` and on `line 11` the value of
// `basket` is again reassigned, now to `computer`. `shop3` is then invoked on
// `line 21`. Execution of this function begins with a declaration of a local
// variable `basket` which shadows the global variable of the same name. Thus,
// when we log the value of `basket` on `line 16` it will output `play station`,
// but the value of the global `basket` remains `'computer'` and we see this
// output on `line 23`.
//
// The output of this program is: `empty`, `play station`, `computer`
//
// LS Solution:
// The first log operation occurs on line 8; here, basket still has its original
// value, empty. The function call on line 19 changes basket to tv, and the call
// on line 20 changes it to computer. The function call on line 21 does not
// alter the value of the basket global, but defines and sets a local variable
// with the same name. It then logs play station. Upon returning from shop3, the
// local variable goes away, so line 23 logs the value of the global basket:
// computer.
