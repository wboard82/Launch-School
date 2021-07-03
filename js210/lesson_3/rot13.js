// For each character in the original String:

// If the character is a letter in the modern English alphabet, change it to the
// character 13 positions later in the alphabet. Thus, a becomes n. If you reach
// the end of the alphabet, return to the beginning. Thus, o becomes b.
//
// Letter transformations preserve case. A becomes N while a becomes n.
//
// Don't modify characters that are not letters.
//
// Write a Function, rot13, that takes a String and returns that String transformed by the rot13 cipher.

function inFirstHalf(letter) {
  return (letter >= 'A' && letter <= 'M') ||
         (letter >= 'a' && letter <= 'm');
}

function inSecondHalf(letter) {
  return (letter >= 'N' && letter <= 'Z') ||
         (letter >= 'n' && letter <= 'z');
}

function rotateBy(character, offset) {
  let newCharCode = character.charCodeAt(0) + offset;
  return String.fromCharCode(newCharCode);
}

function rot13(string) {
  const OFFSET = 13;
  let rotatedString = ''; 

  for (let idx = 0; idx < string.length; idx++) {
    let character = string[idx];

    if (inFirstHalf(character)) {
      character = rotateBy(character, OFFSET);
    } else if (inSecondHalf(character)) {
      character = rotateBy(character, -OFFSET);
    }

    rotatedString += character;
  }

  return rotatedString;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.') ===
  'Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.');

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')) ===
  'Teachers open the door, but you must enter by yourself.');
