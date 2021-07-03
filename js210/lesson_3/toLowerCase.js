function toLowerCase(string) {
  let lowerCaseString = ''
  const OFFSET = 32;

  for (let idx = 0; idx < string.length; idx++) {
    let currentLetter = string[idx];
    if (currentLetter >= 'A' && currentLetter <= 'Z') {
      let asciiNumeric = currentLetter.charCodeAt(0);
      asciiNumeric += OFFSET;
      currentLetter = String.fromCharCode(asciiNumeric);
    }
    lowerCaseString += currentLetter;
  }

  return lowerCaseString;
}

console.log(toLowerCase('ALPHABET') == "alphabet");
console.log(toLowerCase('123') == "123");
console.log(toLowerCase('abcDEF') == "abcdef");
