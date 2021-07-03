// Write a function that takes a number of rows as the argument nStars and logs
// a square of numbers and asterisks. For example, if nStars is 7, log the
// following pattern:

// You may assume that nStars is greater than 1 and less than 10.

function generatePattern(nStars) {
  let buildPattern = function (length, numbers) {
    let pattern = '';

    for (let index = 1; index <= length; index++) {
      if (index <= numbers) {
        pattern += String(index);
      } else if (index < 10) {
        pattern += "*";
      } else {
        pattern += "**";
      }
    }
    
    return pattern;
  };

  for (let numbers = 1; numbers <= nStars; numbers++) {
    console.log(buildPattern(nStars, numbers));
  }
}


// generatePattern(1);
// generatePattern(2);
// generatePattern(3);
// generatePattern(4);
generatePattern(5);
// generatePattern(6);
// generatePattern(7);
// generatePattern(8);
// generatePattern(9);
generatePattern(20);
// console output
// 1******
// 12*****
// 123****
// 1234***
// 12345**
// 123456*
// 1234567
