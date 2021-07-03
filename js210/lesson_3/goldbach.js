// Write a function named checkGoldbach that uses Goldbach's Conjecture to log
// every pair of primes that sum to the number supplied as an argument. The
// conjecture states that "you can express every even integer greater than 2 as
// the sum of two primes". The function takes as its only parameter, an integer
// expectedSum, and logs all combinations of two prime numbers whose sum is
// expectedSum. Log the prime pairs with the smaller number first. If
// expectedSum is odd or less than 4, your function should log null.

// Your checkGoldbach function may call the isPrime function you wrote for a previous practice problem.

function checkGoldbach(expectedSum) {
  if (expectedSum % 2 === 1 || expectedSum < 4) {
    console.log(null);
    return;
  }

  for (let smaller = 2; smaller <= expectedSum / 2; smaller += 1) {
    if (!isPrime(smaller)) {
      continue;
    }

    let larger = expectedSum - smaller;
    if (isPrime(larger)) {
      console.log(smaller, larger);
    } else {
    }
  }
}

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

checkGoldbach(3);
// logs: null
console.log("-----------");

checkGoldbach(4);
// logs: 2 2
console.log("-----------");
checkGoldbach(12);
// logs: 5 7
console.log("-----------");
 checkGoldbach(100);
// logs:
// 3 97
// 11 89
// 17 83
// 29 71
// 41 59
// 47 53
