import Foundation

// MARK: - Tree

class TreeNode<T> {
    var value: T?
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ value: T) {
        self.value = value
        left = nil
        right = nil
    }
}

// MARK: - LinkedList

class LinkedListNode<T> {
    var value: T?
    var next: LinkedListNode?
    
    init(_ value: T?) {
        self.value = value
        next = nil
    }
}

extension LinkedListNode {
    convenience init?(treeNode: TreeNode<T>) {
        self.init(treeNode.value)
    }
    
    func description() -> String {
        var node: LinkedListNode<T>? = self
        var string = ""
        
        while node != nil {
            if let value = node?.value { string += "\(value) " }
            node = node?.next
        }
        
        if !string.isEmpty {
            string.removeLast()
        }
        
        return string
    }
}

// MARK: - Solution

func getListOfDepths<T>(from root: TreeNode<T>?) -> [LinkedListNode<T>] {
    func appendIfAvailable(_ node: TreeNode<T>?, into queue: inout [TreeNode<T>]) {
        if let node = node { queue.append(node) }
    }
    
    guard let root = root else { return [] }
    
    var linkedLists: [LinkedListNode<T>] = []
    var queue = [root]
    
    while !queue.isEmpty {
        var rootLinkedListNode = LinkedListNode<T>(nil)
        var linkedListNode: LinkedListNode? = LinkedListNode<T>(nil)
        rootLinkedListNode.next = linkedListNode
        
        for _ in 0 ..< queue.count {
            let treeNode = queue.removeFirst()
            linkedListNode?.next = LinkedListNode(treeNode: treeNode)
            linkedListNode = linkedListNode?.next

            appendIfAvailable(treeNode.left, into: &queue)
            appendIfAvailable(treeNode.right, into: &queue)
        }
        
        if let node = rootLinkedListNode.next?.next {
            linkedLists.append(node)
        }
    }
    
    return linkedLists
}

var treeRoot: TreeNode<Int> = TreeNode(1)

treeRoot.left = TreeNode(2)
treeRoot.right = TreeNode(3)

treeRoot.left?.left = TreeNode(4)
treeRoot.left?.right = TreeNode(5)
treeRoot.right?.left = TreeNode(6)
treeRoot.right?.right = TreeNode(7)

treeRoot.left?.left?.left = TreeNode(8)
treeRoot.left?.left?.right = TreeNode(9)
treeRoot.left?.right?.left = TreeNode(10)
treeRoot.left?.right?.right = TreeNode(11)

treeRoot.right?.left?.left = TreeNode(12)
treeRoot.right?.left?.right = TreeNode(13)
treeRoot.right?.right?.left = TreeNode(14)
treeRoot.right?.right?.right = TreeNode(15)

let input = treeRoot

let output = getListOfDepths(from: input).map {
    $0.description()
}

let expectedOutput = ["1", "2 3", "4 5 6 7", "8 9 10 11 12 13 14 15"]

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
