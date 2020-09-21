// You are given two non-empty linked lists representing two non-negative integers. 
// The digits are stored in reverse order and each of their nodes contain a single digit. 
// Add the two numbers and return it as a linked list.
//
// https://leetcode.com/problems/add-two-numbers/

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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var sumNode: ListNode!

        if l1 != nil || l2 != nil {
            sumNode = ListNode(0)
            sumNode.val = (l1?.val ?? 0) + (l2?.val ?? 0)
            
            if sumNode.val > 9 {
                if l1?.next != nil {
                    l1?.next?.val += sumNode.val / 10
                } else {
                    l1?.next = ListNode(sumNode.val / 10)
                }
                
                sumNode.val %= 10
            }
    
            sumNode.next = addTwoNumbers(l1?.next, l2?.next)
        }
        
        return sumNode
    }
}