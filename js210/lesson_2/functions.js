// function average(a, b, c) {
//     return (a + b + c) / 3;
// }

// console.log(average(1, 2, 3));


// function sum(a, b, c) {
//     return a + b + c;
// }

// console.log(sum(1, 2, 3));

// function average(arr) {
//     let total = 0;

//     for(let idx = 0; idx < arr.length; idx++) {
//         total += arr[idx];
//     }

//     return total / arr.length;
// }

function sum(arr) {
    let total = 0;

    for(let idx = 0; idx < arr.length; idx++) {
        total += arr[idx];
    }

    return total;
}

function average(arr) {
    return sum(arr) / arr.length;
}

console.log(average([1, 2, 3, 6, 20]));
console.log(sum([1, 2, 3, 6, 20]));

let temperatures = [70, 82, 105, 67, 92];
console.log(average(temperatures));
