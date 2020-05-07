class BSTNode<T> {
    let value: T
    var height: Int
    var left: BSTNode?
    var right: BSTNode?
    
    init(_ value: T) {
        self.value = value
        height = -1
    }
}

func isBalancedBST<T>(_ root: BSTNode<T>?) -> Bool {
    guard let root = root else { return true } // We assume empty BST as balanced.
    getHeight(of: root)
    
    var queue = [root]
    
    while !queue.isEmpty {
        for _ in 0 ..< queue.count {
            let node = queue.removeFirst()
            
            guard areOfEqualHeight(node.left, node.right) else { return false }
            
            if let leftNode = node.left { queue.append(leftNode) }
            if let rightNode = node.right { queue.append(rightNode) }
        }
    }
    
    return true
}

@discardableResult
private func getHeight<T>(of root: BSTNode<T>?) -> Int {
    guard let root = root else { return 0 }
    
    root.height = 1 + max(
        getHeight(of: root.left),
        getHeight(of: root.right)
    )
    
    return root.height
}

private func areOfEqualHeight<T>(_ lhs: BSTNode<T>?, _ rhs: BSTNode<T>?, margin: Int = 1) -> Bool {
    let lhsHeight = lhs?.height ?? 0
    let rhsHeight = rhs?.height ?? 0
    return abs(lhsHeight - rhsHeight) < margin
}

let treeRoot: BSTNode<Int> = BSTNode(8)

treeRoot.left = BSTNode(4)
treeRoot.right = BSTNode(12)

treeRoot.left?.left = BSTNode(2)
treeRoot.left?.right = BSTNode(6)
treeRoot.right?.left = BSTNode(10)
treeRoot.right?.right = BSTNode(14)

treeRoot.left?.left?.left = BSTNode(1)
treeRoot.left?.left?.right = BSTNode(3)
treeRoot.left?.right?.left = BSTNode(5)
treeRoot.left?.right?.right = BSTNode(7)

treeRoot.right?.left?.left = BSTNode(9)
treeRoot.right?.left?.right = BSTNode(11)
treeRoot.right?.right?.left = BSTNode(13)
treeRoot.right?.right?.right = BSTNode(15)

let unbalancedTreeRoot: BSTNode<Int> = BSTNode(3)
unbalancedTreeRoot.left = BSTNode(2)
unbalancedTreeRoot.left?.left = BSTNode(1)

let input = [
    treeRoot,
    unbalancedTreeRoot
]

let expectedOutput = [
    true,
    false
]

let output = input.map { isBalancedBST($0) }

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
