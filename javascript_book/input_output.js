let rlSync = require('readline-sync');
// let name = rlSync.question("What's your name?\n");
// console.log(`Good Morning, ${name}!`);

// let num1 = rlSync.question("Enter the first number:\n");
// let num2 = rlSync.question("Enter the second number:\n");
// let sum = Number(num1) + Number(num2);
// console.log(`The numbers ${num1} and ${num2} add to ${sum}.`);

// let first_name = rlSync.question("What's your first name?\n");
// let last_name = rlSync.question("What's your last name?\n");
// console.log(`Hello, ${first_name} ${last_name}!`);

let age = Number(rlSync.question("What is your age?\n"));

for (let years = 10; years <= 40; years += 10) {
    console.log(`In ${years} years, you will be ${years + age} years old.`);
}

