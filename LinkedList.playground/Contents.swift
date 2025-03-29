import UIKit
import Foundation

class Node<T> {
    
    var value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    //MARK: - Function: push()
    mutating func push(_ value: T) {
        
        head = Node(value: value, next: head)
        
        if tail == nil {
            tail = head
        }
    }
    
    //MARK: - Function: pop()
    mutating func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    //MARK: - Function: print()
    public var print: String {
        var stringArray = "["
        guard var node = head else {
            Swift.print(stringArray + "]")
            return stringArray + "]" }
        while let next = node.next {
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        Swift.print(stringArray + "]")
        return stringArray + "]"
    }
    
    //MARK: - Function: pop()
    mutating func pop() -> Node<T>? {
        
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
            self.print
        }
        return head
    }
    
    //MARK: - Function: append()
    mutating func append(_ value: T) {
        
        let node = Node(value: value)
        tail?.next = node
        tail = node
        
        if isEmpty {
            head = tail
        }
        self.print
    }
    
    //MARK: - Function: removeLast()
    mutating func removeLast() -> Node<T>? {
        
        guard let head = head else { return nil }
        guard head.next != nil else { return pop() }
        
        var newTail = head
        var currentNode = head
        
        while let next = currentNode.next {
            newTail = currentNode
            currentNode = next
        }
        
        newTail.next = nil
        tail = newTail
        self.print
        return currentNode
    }
    
    //MARK: - Function: node()
    func node(at index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        var current = head
        var counter = 0
        
        while current?.next != nil && counter < index {
            current = current?.next
            counter += 1
        }
        
        Swift.print(current?.value ?? "")
        return current
    }
    
    //MARK: - Function: delete()
    mutating func delete(at index: Int) -> Node<T>? {
        guard index >= 0 else { return nil }
        if index == 0 { return pop() }
        var previous: Node<T>?
        var current = head
        var counter = 0
        
        while current?.next != nil && counter < index {
            previous = current
            current = current?.next
            counter += 1
        }
        
        if current?.next == nil {
            return removeLast()
        }
        
        previous?.next = current?.next
        
        self.print
        return current
    }
    
    //MARK: - Function: insert()
    mutating func insert(data : T, at index : Int) {
        guard index >= 0 else { return }
        let newNode = Node(value: data)
        
        if index == 0 { self.push(data) } else {
            var previous = head
            var current = head
            for _ in 0..<index {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            if newNode.next == nil {
                self.append(data)
                return
            }
            previous?.next = newNode
            self.print
        }
    }
    
    //MARK: - Function: reverse()
    mutating func reverse() {
        var previousNode: Node<T>? = nil
        self.tail = self.node(at: 0)
        var currentNode = head
        var nextNode = head?.next
        
        while nextNode != nil  {
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
            nextNode = currentNode?.next
        }
        currentNode?.next = previousNode
        
        head = currentNode
        self.print
    }
    
}

var fifth = Node(value: 5, next: nil)
var fourth = Node(value: 4, next: fifth)
var third = Node(value: 3, next: fourth)
var second = Node(value: 2, next: third)
var first = Node(value: 1, next: second)

var linkedList = LinkedList<Any>()

linkedList.push(3)
linkedList.push(2)
linkedList.push(1)
