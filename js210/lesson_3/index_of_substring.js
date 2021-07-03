// Write two functions that each take two strings as arguments. Their expected
// behaviors are as follows:

// The indexOf function searches for the first instance of a substring in
// firstString that matches the string secondString, and returns the index of
// the character where that substring begins.

// The lastIndexOf function searches for the last instance of a substring in
// firstString that matches the string secondString, and returns the index of
// the character where that substring begins.

// Both functions return -1 if firstString does not contain the substring
// specified by secondString.

function indexOf(firstString, secondString) {
  let last_idx = firstString.length - secondString.length;
  for (let main_idx = 0; main_idx <= last_idx; main_idx++) {
    if (substringMatchAt(firstString, secondString, main_idx)) {
      return main_idx;
    }
  }

  return -1;
}

function lastIndexOf(firstString, secondString) {
  let first_idx = firstString.length - secondString.length;
  for (let main_idx = first_idx; main_idx >= 0; main_idx--) {
    if (substringMatchAt(firstString, secondString, main_idx)) {
      return main_idx;
    }
  }

  return -1;
}

function substringMatchAt(firstString, secondString, main_idx) {
  for (let search_idx = 0; search_idx < secondString.length; search_idx++) {
    if (firstString[main_idx + search_idx] !== secondString[search_idx]) {
      return false;
    }
  }

  return true;
}


console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
