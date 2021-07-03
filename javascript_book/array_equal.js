function arrayEqual(arr1, arr2) {
    if (arr1.length !== arr2.length) {
        return false;
    }

    for (let idx = 0; idx < arr1.length; idx++) {
        if (arr1[idx] !== arr2[idx]) {
            if (Array.isArray(arr1[idx]) && Array.isArray(arr2[idx])) {
                if (arrayEqual(arr1[idx], arr2[idx])) {
                    continue;
                }
            }

            return false;
        }
    }

    return true;
}

console.log(arrayEqual([1, 2, 3], [1, 2, 3]));
console.log(arrayEqual([1, 2], [1, 2, 3]));
console.log(arrayEqual([1, 2, 5], [1, 2, 3]));
console.log(arrayEqual([1, 2, [1, 2]], [1, 2, [1, 2]]));
console.log(arrayEqual([1, 2, [1, 3]], [1, 2, [1, 2]]));
