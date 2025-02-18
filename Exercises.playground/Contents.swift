import Foundation
/*
 Exercises
 1. Use loops and comparasion operators to print out odd or even numbers in a range
 2. Given an array of numbers
    - Computing sum
    - Max value
    - Min value
 3. Guest list of users
    - Create a function to search for a users by name
    - Create a function to get all users less than a certain age
    - Update RSVP Status
    - Get number of users attending party
    - Get number of users not coming to party
    - Print report of age of users, attendees, etc
 4. Create Product and Shopping cart data structures
    - Apply discount to items(Dollar and percentage)
    - Get total cost of products
    - Print receipt
 */

//MARK: - Problems 1
func printOddEvenNumbers(showEven: Bool, lowerBount: Int, upperBound: Int) {
    for i in lowerBount...upperBound {
        if showEven {
            if i % 2 == 0 {
                print("Even number: \(i)")
            }
        } else {
            if i % 2 != 0 {
                print("Odd number: \(i)")
            }
        }
    }
    print("--------------------")
}

//printOddEvenNumbers(showEven: true, lowerBount: 10, upperBound: 30)
//printOddEvenNumbers(showEven: false, lowerBount: 10, upperBound: 30)

//MARK: - Problems 2
var givenNumbers: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

print("Sum: \(givenNumbers.reduce(0, +))")
print("Max: \(givenNumbers.max() ?? 0)")
print("Min: \(givenNumbers.min() ?? 0)")
print("--------------------")

@MainActor
func computeSum() -> Int {
    var sum = 0
    for num in givenNumbers {
        sum += num
    }
    return sum
}

@MainActor
func computeMax() -> Int {
    var max = 0
    for num in givenNumbers {
        if num > max {
            max = num
        }
    }
    return max
}

@MainActor
func computeMin() -> Int {
    var min = 0
    for num in givenNumbers {
        if num < min {
            min = num
        }
    }
    return min
}
computeMin()
print("--------------------")

//MARK: - Problems 3

struct Guest {
    let name: String
    let age: Int
    var isAttending: Bool
}

struct GuestList {
    var guests: [Guest] = []
    
    func searchForGuest(name: String) -> Bool {
        for guest in guests {
            if name.lowercased() == guest.name.lowercased() {
                return true
            }
        }
        return false
    }
    
    func getUsersLessThanAge(age: Int) -> [Guest] {
        var result = [Guest]()
        for guest in guests {
            if guest.age <= age {
                result.append(guest)
            }
        }
        return result
    }
    
    func getAttendingGuests() -> Int {
        var count = 0
        for guest in guests {
            if guest.isAttending {
                count += 1
            }
        }
        return count
    }
    
    func getNonAttendingGuests() -> Int {
        var count = 0
        for guest in guests {
            if !guest.isAttending {
                count += 1
            }
        }
        return count
    }
    
    func printReport() {
        print("Total guests: \(guests.count)")
        print("Attending guests: \(getAttendingGuests())")
        print("Non-attending guests: \(getNonAttendingGuests())")
        let guestsUnder21 = getUsersLessThanAge(age: 21)
        print("There are \(guestsUnder21.count) guests not allowed to consume alcohol.")
    }
    
    mutating func addGuest(_ guest: Guest) {
        guests.append(guest)
    }
    
    mutating func removeGuest(named name: String) {
        guests.removeAll { $0.name == name }
    }
}

let g1 = Guest(name: "Bruce Wayne", age: 35, isAttending: false)
let g2 = Guest(name: "Heath Ledger", age: 32, isAttending: true)
let g3 = Guest(name: "Tom Johnson", age: 17, isAttending: true)
let g4 = Guest(name: "Tony Stark", age: 37, isAttending: false)
let g5 = Guest(name: "Katie Holmes", age: 20, isAttending: true)
let g6 = Guest(name: "Megan Fox", age: 34, isAttending: true)
let g7 = Guest(name: "Rafiul Hasan", age: 31, isAttending: false)
let g8 = Guest(name: "Jamil Hasan", age: 29, isAttending: true)
let g9 = Guest(name: "Khan Hasnat", age: 24, isAttending: false)
let g10 = Guest(name: "Saeid Pagla", age: 20, isAttending: true)

let guestList = GuestList(guests: [g1, g2, g3, g4, g5, g6, g7, g8, g9, g10])

guestList.searchForGuest(name: "Rafiul Hasan")
guestList.printReport()

//MARK: - Problems 4
struct Product {
    let name: String
    var price: Double
    
    func applyCashDiscount(_ discount: Double) -> Double {
        return self.price - (price * discount)
    }
    
    func applyPercentageDiscount(_ percentageDiscount: Double) -> Double {
        return self.price - (price * (percentageDiscount / 100))
    }
}

struct ShoppingCart {
    var productList: [Product] = []
    
    mutating func addProduct(_ product: Product) {
        productList.append(product)
    }
    
    mutating func removeProduct(_  product: Product) {
        for it in 0 ..< productList.count {
            let product = productList[it]
            if product.name.lowercased() == product.name.lowercased() && product.price == product.price {
                self.productList.remove(at: it)
                return
            }
        }
    }
    
    func totalPrice() -> Double {
        var totalPrice: Double = 0
        for product in productList {
            totalPrice += product.price
        }
        return totalPrice
        //return productList.reduce(0) { $0 + $1.price }
    }
    
    mutating func clearCart() {
        productList.removeAll()
    }
    
    func printReceipt() {
        print("Receipt:")
        print("--------------------")
        for product in productList {
            print("\(product.name): \(product.price)")
        }
        print("--------------------")
        print("Total: \(totalPrice())")
    }
}

print("--------------------")
var p1 = Product(name: "Banana", price: 0.55)
var p2 = Product(name: "Orange", price: 0.45)
var p3 = Product(name: "Apple", price: 0.35)
var p4 = Product(name: "JackFruit", price: 0.75)
var p5 = Product(name: "Lemon", price: 0.65)
var cart = ShoppingCart()
cart.addProduct(p1)
cart.addProduct(p2)
cart.addProduct(p3)
cart.addProduct(p4)
cart.addProduct(p5)
cart.printReceipt()
print("--------------------")
cart.removeProduct(p4)
cart.printReceipt()
print("--------------------")
