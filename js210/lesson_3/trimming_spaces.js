// Write a function that takes a string as an argument, and returns the string
// stripped of spaces from both ends. Do not remove or alter internal spaces.

function trim(str) {
  let first_idx = 0;
  let last_idx = str.length - 1;

  while (str[first_idx] === ' ') {
    first_idx++;
  }

  while (str[last_idx] === ' ') {
    last_idx--;
  }

  let result = '';
  while (first_idx <= last_idx) {
    result += str[first_idx];
    first_idx++;
  }

  return result;
}

console.log(trim('  abc  ') === "abc");
console.log(trim('abc   ') === "abc");
console.log(trim(' ab c') === "ab c");
console.log(trim(' a b  c') === "a b  c");
console.log(trim('      ') === "");
console.log(trim('') === "");
