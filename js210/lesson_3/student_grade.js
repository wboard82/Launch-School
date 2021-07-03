// Write a program to determine a student’s grade based on the average of three
// scores you get from the user. Use these rules to compute the grade:

// If the average score is greater than or equal to 90 then the grade is 'A'
// If the average score is greater than or equal to 70 and less than 90 then the grade is 'B'
// If the average score is greater than or equal to 50 and less than 70 then the grade is 'C'
// If the average score is less than 50 then the grade is 'F'
// You may assume that all input values are valid positive integers.

let rlSync = require("readline-sync");
let input;
let grades = [];

while (true) {
  input = rlSync.question('Please enter a grade (hit Enter to compute average): ');
  if (input === '') {
    break;
  }

  grades.push(Number(input));
}

let letterGrade = computeLetterGrade(grades);
console.log(`Your letter grade is: ${letterGrade}`);

function computeLetterGrade(grades) {
  let total = grades.reduce((sum, currGrade) => sum + currGrade);
  let average = total / grades.length;

  if (average >= 90) {
    return 'A';
  } else if (average >= 70) {
    return 'B';
  } else if (average >= 50) {
    return 'C';
  } else {
    return 'F';
  }
}

