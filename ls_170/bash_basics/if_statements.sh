#!/bin/bash

integer_1=10
integer_2=20

if [[ $integer_1 -eq $integer_2 ]]
then
    echo "They are equal!"
else
    echo "Not equal!"
fi

if [[ -e ./hello_world.sh ]]
then
    echo "File exists!"
fi

integer_3=5

if [[ $integer_3 -lt 10 && $integer_3 -ge 5 ]]
then
    echo "Test passed!"
fi
