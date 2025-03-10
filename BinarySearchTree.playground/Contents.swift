import UIKit

class BinarySearchTree {
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var parent: BinarySearchTree?
    
    init(value: Int) {
        self.value = value
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    func insert(value: Int) {
        insert(value, parent: self)
    }
    
    private func insert(_ value: Int, parent: BinarySearchTree) {
        if value < self.value {
            if let left = left {
                self.left?.parent = self
                left.insert(value, parent: self)
            } else {
                left = BinarySearchTree(value: value)
                self.left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value, parent: self)
            } else {
                right = BinarySearchTree(value: value)
                self.right?.parent = self
            }
        }
    }
    
    func search(forValue value: Int) -> Bool {
        
        if value == self.value {
            return true
        }
        
        if value < self.value {
            if let left = left {
                return left.search(forValue: value)
            }
        } else {
            if let right = right {
                return right.search(forValue: value)
            }
        }
        
        return false
    }
}

extension BinarySearchTree {
    func minimum() -> Int {
        var node = self
        while let left = node.left {
            node = left
        }
        return node.value
    }
    
    func maximum() -> Int {
        var node = self
        while let right = node.right {
            node = right
        }
        return node.value
    }
    
    @MainActor
    func height() -> Int {
        if tree.isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth(ofValue: Int) -> Int {
        return 0
    }
}

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        var result = ""
        if let left = left {
            result += "\(left.description) <- "
        }
        
        result += "\(value)"
        
        if let right = right {
            result += " -> \(right.description)"
        }
        
        return result
    }
}

let tree = BinarySearchTree(value: 8)
tree.insert(value: 6)
tree.insert(value: 10)

print(tree)
