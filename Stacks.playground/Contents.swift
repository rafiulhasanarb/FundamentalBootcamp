import UIKit
import Foundation

struct Stack {
    private var items: [String] = []
    
    //MARK: - isEmpty
    var isEmpty: Bool {
      return items.isEmpty
    }
    
    //MARK: - Function: peek()
    func peek() -> String {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    //MARK: - Function: pop()
    mutating func pop() -> String {
        return items.removeFirst()
    }
    
    //MARK: - Function: push()
    mutating func push(_ element: String) {
        items.insert(element, at: 0)
        //items.append(element)
    }
}

var nameStack = Stack()

nameStack.push("Caleb")
nameStack.push("Charles")
nameStack.push("Tina")

print(nameStack)
