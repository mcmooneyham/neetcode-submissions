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
    func hasCycle(_ head: ListNode?) -> Bool {

        var seen = Set<Int>()
        var current: ListNode? = head

        while let next = current?.next {
            if seen.contains(next.val) {
                return true
            }
            seen.insert(next.val)
            current = next
        }

        return false

    }
}
