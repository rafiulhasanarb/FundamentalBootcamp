import UIKit
/*
 Functions:
 Functions are self contained chunks of code that perform a specific task.
 */

//MARK: - Declaration / Creating function
func hello() {
    print("Hello! playground")
}
// MARK: call the functions
hello()

//MARK: Input parameter in function
func greet(person: String) -> String {
    return "Hello, \(person)!"
}
print(greet(person: "Alice"))

//MARK: - Return a value from functions
func sayHello() -> String {
    return "Hello, World!"
}
print(sayHello())

func tripleValue(x: Int) -> Int {
    return x * 3
}

let result = tripleValue(x: 10)
print("The result is \(result)")

func getAge(birthYear: Int) -> Int {
    let currentYear = 2025
    let age = currentYear - birthYear
    return age
}

func displayAge(yearOfBirth: Int) {
    let age = getAge(birthYear: yearOfBirth)
    print("You are \(age) years old.")
}

displayAge(yearOfBirth: 1988)
displayAge(yearOfBirth: 1989)
displayAge(yearOfBirth: 1990)
displayAge(yearOfBirth: 1993)
