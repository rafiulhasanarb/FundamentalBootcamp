import UIKit

// MARK: - Map
let numbArray : [Int] = [1,2,3,4,5,6,7,8,9,10]
let multiplyNumber : Int = 2
var multipliedArray : [Int] = [Int]()

for eachNumb in numbArray {
    multipliedArray.append(eachNumb * multiplyNumber)
}
print(multipliedArray) //result: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

let newArray = numbArray.map { eachNum in
    return eachNum * multiplyNumber
}
print(newArray) //result: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
// simpler way
let newShortArray = numbArray.map{$0 * multiplyNumber}
print(newShortArray) // result: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]

// Map is one of the most used functions. The map function is a function that gives us the processed collection after accessing all the elements in a collection and doing the things we want with these elements.
struct Person {
    let name:String
    let surname:String
    let age:Int
    let gender:String
    let job:String
    let married:Bool
}

let walter = Person(name: "Walter", surname: "White", age: 64, gender: "male", job: "chemistry teacher", married: true)
let jesse = Person(name: "Jesse", surname: "Pinkman", age: 38, gender: "male", job: "self-employment", married: false)
let gus = Person(name: "Gustavo", surname: "Fring", age: 64, gender: "male", job: "Chicken Man", married: false)
let saul = Person(name: "Saul", surname: "Goodman", age: 62, gender: "male", job: "Lawyer", married: false)

let characters = [jesse, walter, gus, saul]

let charactersNameUppercased = characters.map { $0.name.uppercased() }
print(charactersNameUppercased) // ["JESSE", "WALTER", "GUSTAVO", "SAUL"]

let charactersNameAndJob = characters.map { [$0.name, $0.job] }
print(charactersNameAndJob) // [["Jesse", "self-employment"], ["Walter", "chemistry teacher"], ["Gustavo", "Chicken Man"], ["Saul", "Lawyer"]]

let charactersNameAndJobFlatted = characters.map { [$0.name, $0.job] }.flatMap{ $0 }
print(charactersNameAndJobFlatted) // ["Jesse", "self-employment", "Walter", "chemistry teacher", "Gustavo", "Chicken Man", "Saul", "Lawyer"]


// MARK: - CompactMap
// With Map:
let optionalNumbArray : [String] = ["1","2","3","four","5","six","7"]
let newMapArray = optionalNumbArray.map { eachNum -> Int? in
    if Int(eachNum) != nil {
        return Int(eachNum)
    } else {
        return nil
    }
}
print(newMapArray) // result: [Optional(1), Optional(2), Optional(3), nil, Optional(5), nil, Optional(7)]
// With CompactMap:
let newCompactArray = optionalNumbArray.compactMap { Int($0) }
print(newCompactArray) // result: [1, 2, 3, 5, 7]

// It is exactly the same as map but the only difference is that if there is a nil value in the array, compactMap will filter those data and return the new array.
let results = ["40", "60", "80", nil, "20"]

var resultsExamForLoop = [String]()
for i in results {
    if i != nil {
        resultsExamForLoop.append(i!)
    }
}
print(resultsExamForLoop) // ["40", "60", "80", "20"]

let resultsExam = results.compactMap { (result) -> String? in
    return result
}
print(resultsExam) // ["40", "60", "80", "20"]

let listResults = ["40", "60", "80", "Math", "20"]
let compactMapResults = listResults.compactMap { Int($0) }
print(compactMapResults) // [40, 60, 80, 20]


// MARK: - FlatMap
var multiDimensionalArray : [[Int]] = [[1,2,3], [4,5,6],[7,8,9]]
var singleArray = multiDimensionalArray.flatMap{ $0 }
print(singleArray) // result: [1, 2, 3, 4, 5, 6, 7, 8, 9]

