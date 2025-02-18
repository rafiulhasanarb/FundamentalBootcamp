import UIKit
/*
 Dictionary:
 a dictionary is a data structure that defines a collection of data as a set of key-value pairs.
 all key are unique
 dictionary are a significantly more efficient look up tool than arrays, since we can associate a value with key, as opposed to a number
 
 Creating dictionary:
 List like arrays we can create blank dictionary or initialize them with value
 each item is separated by coma, just like arrays
 we use a colon to differentiate the key and value
 */

//MARK: - Creating dictionary
var myDictionary: [String: String] = [:]
var blankDictionary = [String: String]()
myDictionary = ["name": "John", "age": "30", "city": "New York"]
print(myDictionary["name"]!) 
print(myDictionary["age"]!) 
print(myDictionary["city"]!)

var nameEmailDic = ["John": "john@gmail.com", "rafi": "rafi@example.com"]
var nameAgeDic = ["Johne": 30, "rafi": 31]

//MARK: - Dictionary lookups
let johnEmail = nameEmailDic["John"]!// Keys are used as the lookup parameter value is information associated values
print(johnEmail)

let rafiAge = nameAgeDic["rafi"]!
print(rafiAge)

//MARK: - Upadating dictionary

nameEmailDic["John"] = "johnny@gmail.com"
print(nameEmailDic)
