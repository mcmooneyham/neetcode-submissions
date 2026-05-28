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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

        guard let head = head else { return nil }

        var previous: ListNode? = head
        var current: ListNode? = head
        var diffCount = 0

        while current?.next != nil {
            current = current?.next
            if diffCount < n {
                diffCount += 1
                continue
            }
            previous = previous?.next
        }
        
        if diffCount < n {
            // n equals list length; the head is the target.
            return head.next
        }
        previous?.next = previous?.next?.next


        return head
    }
}
