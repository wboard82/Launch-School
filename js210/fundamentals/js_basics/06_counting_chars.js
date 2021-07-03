rlSync = require("readline-sync");

const phrase = rlSync.question("Please enter a phrase: ");
const phrase_no_spaces = phrase.replace(/[^a-z]/ig, '');

console.log(`There are ${phrase_no_spaces.length} non-space characters in '${phrase}'.`);
