let rlSync = require("readline-sync");

function validUnits(input) {
  return (input === 'f' || input === 'm' || input === 'feet' || input === 'meters');
}

function convertToSecondaryUnit(primaryArea, primaryUnits) {
  const SQFEET_PER_SQMETERS = 10.7639;

  if (primaryUnits === 'meters') {
    return primaryArea * SQFEET_PER_SQMETERS;
  } else {
    return primaryArea / SQFEET_PER_SQMETERS;
  }
}


let primaryUnits;
let secondaryUnits;

while (true) {

  let input = rlSync.question("Which units would you like to use? f = Feet, m = Meters: ");
  input = input.trim().toLowerCase();
  if (validUnits(input)) {
    primaryUnits = input.startsWith('f') ? 'feet' : 'meters';
    secondaryUnits = input.startsWith('f') ? 'meters' : 'feet';
    break;
  }

  console.log("Invalid input. Please enter 'f' or 'm'.");
} 

let length = rlSync.question(`Enter the length of the room in ${primaryUnits}:\n`);
let width = rlSync.question(`Enter the width of the room in ${primaryUnits}:\n`);

let primaryArea = length * width;
let secondaryArea = convertToSecondaryUnit(primaryArea, primaryUnits);

console.log(
  `The area of the room is ${primaryArea.toFixed(2)} square ${primaryUnits}. (${secondaryArea.toFixed(2)} square ${secondaryUnits}).`
);

