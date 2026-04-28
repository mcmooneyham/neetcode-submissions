/**
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */

class Solution {
    fun reverseList(head: ListNode?): ListNode? {

        var reversed: ListNode? = null
        var current: ListNode? = head
        var temp: ListNode? = null

        while (current != null) {
            temp = current?.next
            current?.next = reversed
            reversed = current
            current = temp
        }

        return reversed

    }
}
