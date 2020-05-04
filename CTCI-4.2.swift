class TreeNode<T> {
    let value: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(_ value: T) {
        self.value = value
    }
}

func makeBST<ElementType>(from a: [ElementType]) -> TreeNode<ElementType> {
    var visited: [Bool] = Array(repeating: false, count: a.count)
    
    func bst(_ l: Int, _ r: Int) -> TreeNode<ElementType>? {
        guard l < r else { 
            return visited[l] ? nil : TreeNode(a[l])
        }
        
        let m = l + (r - l) / 2
        visited[m] = true
        let root = TreeNode(a[m])
        root.leftNode = bst(l, m) 
        root.rightNode = bst(m + 1, r)
        
        return root
    }
    
    return bst(0, a.count - 1)!
}

func bfs<T>(_ root: TreeNode<T>) -> [[T]] {
    var queue = [root]
    var result = [[T]]()
    
    while !queue.isEmpty {
        var array = [T]()
        for _ in 0 ..< queue.count {
            let node = queue.removeFirst()
            if let leftNode = node.leftNode { queue.append(leftNode) }
            if let rightNode = node.rightNode { queue.append(rightNode) }
            
           array.append(node.value)
        }
        result.append(array)
    }
    
    return result
}

let input = [
    (1...1).map { $0 },
    (1...4).map { $0 },
    (1...15).map { $0 }
]

let expectedOutput = [
    [[1]],
    [[2], [1, 3], [4]],
    [[8], [4, 12], [2, 6, 10, 14], [1, 3, 5, 7, 9, 11, 13, 15]]
]

let output = input.map { bfs(makeBST(from: $0)) }

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
