/**
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */

class Solution {
    fun reverseList(head: ListNode?): ListNode? {

        
        var current: ListNode? = head
        var reversed: ListNode? = null
        var temp: ListNode? = null

        while(current != null) {
            
        

            temp = current.next
            current.next = reversed
            reversed = current
            current = temp


            // current.next.next.let { temp = it }
            // current.next


            // temp = current
            // current = temp.next
            // temp.next = null
            // current.next.let { 
            //     it.next.let { temp = it }
                

            //     current = temp
            // }


            // get current.next, store reference 
            // set current.next to null
            // 

        }

        return reversed

    }

}
