// 1. Concatenate two or more strings, one with your first name and one with your
// last, to create a string with your full name as its value. For example, if
// your name is John Doe, think about how you can put 'John' and 'Doe' together
// to get 'John Doe'.
//
let first = 'Josh';
let last = 'Keller';

console.log(first + ' ' + last);
console.log(`${first} ${last}`);


console.log('--------------------------');

// Use the arithmetic operators to determine the individual digits of a 4-digit number like 4936:
let number = 4936;
let ones = number % 10;
let tens = (number - ones) / 10 % 10;
let hundreds = (number - 10 * tens - ones) / 100 % 10;
let thousands = (number - 100 * hundreds - 10 * tens - ones) / 1000 % 10;

console.log(`thousands place is ${thousands}`);
console.log(`hundreds place is ${hundreds}`);
console.log(`tens place is ${tens}`);
console.log(`ones place is ${ones}`);

console.log('--------------------------');

console.log(Number('5') + 10);
console.log(parseInt('5', 10) + 10);

console.log('--------------------------');

console.log(`The value of 5 + 10 is ${Number('5') + 10}.`);

console.log('--------------------------');

let foo = ['a', 'b', 'c'];
console.log(foo.length);
console.log(foo[3]);

console.log('--------------------------');

let names = ['asta', 'butterscotch', 'pudding', 'neptune', 'darwin'];
console.log(names);

console.log('--------------------------');

let pets = {
    asta:           'dog',
    butterscotch:   'cat',
    pudding:        'cat',
    neptune:        'fish',
    darwin:         'lizard'
};

console.log(pets);

// What do the following expressions evaluate to?

'foo' === 'Foo' // false
parseInt('3.1415') // 3
'12' < '9' // True


