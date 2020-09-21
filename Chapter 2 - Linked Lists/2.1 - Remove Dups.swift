// Write a code to remove a duplicates from an unsorted linked list.
//
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

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
    // O(n) speed, O(n) memory
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var visitedNodes: Set<Int?> = [head?.val]
        var prev = head
        var node = head?.next
        
        while node != nil {
            if visitedNodes.contains(node?.val) {
                prev?.next = node?.next
            } else {
                visitedNodes.insert(node?.val)
                prev = node
            }
            
            node = node?.next
        }
        
        return head
    }

    // O(n^2) speed, O(1) memory
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        var runner: ListNode?
        
        while current != nil {
            runner = current
            
            while runner?.next != nil {
                if runner?.next?.val == current?.val {
                    runner?.next = runner?.next?.next
                } else {
                    runner = runner?.next
                }
            }
            
            current = current?.next
        }
        
        return head
    }
}