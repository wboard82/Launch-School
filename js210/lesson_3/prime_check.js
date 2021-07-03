// Write a function that takes a number argument, and returns true if the number
// is prime, or false if it is not.

// You may assume that the input is always a non-negative integer.

function isPrime(num) {
  if (num < 2) return false;
  if (num === 2) return true;
  if (num % 2 === 0) return false;
 
  for (let divisor = 3; divisor <= Math.sqrt(num); divisor += 2) {
    if (num % divisor == 0) {
      return false;
    }
  }

  return true;
}

console.log(isPrime(1) === false);
console.log(isPrime(2) === true);
console.log(isPrime(3) === true);
console.log(isPrime(4) === false);
console.log(isPrime(5) === true);
console.log(isPrime(6) === false);
console.log(isPrime(7) === true);
console.log(isPrime(8) === false);
console.log(isPrime(9) === false);
console.log(isPrime(10) === false);
console.log(isPrime(11) === true);
console.log(isPrime(12) === false);
console.log(isPrime(25) === false);
console.log(isPrime(43) === true);
console.log(isPrime(55) === false);
console.log(isPrime(0) === false);

