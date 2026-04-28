/**
 * Definition for singly-linked list.
 * class ListNode(var `val`: Int) {
 *     var next: ListNode? = null
 * }
 */

class Solution {
    fun mergeTwoLists(list1: ListNode?, list2: ListNode?): ListNode? {

        //var merged:ListNode? = null
    
        if (list1 == null) return list2
        if (list2 == null) return list1

        // if (list1.`val` <= list2.`val`){
        //     merged = list1
        //     merged?.next = mergeTwoLists(list1?.next, list2)
        // }else{
        //     merged = list2
        //     merged?.next = mergeTwoLists(list1, list2?.next)
        // }

        if (list1.`val` <= list2.`val`) {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }

    
        //return merged 
    }
}
