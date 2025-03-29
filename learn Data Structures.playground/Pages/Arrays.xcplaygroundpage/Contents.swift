import Foundation

// An array of Int type
let numberArray: [Int] = [1, 2, 3, 4, 5]
var otherNumberArray = [10, 20, 30, 40, 50, 60]

// An Array of String type
let nameArray: [String] = ["Alice", "Bob", "Charlie", "David", "Eve", "Frank"]

// An array is a sequence that's why we can iterate an array
for name in nameArray {
    print(name)
}

// An array is a collection means we can traverse an array. Accessing an element using subscript operators
let lastName = nameArray.last
let firstName = nameArray[0]
print("Last name: \(lastName ?? "Not Found")")
print("First name: \(firstName)")


// --- before modifiying the array ---
print(numberArray)
print(otherNumberArray)

otherNumberArray[2] = 70

// --- after modifiying the array ---
print(numberArray)
print(otherNumberArray)
