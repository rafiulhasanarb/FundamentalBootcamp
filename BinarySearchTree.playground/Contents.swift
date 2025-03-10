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
    
    var isLeft: Bool {
        return value < parent!.value
    }
    
    var isRight: Bool {
        return value < parent!.value
    }
    
    var hasLeft: Bool {
        return left != nil
    }
    
    var hasRight: Bool {
        return right != nil
    }
    
    var hasOneChild: Bool {
        return (left != nil && right == nil) || (left == nil && right != nil)
    }
    
    var hasTwoChildren: Bool {
        return left != nil && right != nil
    }
    
    func insert(value: Int) {
        insert(value, parent: self)
    }
    
    private func insert(_ value: Int, parent: BinarySearchTree) {
        if value < self.value {
            if let left = left {
                //self.left?.parent = self
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
    
    func remove(value: Int) {
        // find our tree that we are removing
        guard let tree = searchAndReturnTree(ofValue: value) else { return }
        
        // isleaf
        if tree.isLeaf {
            tree.removeLeaf(tree: tree)
        }
        
        // has one child
        if tree.hasOneChild {
            removeNodeWithOneChild(tree: tree)
            return
        }
        
        // has two child
        if tree.hasTwoChildren {
            tree.removeNodeWithTwoChildren(tree: tree)
            return
        }
    }
    
    private func removeLeaf(tree: BinarySearchTree) {
        if tree.isLeft {
            tree.parent?.left = nil
        } else {
            tree.parent?.right = nil
        }
    }
    
    private func removeNodeWithOneChild(tree: BinarySearchTree) {
        if tree.isLeft {
            // tree.parent?.left = tree.left ?? tree.right
            if tree.hasLeft {
                tree.parent?.left = tree.left
            } else {
                tree.parent?.left = tree.right
            }
        } else {
           // tree.parent?.right = tree.left ?? tree.right
            if tree.hasLeft {
                tree.parent?.right = tree.left
            } else {
                tree.parent?.right = tree.right
            }
        }
    }
    
    private func removeNodeWithTwoChildren(tree: BinarySearchTree) {
        guard let replacementTree = searchAndReturnTree(ofValue: (tree.right?.minimum().value)!) else { return }
        
        if tree.isLeft {
            if replacementTree.parent?.value == tree.value {
                tree.parent?.left = replacementTree
                replacementTree.left = tree.left
            } else {
                replacementTree.parent?.left = nil
                replacementTree.right = tree.right
                replacementTree.left = tree.left
                tree.parent?.right = replacementTree
            }
        } else {
            if replacementTree.parent?.value == tree.value {
                tree.parent?.right = replacementTree
                replacementTree.left = tree.left
            } else {
                replacementTree.parent?.left = nil
                replacementTree.right = tree.right
                replacementTree.left = tree.left
                tree.parent?.right = replacementTree
            }
        }
    }
    
    // left -> root -> right
    func inOrderTraversal() -> [Int] {
        var result: [Int] = []
        if let left = self.left {
            result += left.inOrderTraversal()
        }
        
        result.append(self.value)
        
        if let right = self.right {
            result += right.inOrderTraversal()
        }
        return result
    }
    
    // root -> left -> right
    func preOrderTraversal() -> [Int] {
        var result: [Int] = []
        
        if let left = self.left {
            result += left.preOrderTraversal()
        }
        
        if let right = self.right {
            result += right.preOrderTraversal()
        }
        
        result.append(self.value)
        
        return result
    }
    
    // right -> left -> root
    func postOrderTraversal() -> [Int] {
        var result: [Int] = []
        
        if let left = self.left {
            result += left.postOrderTraversal()
        }
        
        if let right = self.right {
            result += right.postOrderTraversal()
        }
        
        result.append(self.value)
        
        return result
    }
}

extension BinarySearchTree {
    
    func searchAndReturnTree(ofValue value: Int) -> BinarySearchTree? {
        if value == self.value {
            return self
        }
        
        if value < self.value {
            if let left = self.left {
                return self.right?.searchAndReturnTree(ofValue: value)
            }
        } else {
            if let right = self.right {
                return self.right?.searchAndReturnTree(ofValue: value)
            }
        }
        
        return nil
    }
    
    func minimum() -> BinarySearchTree {
        var node = self
        while let left = node.left {
            node = left
        }
        return node
    }
    
    func maximum() -> BinarySearchTree {
        var node = self
        while let right = node.right {
            node = right
        }
        return node
    }
    
    @MainActor
    func height() -> Int {
        if tree.isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    func depth(ofValue value: Int) -> Int {
        var depth = 0
        guard var tree = searchAndReturnTree(ofValue: value) else { return 0 }
        
        while let parent = tree.parent {
            tree = parent
            depth += 1
        }
        
        return depth
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

let tree = BinarySearchTree(value: 7)
tree.insert(value: 2)
tree.insert(value: 1)
tree.insert(value: 4)
tree.insert(value: 3)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 8)
tree.insert(value: 9)
tree.insert(value: 12)
tree.insert(value: 11)
tree.insert(value: 13)

print(tree.inOrderTraversal())
print(tree.preOrderTraversal())
print(tree.postOrderTraversal())
