// let myArray = [
//   [1, 3, 6, 11],
//   [4, 2, 4],
//   [9, 17, 16, 0],
// ];

// function logEvens(arr) {
//     arr.forEach(function(elem) {
//         if (elem % 2 == 0) {
//             console.log(elem)
//         }
//     })
// }

// myArray.forEach(arr => logEvens(arr));
//

// let myArray = [
//   1, 3, 6, 11,
//   4, 2, 4, 9,
//   17, 16, 0,
// ];

// let newArray = myArray.map( elem => (elem % 2 === 0) ? 'even' : 'odd');
// console.log(newArray);

// function findIntegers(arr) {
//     return arr.filter(elem => Number.isInteger(elem));
// }

// let things = [1, 'a', '1', 3, NaN, 3.1415, -4, null, false];
// let integers = findIntegers(things);
// console.log(integers); // => [1, 3, -4]

// let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
// console.log(oddLengths(arr)); // => [1, 5, 3]

// function oddLengths(arr) {
//     return arr.map(elem => elem.length).filter(length => length % 2 === 1);
// }
//

// let array = [3, 5, 7];
// console.log(sumOfSquares(array)); // => 83

// function sumOfSquares(arr) {
//     return arr.reduce((sum, elem) => sum + (elem * elem), 0);
// }
//

// let arr = ['a', 'abcd', 'abcde', 'abc', 'ab'];
// console.log(oddLengths(arr)); // => [1, 5, 3]

// function oddLengths(arr) {
//     return arr.reduce(
//         function(filtered_array, current_string) {
//             if (current_string.length % 2 == 1) {
//                 filtered_array.push(current_string)
//             }

//             return filtered_array;
//         },
//         []);
// }

let numbers1 = [1, 3, 5, 7, 9, 11];
let numbers2 = [];
let numbers3 = [2, 4, 6, 8];

console.log(numbers1.includes(3));
console.log(numbers2.includes(3));
console.log(numbers1.includes(3));

let arr = [
  ["hello", "world"],
  ["example", "mem", null, 6, 88],
  [4, 8, 12]
];

arr[1][3] = 606;

console.log(arr);
