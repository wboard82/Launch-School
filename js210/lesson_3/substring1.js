function substr(string, start, length) {
  if (start < 0) {
    start = string.length + start;
  }

  let end = start + length;
  if (end > string.length) {
    end = string.length;
  }

  let substring = '';
  for (let idx = start; idx < end; idx++) {
    substring += string[idx];
  }

  return substring;
}

let string = 'hello world';

console.log(substr(string, 2, 4) == "llo ");
console.log(substr(string, -3, 2) == "rl");
console.log(substr(string, 8, 20) == "rld");
console.log(substr(string, 0, -20) == "");
console.log(substr(string, 0, 0) == "");

// The start argument is the starting index. If negative, treat it as strLength
// + start where strLength is the length of the string. For example, if start is
// -3, treat it as strLength - 3.
//
// The length argument is the maximum length of the desired substring. If length
// exceeds the number of characters available, just use the available
// characters.
