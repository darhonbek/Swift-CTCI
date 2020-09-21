// Convert Sorted Array to Binary Search Tree with minimal height.
//
// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else { return nil }
        
        return bst(from: nums, start: 0, end: nums.count - 1)
    }
    
    private func bst(from arr: [Int], start: Int, end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        
        let mid = (start + end) / 2
        let root = TreeNode(arr[mid])
        root.left = bst(from: arr, start: start, end: mid - 1)
        root.right = bst(from: arr, start: mid + 1, end: end)
        
        return root
    }
}
