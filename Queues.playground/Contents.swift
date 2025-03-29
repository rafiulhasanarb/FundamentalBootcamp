import UIKit
import Foundation

struct Queue<T> {
    var items: [T] = []
    
    //MARK: - Function: isEmpty
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    //MARK: - Function: enqueue()
    mutating func enqueue(_ element: T) {
        items.append(element)
    }
    
    //MARK: - Function: dequeue()
    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return items.removeFirst()
    }
}

extension Queue : CustomStringConvertible {
    //MARK: - Function: description()
    var description: String {
        return String(describing: items)
    }
    
}

var queue = Queue<Int>()
queue.enqueue(11)
queue.enqueue(22)
queue.enqueue(33)
queue.enqueue(44)
print(queue)

queue.dequeue()
print(queue)
