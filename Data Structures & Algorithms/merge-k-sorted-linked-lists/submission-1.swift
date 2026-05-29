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

import Collections

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        struct Entry: Comparable {
            let node: ListNode
            static func < (a: Entry, b: Entry) -> Bool { a.node.val < b.node.val }
            static func == (a: Entry, b: Entry) -> Bool { a.node.val == b.node.val }
        }

        // Seed the heap with the head of each non-nil list
        var heap = Heap<Entry>()
        for head in lists {
            if let h = head {
                heap.insert(Entry(node: h))
            }
        }

        // Pop smallest, append to result, push its next
        let dummy = ListNode(0)
        var tail = dummy
        while let e = heap.popMin() {
            tail.next = e.node
            tail = e.node
            if let next = e.node.next {
                heap.insert(Entry(node: next))
            }
        }
        tail.next = nil  // defensive: ensure list terminates
        return dummy.next
    }
}
