// Write a function logMultiples that takes one argument number. It should log
// all multiples of the argument between 0 and 100 (inclusive) that are also odd
// numbers. Log the values in descending order.

// You may assume that number is an integer between 0 and 100.

function logMultiples(number) {
  let highestMultiple = Math.floor(100 / number) * number;
  let step = number * 2;

  if (highestMultiple % 2 == 0) {
    highestMultiple -= number;
  }

  for (let candidate = highestMultiple; candidate >= number; candidate -= step) {
    console.log(candidate);
  }
}

logMultiples(17);
console.log("-------");
logMultiples(21);
console.log("-------");

