const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // 'Hello'
}

if (!myString) {
  console.log('World -'); // '' 
    // Here, `myString` is a non-empty string and so it is a truthy value, but
    // the `!` operator negates that and makes it `false`
}

if (!!myArray) {
  console.log('World'); // 'World'
    // An empty array is a truthy value. `!!` turns it into `false` and then
    // negates `false` back into `true`
}

if (myOtherString || myArray) {
  console.log('!');     // '!'
    // `myOtherString` is an empty string which is a falsy value, but the second
    // half of the `||` expression is evaluated, which is an empty Array, which
    // is truthy, so this executes
}
