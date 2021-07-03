// Write a function that takes two arguments:

// - a string to be split
// - a delimiter character
//
// The function logs the split strings to the console, as shown below:
//
function splitString(string, delimiter) {
  if (delimiter === undefined) {
    console.log("ERROR: No delimiter");
    return;
  }

  if (delimiter === '') {
    outputEachCharacter(string);
    return;
  }

  let currentString = '';
  let idx = 0;

  while (true) {
    if (idx === string.length) {
      console.log(currentString);
      break;
    }
    if (string[idx] === delimiter) {
      console.log(currentString);
      currentString = '';
    } else {
      currentString += string[idx];
    }

    idx++;
  }

}

function outputEachCharacter(string) {
  for (let index = 0; index < string.length; index++) {
    console.log(string[index]);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

console.log('-------------------');
splitString('hello');
// logs:
// ERROR: No delimiter

console.log('-------------------');
splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

console.log('-------------------');
splitString('hello', ';');
// logs:
// hello

console.log('-------------------');
splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
