// Implement a function that takes a string and a number times as arguments. The
// function should return the string repeated times number of times. If times is
// not a number, return undefined. If it is a negative number, return undefined
// also. If times is 0, return an empty string. You may ignore the possibility
// that times is a number that isn't an integer.

function repeat(string, times) {
  if (!Number.isInteger(times) || times < 0) {
    return undefined;
  }

  let result = '';
  while (times > 0) {
    result += string;
    times--;
  }


  return result;
}

console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  ');    // undefined
