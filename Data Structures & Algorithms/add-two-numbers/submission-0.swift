/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        let resultDummyHead = ListNode(0)
        var currentResultNode: ListNode? = resultDummyHead

        var currentFirstNode = l1
        var currentSecondNode = l2
        var carryValue = 0

        while currentFirstNode != nil 
            || currentSecondNode != nil 
            || carryValue > 0 {

            let firstDigit = currentFirstNode?.val ?? 0
            let secondDigit = currentSecondNode?.val ?? 0

            let digitSum = firstDigit + secondDigit + carryValue
            let resultDigit = digitSum % 10
            carryValue = digitSum / 10

            // Append new node with the computed digit
            currentResultNode?.next = ListNode(resultDigit)
            currentResultNode = currentResultNode?.next

            // Advance input list nodes when available
            currentFirstNode = currentFirstNode?.next
            currentSecondNode = currentSecondNode?.next

        }

        return resultDummyHead.next

    }
}
