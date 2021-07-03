// Write a program named greeter.js that greets 'Victor' three times. Your
// program should use a variable and not hard code the string value 'Victor' in
// each greeting. Here's an example run of the program:

let name = 'Victor';
console.log(`Good Morning, ${name}.`);
console.log(`Good Afternoon, ${name}.`);
console.log(`Good Evening, ${name}.`);

// Write a program named age.js that includes someone's age and then calculates
// and reports the future age in 10, 20, 30 and 40 years. Below is the output
// for someone 20 years old.

let age = 39;

for (let years = 10; years <= 40; years += 10) {
    console.log(`In ${years} years, you will be ${years + age} years old.`);
}

// What happens when you run the following program? Why do we get that result?

// {
//   let foo = 'bar';
// }

// console.log(foo);

// This will produce an error since `foo` is declared inside a block and the
// call to `console.log` is trying to reference `foo` outside of that block.

const NAME = 'Victor';
console.log('Good Morning, ' + NAME);   // Good Morning, Victor
console.log('Good Afternoon, ' + NAME); // Good Afternoon, Victor
console.log('Good Evening, ' + NAME);   // Good Evening, Victor

//NAME = 'Joe';                           // Error because we are attempting to change the value of a const variable
console.log('Good Morning, ' + NAME);
console.log('Good Afternoon, ' + NAME);
console.log('Good Evening, ' + NAME);

// What does this program log to console?

let foo = 'bar';
{
  let foo = 'qux';
}

console.log(foo);
// This will log 'bar' to the console. `foo` is initialized outside of the block
// scope. While this `foo` is accessible within the block, we actually declare
// another `foo` with the `let` statement inside the block. This shadows the old
// `foo` within the block and means the value of the `foo` from outside the
// block is not changed. When the block is exited, that new `foo` from inside
// the block goes out of scope and ceases to shadow the original `foo`. So when
// we log `foo` on the last line we get the original value, 'bar'.
// This is in contrast to the following code where we reassign `bar` within in
// the block instead of shadowing it. Here we are referring to the `bar` that
// was declared on the first line and we are reassigning the value of that
// variable. This demonstrates that variables from the outerscope are available
// within the block scope but the opposite is not true. It also shows that we
// can shadow variables from the outer scope by using a `let` statement to
// create a new variable of the same name.

let bar = 'foo';
{
    bar = 'qux';
}

console.log(bar);
