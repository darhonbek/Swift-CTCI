// Implement an algorithm to delete a node in the middle (i.e. any node except for first and last node, not necessarily exact middle node)
// of a singly linked list, given only access to that node.
//
// https://leetcode.com/problems/delete-node-in-a-linked-list/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func deleteNode(_ node: ListNode?) {
        let next = node?.next
        
        if let val = next?.val {
            node?.val = val
        }
        
        node?.next = next?.next
    }
}