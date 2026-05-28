/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {

        guard let head = head else { return nil }

        // Interleave copied nodes with the original
        // original1 -> copy1 -> original2 -> copy2 -> ...
        var currentOriginal:Node? = head
        while let currentNode = currentOriginal {
            let copiedNode = Node(currentNode.val)
            copiedNode.next = currentNode.next
            currentNode.next = copiedNode
            currentOriginal = copiedNode.next
        }

        // Set the random pointers for copied nodes
        currentOriginal = head
        while let currentNode = currentOriginal {
            let copiedNode = currentNode.next
            // currentNode.random?.next is the node that corresponds
            // to currentNode?.random
            copiedNode?.random = currentNode.random?.next
            currentOriginal = copiedNode?.next
        }

        // Separate the interleaved list and restore the original 
        let copiedHead:Node? = head.next
        currentOriginal = head
        while let currentNode = currentOriginal {
            let copiedNode = currentNode.next
            currentNode.next = copiedNode?.next
            copiedNode?.next = copiedNode?.next?.next
            currentOriginal = currentNode.next
        }

        return copiedHead

    }
}
