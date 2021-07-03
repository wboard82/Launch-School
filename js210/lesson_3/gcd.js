// Create a function that computes the Greatest Common Divisor of two positive integers.

// function gcd(int1, int2) {
//   let smaller;
//   let larger;

//   if (int1 <= int2) {
//     smaller = int1;
//     larger = int2;
//   } else {
//     smaller = int2;
//     larger = int1;
//   }

//   let divisor;
//   for (divisor = smaller; divisor > 1; divisor--) {
//     if (smaller % divisor == 0 && larger % divisor == 0) {
//       break;
//     }
//   }

//   return divisor;
// }

function gcd(...arr) {
  arr.sort((a, b) => b - a);
  let larger = arr.pop();
  
  while (arr.length) {
    let smaller = arr.pop();
    let remainder;

    do {
      remainder = larger % smaller;
      larger = smaller;
      smaller = remainder;
    } while (remainder != 0);
  }
  
  return larger;
}

// console.log(gcd(12, 4));           // 4
// console.log(gcd(15, 10));          // 5
// console.log(gcd(9, 2));            // 1
// console.log(gcd(62, 36));          // 2
// console.log(gcd(36, 62));          // 2
// console.log(gcd(107, 535));        // 107
console.log(gcd(12, 36, 4));
console.log(gcd(5, 125, 1000));
console.log(gcd(6 * 127, 6 * 5004, 6 * 36));
