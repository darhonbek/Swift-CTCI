// Given 2 linked lists. If they intersect, find the intersection node.
//
// https://leetcode.com/problems/intersection-of-two-linked-lists/

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
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var (count1, tail1) = getLengthAndTail(of: headA)
        var (count2, tail2) = getLengthAndTail(of: headB)
        
        guard tail1 === tail2 else { return nil }
        
        var headA = headA
        var headB = headB
        var diff = abs(count1 - count2)
        
        if count1 > count2 {
            while diff > 0 {
                headA = headA?.next
                diff -= 1
            }
        } else {
            while diff > 0 {
                headB = headB?.next
                diff -= 1
            }
        }
        
        while headA !== headB {
            headA = headA?.next
            headB = headB?.next
        }
        
        return headA
    }
    
    private func getLengthAndTail(of node: ListNode?) -> (Int, ListNode?) {
        guard node != nil else { return (0, nil) }
        
        var count = 1
        var runner: ListNode? = node
        
        while runner?.next != nil {
            runner = runner?.next
            count += 1
        }
        
        return (count, runner)
    }
}