// we have 2 single arrays and wants to merge them as multi dimensional array
let firstArray = [1, 2, 3]
let secondArray = [4, 5, 6]
let resultArray = firstArray.map { first in secondArray.map {second in (first, second)}}.flatMap{$0}
print(resultArray) // result: [(1, 4), (1, 5), (1, 6), (2, 4), (2, 5), (2, 6), (3, 4), (3, 5), (3, 6)]

// The flatMap function allows us to transform a set of arrays into a single set that contains all of the elements.
let list = [[300, 200, 150, 100], [50, 100, 150]]

let listResult = list.flatMap { (items) -> [Int] in
    return items
}
print(listResult) // [300, 200, 150, 100, 50, 100, 150]

let listShorter = list.flatMap { $0 }
print(listShorter) // [300, 200, 150, 100, 50, 100, 150]


// MARK: - Reduce
var sumArrayElements : [Int] = [1,2,3,4,5,6,7,8,9,10]
var sumValue = sumArrayElements.reduce(0) { firstValue, secondValue in
    return firstValue + secondValue
}
print(sumValue) // result: 55
// we can write above function in short way
var anotherSumValue = sumArrayElements.reduce(5) { $0 + $1 }
print(anotherSumValue) // result: 60

// The reduce function loops over every item in a collection and reduces them to one value.
let pointsReduce = [200, 100, 50, 65]

var totalResultsForLoop = 0
for point in pointsReduce {
    totalResultsForLoop += point
}
print(totalResultsForLoop) // 415

let totalResult = pointsReduce.reduce(0) { (result, point) -> Int in
    return result + point
}
print(totalResult) // 415

let totalResultShorter = pointsReduce.reduce(0, { $0 + $1 })
print(totalResultShorter) // 415

let totalResultShortest = pointsReduce.reduce(0, +)
print(totalResultShortest) // 415


// MARK: - Filter
var agesOfvotersApplied : [Int] = [24,17,45,23,34,26,47,29]
var approvedVotersAge = agesOfvotersApplied.filter{ $0 > 18}
print(approvedVotersAge) // result: [24, 45, 23, 34, 26, 47, 29]
var govtAprovedAges = agesOfvotersApplied.filter{ $0 > 18 && $0 < 35 } // multiple conditions
print(govtAprovedAges) // result: [24, 23, 34, 26, 29]

// Filter is one of the most used functions. As the name suggests, it helps us to filter the elements of the collection according to certain properties.
let names = ["Walter", "Jesse", "Gus", "Saul"]

var nameResult = [String]()
for name in names {
    if name.contains("a") {
        nameResult.append(name)
    }
}
print(nameResult) // ["Walter", "Saul"]

let filteredNames = names.filter { name in
    name.contains("a")
}
print(filteredNames) // ["Walter", "Saul"]

let filteredNamesShorter = names.filter { $0.contains("a") }
print(filteredNamesShorter) // ["Walter", "Saul"]


// MARK: - Contains
var countryNames : [String] = ["India" , "USA", "China" , "Australia","UK"]
var iCoutnryName = countryNames.filter{ $0.contains("i")}
print(iCoutnryName) // result: [“India”, “China”, “Australia”]

// This function checks if a collection contains any element we are looking for.
let movie = "Fight Club"
print(movie.contains("i")) // true


// MARK: - Sort & Sorted
var agesOfvoters : [Int] = [24,17,45,23,34,26,47,29]
var anotherSortArray = agesOfvoters.sorted() // default sort is ascending order
// we can also write in this way
var mySorterArray = agesOfvoters.sorted{ $0 < $1 } // result : [17, 23, 24, 26, 29, 34, 45, 47]
// another way to write , which is simpler way is
var descSortArray = agesOfvoters.sorted(by: >) // result: [47, 45, 34, 29, 26, 24, 23, 17]

// Both functions are used to sort the elements in the given collection. While the sort function sorts this array within itself, the sorted function creates a new array with the elements of the array in order.
var numberlist = [200, 100, 360, 185, 40, 500]
numberlist.sort()
print(numberlist) // [40, 100, 185, 200, 360, 500]

