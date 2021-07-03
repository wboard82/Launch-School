// Write a password guessing program that tracks how many times the user enters
// the wrong password. If the user enters the password wrong three times, log
// 'You have been denied access.' and terminate the program. If the password is
// correct, log 'You have successfully logged in.' and end the program.

let rlSync = require('readline-sync');
const PASSWORD = 'password';
let attempts = 0;

do {
  let guess = rlSync.question("Please enter your password: ");

  if (guess === PASSWORD) {
    break;
  }

  attempts += 1;
} while (attempts < 3);

if (attempts < 3) {
  console.log("You have successfully logged in.");
} else {
  console.log("You have been denied access.");
}

