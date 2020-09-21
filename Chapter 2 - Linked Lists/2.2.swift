// Return kth to last node in a singly linked list.
//
// Leetcode problem asks to delete kth to last node:
// https://leetcode.com/problems/remove-nth-node-from-end-of-list/
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

/**
Solution:
1. Create pointers first and second and move them (k + 1) nodes apart.
2. Iterate both, until second reached the end. At that point first will be (k - 1)th from end node.
3. Set first.next = first.next.next, this wat k-th node is removed.
*/
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var first = head
        var second = head
        
        for i in 0 ..< n {
            second = second?.next
        }

        if second == nil {
            return head?.next
        }
        
        var prev: ListNode?
        
        while second != nil {
            prev = first
            first = first?.next
            second = second?.next
        }
        
        prev?.next = first?.next
        
        return head
    }
}
