// let age = Number(rlSync.question("What is your age?\n"));

// for (let years = 10; years <= 40; years += 10) {
//     console.log(`In ${years} years, you will be ${years + age} years old.`);
// }

// *** 2 ***

// function factorial(num) {
//     let result = 1;

//     for (let counter = 1; counter <= num; counter++) {
//         result *= counter;
//     }

//     return result;
// }

// console.log(factorial(1));
// console.log(factorial(2));
// console.log(factorial(3));
// console.log(factorial(4));
// console.log(factorial(5));

//********************

function randomNumberBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

let tries = 0;
let result;

do {
  result = randomNumberBetween(1, 6);
  tries += 1;
} while (result <= 2) 

console.log('It took ' + String(tries) + ' tries to get a number greater than 2');


function factorial(num) {
    if (num == 1) return 1;

    return num * factorial(num - 1);
}


console.log(factorial(1));
console.log(factorial(2));
console.log(factorial(3));
console.log(factorial(4));
console.log(factorial(5));

