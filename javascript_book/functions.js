let rlSync = require('readline-sync');

function ask_for_info(info) {
    return rlSync.question(`What's your ${info}?\n`);
}

let first_name = ask_for_info("first name")
let last_name = ask_for_info("last name")
console.log(`Hello, ${first_name} ${last_name}!`);

