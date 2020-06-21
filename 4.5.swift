class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    
    init(_ val: Int) {
        self.val = val
    }
}

func isBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return false }
    
    var queue = [root]
    var lvlQueue: [TreeNode]
    
    while !queue.isEmpty {
        lvlQueue = []
        
        for node in queue {
            if let leftNode = node.left {
                if leftNode.val <= node.val {
                    lvlQueue.append(leftNode)
                } else {
                    return false
                }
            }
            
            if let rightNode = node.right {
                if rightNode.val >= node.val {
                    lvlQueue.append(rightNode)
                } else {
                    return false
                }
            }
        }
        
        queue = lvlQueue
    }
    
    return true
}

var treeRoot = TreeNode(7)

treeRoot.left = TreeNode(5)
treeRoot.right = TreeNode(9)

treeRoot.left?.left = TreeNode(4)
treeRoot.left?.right = TreeNode(6)
treeRoot.right?.left = TreeNode(8)
treeRoot.right?.right = TreeNode(10)

var treeRoot2 = TreeNode(1)
treeRoot2.left = TreeNode(2)
treeRoot2.right = TreeNode(3)

let input = [treeRoot, treeRoot2]

let output = input.map { isBST($0) }

let expectedOutput = [true, false]

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
