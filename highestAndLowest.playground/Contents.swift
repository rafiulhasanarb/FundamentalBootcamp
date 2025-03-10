import UIKit

func highestAndLowest( array: [Int]) {
    
    var higher = array[0]
    var lower = array[0]
    
    for i in 0..<array.count {
        if higher < array[i] {
            higher = array[i]
        }
        
        if lower > array[i] {
            lower = array[i]
        }
    }
    print("\(higher) \(lower)")
    
    print("Difference: \(higher-lower)")
    
}

var arrayList = [1,2,5,6,7,74,96,5,4,3,47,56,36,12,45,78]

print(arrayList.sorted(by: <))
//print(highestAndLowest( array: arrayList))

let result = highestAndLowest(array: arrayList)
print(result)


func characterCount(inputString: String) {
    
    var characterCountDictionary: [Character: Int] = [:]
    
    for character in inputString {
        if let existingCount = characterCountDictionary[character] {
            characterCountDictionary[character] = existingCount + 1
        } else {
            characterCountDictionary[character] = 1
        }
        
        print(characterCountDictionary)
    }
}

let inputString = "Hello World, Rafiul Hasan!"
characterCount(inputString: inputString)

