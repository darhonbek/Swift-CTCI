// Return beginning of the loop in Linked List if it exists.
//
// https://leetcode.com/problems/linked-list-cycle-ii/submissions/

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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        var hasCycle = false
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                slow = head
        
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                
                return slow
            }
        }
        
        return nil
    }
}
