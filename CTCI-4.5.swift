class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    
    init(_ val: Int) {
        self.val = val
    }
}

func isBST(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }
    let (flag, _, _) = dfs(root)
    return flag
}

private func dfs(_ node: TreeNode) -> (Bool, Int, Int) {
    guard node.left != nil || node.right != nil else { // base case, exit
        return (true, node.val, node.val)
    }

    var left: (flag: Bool, max: Int, min: Int)?
    var right: (flag: Bool, max: Int, min: Int)?

    if let leftNode = node.left { left = dfs(leftNode) }
    if let rightNode = node.right { right = dfs(rightNode) }

    guard left?.flag != false && right?.flag != false else { // child node is not BST, exit
        return (false, node.val, node.val)
    }

    var flag: Bool = true
    flag = flag && node.val > (left?.max ?? node.val - 1)
    flag = flag && node.val < (right?.min ?? node.val + 1)

    return (
        flag,
        maxOptional(maxOptional(node.val, left?.max), right?.max),
        minOptional(minOptional(node.val, left?.min), right?.min)
    )
}

private func minOptional(_ lhs: Int, _ rhs: Int?) -> Int {
    guard let rhs = rhs else { return lhs }
    return min(lhs, rhs)
}

private func maxOptional(_ lhs: Int, _ rhs: Int?) -> Int {
    guard let rhs = rhs else { return lhs }
    return max(lhs, rhs)
}

var treeRoot = TreeNode(5)

treeRoot.left = TreeNode(2)
treeRoot.right = TreeNode(8)

treeRoot.left?.left = TreeNode(1)
treeRoot.left?.right = TreeNode(6)
treeRoot.right?.left = TreeNode(0)
treeRoot.right?.right = TreeNode(10)

var treeRoot2 = TreeNode(2)
treeRoot2.left = TreeNode(1)
treeRoot2.right = TreeNode(3)

var treeRoot3 = TreeNode(0)
treeRoot3.left = TreeNode(-1)

var treeRoot4 = TreeNode(1)
treeRoot4.left = TreeNode(1)

let input = [treeRoot, treeRoot2, treeRoot3, treeRoot4]

let output = input.map { isBST($0) }

let expectedOutput = [false, true, true, false]

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
