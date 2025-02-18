import UIKit

/*
 Loops
 A loop in a computer program is an instruction that continually repeats until we want it to stop
 We use loops to perform tasks repeatedly, more efficiently
 We can also use loops to iterate through data structures like arrays and dictionary
 
 For loops
 A loop runs a set number of times before stipping
 We define a range with upper and lower bound to determine start/ end point
 The number of times the loop will run: upperbound - lowerbound
 The i represents the iteration of the loop we are on. It begains at the lower bound and increments by 1 after each iteration of the loop completes. This repeats until we reach the upper bound.
 for i in 1 ... 10 {
    // code go here....
 }
 */

for i in 1 ... 10 {
    print(i)
}
print("-------------------------")
for i in 0 ..< 10 {
    print(i)
}
print("-------------------------")

var shoppintCart = ["Banana", "Orange", "Apple", "Pineapple"]

for item in shoppintCart {
    print("Shopping item: \(item)")
}

print("-------------------------")

var priceList = [10, 20, 30, 40]
var couponPrice = 5



for price in priceList {
    print("Price with coupon: \(price - couponPrice)")
}

print("-------------------------")

for i in 0 ..< priceList.count {
    let price = priceList[i]
    print("Price is \(price)")
}

print("-------------------------")


// MARK: - While loops
/*
 A while loop is different from a for loop in that it is conditional based
 While loop some condition is met, the loop will continue, it will stop when the condition is no longer valid
 */

var counDown = 10

while counDown >= 0 {
    print("Countdown: \(counDown)")
    if counDown == 3 {
        print("Time to eat!")
    }
    counDown -= 1
}
