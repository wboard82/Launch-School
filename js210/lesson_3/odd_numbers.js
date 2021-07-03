// Write a function that takes a positive integer as an argument, and logs all
// the odd numbers from 1 to the passed in number (inclusive). All numbers
// should be logged on separate lines.

function oddNumbers(limit) {
  for (let i = 1; i <= limit; i += 2) {
    console.log(i);
  }
}

oddNumbers(9);
