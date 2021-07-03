// function has_a_or_e(string) {
//     let results = string.match(/[ae]/g);
//     if (results) {
//         console.log(`We have a match! ${results}`);
//     } else {
//         console.log(`No match here.`);
//     }
// }

// has_a_or_e("basketball"); // => We have a match! a,e,a
// has_a_or_e("football");   // => We have a match! a
// has_a_or_e("hockey");     // => We have a match! e
// has_a_or_e("golf");       // => No match here.

// let words = [
//   'laboratory',
//   'experiment',
//   'flab',
//   'Pans Labyrinth',
//   'elaborate',
//   'polar bear',
// ];

// console.log(allMatches(words, /lab/)); // => ['laboratory', 'flab', 'elaborate']

// function allMatches(strings, regex) {
//     return strings.filter( string => regex.test(string) );
// }

function isNotANumber(value) {
    return !value && value !== false &&
        value !== 0 && value !== undefined && value !== null
}

console.log(isNotANumber(NaN));
console.log(isNotANumber(false));
console.log(isNotANumber(1));
console.log(isNotANumber(0));
console.log(isNotANumber(null));
console.log(isNotANumber(undefined));
