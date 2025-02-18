import UIKit
/*
 Conditional statements allow us to execute certain block of code based on wheater or not a given contion is true or false
 We typically use comparison operators for this.
 */

var a = 10
var b = 20

if a == b {
    // if block
    print("a is equal to b")
} else {
    // else block
    print(" a is not equal to b")
}

var sleepy = false
if sleepy {
    print("Time to sleep")
} else {
    print("Watch one more episode")
}

var age = 45

if age >= 65 {
    print("You're a senior cityzen")
} else if age >= 18 {
    print( "You're an adult")
} else {
    print(" You're a minor")
}

//MARK: - Compound expressions

var totalCash = 100
var priceCar = 80
var interestRate = 0.8

if totalCash >= priceCar && interestRate <= 0.6 {
    print( "You can buy the car")
} else {
    print("You cannt affort it yet, save more money.")
}

var girlFriendIsHungry = true
var girlFriendIsTired = true

if girlFriendIsTired || girlFriendIsHungry {
    print("State of Emergency. Everybody run for their lives")
} else {
    print("You're ok for now...")
}
