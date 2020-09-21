// Implement a function to check if a linked list is a palindrome.
//
// https://leetcode.com/problems/palindrome-linked-list/

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
1. Split list into 2. If odd, remove middle.
2. Reverse 2nd list.
3. Compare elements in the list 1 by one, if do not match, return false.
4. Return true.

Complexity:
time  O(n)
space O(1)

Edge cases:
- Odd list.
- 0 or 1 element list.
*/
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let head = head else { return true } // empty
        guard head.next != nil else { return true } // single element
        
        var (prev, middle) = findMiddleNode(from: head)
        prev?.next = nil
        
        if isOdd(head) != isOdd(middle) {
            middle = middle?.next
        }
        
        guard let rhs = reverse(middle) else { return true }

        return head == rhs
    }
    
    private func findMiddleNode(from node: ListNode?) -> (ListNode?, ListNode?) {
        var prev: ListNode?
        var slow = node
        var fast = node?.next
        
        while fast != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return (prev, slow)
    }
    
    private func reverse(_ node: ListNode?) -> ListNode? {
        var first: ListNode?
        var second = node
        var third: ListNode?
        
        while second != nil {
            third = second?.next
            second?.next = first
            first = second
            second = third
        }
        
        return first
    }
    
    private func isOdd(_ node: ListNode?) -> Bool {
        var node = node
        var n = 0
        
        while node != nil {
            node = node?.next
            n += 1
        }
        
        return n % 2 == 1
    }
}

extension ListNode: Equatable {
    public static func ==(_ lhs: ListNode, _ rhs: ListNode) -> Bool {
        var (lhs, rhs): (ListNode?, ListNode?) = (lhs, rhs)
        
        while lhs != nil && rhs != nil {
            if lhs?.val != rhs?.val {
                return false
            } else {
                lhs = lhs?.next
                rhs = rhs?.next
            }
        }
        
        return lhs == nil && rhs == nil
    }
}