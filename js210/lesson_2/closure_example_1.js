function add(first, second) {
  return first + second;
}

function makeAdder(firstNumber) {
  return function(secondNumber) {
    return add(firstNumber, secondNumber);
  }
}

let addFive = makeAdder(5);
let addTen = makeAdder(10);

console.log(addFive);
console.log(addTen);

console.log(addFive(3));
console.log(addFive(55));
console.log(addTen(3));
console.log(addTen(55));

