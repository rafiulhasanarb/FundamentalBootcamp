import Combine
import Foundation

class CustomNumberPublisher: Publisher {
    
    typealias Output = Int
    typealias Failure = Never
    
    private let numbers: [Int]
    
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    
    func receive<S: Subscriber>(subscriber: S) where S.Input == Output, S.Failure == Failure {
        for number in numbers {
            _ = subscriber.receive(number)
        }
        subscriber.receive(completion: .finished)
    }
}

let subscriber = CustomNumberPublisher(numbers: [1, 2, 3, 4, 5]).sink { value in
    print(value)
}

// Understanding PassthroughSubject
let subject = PassthroughSubject<Int, Never>()

let subscriber = subject.sink { value in
    print("Received value: \(value)")
}

subject.send(1)
subject.send(2)
subject.send(3)

let subject = CurrentValueSubject<String, Never>("Initial Value")
let currentValue = subject.value

print("Current value: \(currentValue)")

let subscriber = subject.sink { value in
    print("Received value: \(value)")
}
subject.send("New Value")
