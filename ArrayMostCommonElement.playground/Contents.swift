import UIKit

var greeting = "Hello, playground"
var colors = ["red", "blue", "green", "yellow", "purple", "orange", "red", "blue", "brown", "red", "blue", "black", "white", "pink", "red", "blue", "green", "yellow", "purple", "orange"]

func mostCommonElement(inArray arrayList: [String]) -> String? {
    var result: String?
    var dictionary: [String: Int] = [:]
    var max = 0
    
    arrayList.forEach { element in
        if let count = dictionary[element] {
            dictionary[element] = count + 1
        } else {
            dictionary[element] = 1
        }
    }
    
    print(dictionary)
    // let sortedArray = dictionary.sorted { $0.value > $1.value }
    // result = sortedArray.first?.key
    
    for (key, value) in dictionary {
        if value > max {
            result = key
            max = value
        }
    }
    
    arrayList.forEach { element in
        print("Color: \(element)")
    }
    return result
}

mostCommonElement(inArray: colors)


func reverseString(_ input: inout [Character]) {
    var i = 0
    var j = input.count - 1
    
    while i < j {
        input.swapAt(i, j)
        print(input)
        i += 1
        j -= 1
    }
}

var testArray: [Character] = ["h", "e", "l", "l", "o"]
reverseString(&testArray)