let resultsOfExam = ["Math": 60, "History": 80, "Science": 70]
let sortedResults = resultsOfExam.map { $0.value }.sorted { (result1, result2) -> Bool in
    return result1 > result2
}
print(sortedResults) // [80, 70, 60]

let sortedResultsShorter = resultsOfExam.map { $0.value }.sorted { $0 > $1 }
print(sortedResultsShorter) // [80, 70, 60]


// MARK: - ForEach
var countryNameList : [String] = ["India" , "USA", "China" , "Australia","UK"]
countryNameList.forEach {
    print($0.uppercased())
}

// ForEach Calls the given closure on each element in the sequence in the same order as a for-in loop.
let movies = ["Fight Club", "Lord of the Rings", "Prestige", "Harry Potter"]

for movie in movies {
    print(movie) // Fight Club, Lord of the Rings, Prestige, Harry Potter
}

movies.forEach { movie in
    print(movie) // Fight Club, Lord of the Rings, Prestige, Harry Potter
}

movies.forEach { print($0) } // Fight Club, Lord of the Rings, Prestige, Harry Potter


// MARK: - RemoveAll
// Collection Ex:
var sumArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
sumArray.removeAll(where: {$0 % 3 == 0})
print(sumArray) // [1, 2, 4, 5, 7, 8, 10]
// String Ex:
var myStatement = "hello \\welcome to \n\\ios learning\\ \n\n\n"
let additionalChar : Set<Character> = ["\\" , "\n"]
myStatement.removeAll(where: { additionalChar.contains($0) })
print(myStatement) // result: hello welcome to ios learning

var multiDimensional: [[Int]] = [[1,2,3], [4,5,6],[7,8,9]]
var singleArraysum = multiDimensional.flatMap{ $0 }.reduce(0) { $0 + $1 }
print(singleArraysum)// result : 45

// This function, as the name suggests, deletes all elements in a collection or all elements that meet the desired condition.
var moviesList = ["Fight Club", "Lord of the Rings", "Prestige", "Harry Potter"]

moviesList.removeAll { $0.count < 11 }
print(moviesList) // ["Lord of the Rings", "Harry Potter"]

moviesList.removeAll()
print(moviesList) // []

// MARK: - Split
let sentence = "I  am not in danger, Skyler.  I am the danger."

let splitted = sentence.split(separator: " ")
print(splitted) // ["I", "am", "not", "in", "danger,", "Skyler.", "I", "am", "the", "danger."]

let splittedMaxSplit1 = sentence.split(separator: " ", maxSplits: 1)
print(splittedMaxSplit1) // ["I", " am not in danger, Skyler.  I am the danger."]

let splittedOmittingEmptySubsequencesFalse = sentence.split(separator: " ", omittingEmptySubsequences: false)
print(splittedOmittingEmptySubsequencesFalse) // ["I", "", "am", "not", "in", "danger,", "Skyler.", "", "I", "am", "the", "danger."]

// MARK: - First & Last
// first: Returns the first element of the sequence that satisfies the given predicate.
// last: Returns the last element of the sequence that satisfies the given predicate.
let movieList = ["Fight Club", "Lord of the Rings", "Prestige", "Harry Potter"]

let firstMoreThan10LettersMovie = movieList.first { (movie) -> Bool in
    return movie.count > 10
}
print(firstMoreThan10LettersMovie!) // "Lord of the Rings"

let firstMoreThan10LettersMovieShorter = movieList.first { $0.count > 10 }
print(firstMoreThan10LettersMovieShorter!) // "Lord of the Rings"

let lastMoreThan10LettersMovie = movies.last { (movie) -> Bool in
    return movie.count > 10
}
print(lastMoreThan10LettersMovie!) // "Harry Potter"

let lastMoreThan10LettersMovieShorter = movieList.last { $0.count > 10 }
print(lastMoreThan10LettersMovieShorter!) // "Harry Potter"
