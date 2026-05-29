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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return lists.compactMap { $0 }.flatMap { $0 }.sorted().toLinkedList()
    }
}











// 1. Let ListNode iterate its own values
extension ListNode: Sequence {
    func makeIterator() -> AnyIterator<Int> {
        var node: ListNode? = self
        return AnyIterator {
            defer { node = node?.next }
            return node?.val
        }
    }
}

// 2. Rebuild a linked list from any Int sequence
extension Sequence where Element == Int {
    func toLinkedList() -> ListNode? {
        let dummy = ListNode(0)
        var tail = dummy
        for v in self {
            let n = ListNode(v)
            tail.next = n
            tail = n
        }
        return dummy.next
    }
}
