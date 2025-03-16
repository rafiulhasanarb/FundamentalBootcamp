import Combine

func addTwoNumbers(_ a: Int, _ b: Int) -> Int {
    return a + b
}

let justPublisher = Just(addTwoNumbers(10, 20))

let justSubscriber = Subscribers.Sink<Int, Never> { completion in
    print(completion)
} receiveValue: { value in
    print("valus: \(value)")
}

justPublisher.print().subscribe(justSubscriber)
    
