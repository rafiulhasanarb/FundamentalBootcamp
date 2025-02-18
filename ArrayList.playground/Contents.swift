import UIKit
/*
 Array:
 An array is an ordered list that store values of tha same type
 
 Creating array:
 We can create an array by initializing it with values
 Each item is seraparated by a coma, creating an order list
 we can also create blank arrays and modify them later
 */

//MARK: - Creating Array
var shoppingCart: [String] = []
var nameList = ["John", "Jane", "Jim"]
var priceList = [10.99, 9.99, 8.99]

//MARK: Access and modification
shoppingCart.append("Banana") // adds item at end of list
shoppingCart.append("Orange")
shoppingCart.append("Apple")

print(shoppingCart)
print(shoppingCart[0])// retrieve item value at specific index
print(shoppingCart.count)
shoppingCart[0] = "Pineapple" // change item value at specific index
print(shoppingCart)

let name = nameList[0]
let name1 = nameList[1]
let name2 = nameList[2]
//let name3 = nameList[3] // This will cause an error or crash, index out of bounds

nameList.remove(at: 2) // remove item at specified index
print(nameList)

nameList.insert("Mary", at: 1) // insert item at specific index
print(nameList)

priceList.removeFirst()
priceList.removeLast()
print(priceList)

