// Write a code to partition a linked list around a value x, such that all nodes less than x come before nodes greater than or equal to x.
//
// https://leetcode.com/problems/partition-list/

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
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        var node = head
        
        var beforeStart: ListNode?
        var beforeEnd: ListNode?
        
        var afterStart: ListNode?
        var afterEnd: ListNode?
        
        while node != nil {
            guard let value = node?.val else { break }
            
            let newNode = ListNode(value)
            
            if value < x {
                if beforeEnd == nil {
                    beforeStart = newNode
                    beforeEnd = beforeStart
                } else {
                    beforeEnd?.next = newNode
                    beforeEnd = beforeEnd?.next
                }
            } else {
                if afterEnd == nil {
                    afterStart = newNode
                    afterEnd = afterStart
                } else {
                    afterEnd?.next = newNode
                    afterEnd = afterEnd?.next
                }
            }
            
            node = node?.next
        }
        
        if beforeStart == nil {
            return afterStart
        }
        
        beforeEnd?.next = afterStart
        
        return beforeStart
    }
}