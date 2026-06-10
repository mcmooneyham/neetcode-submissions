/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {

    private let separator = ","
    private let nullMarker = "N"

    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {

        var serializedParts = [String]()

        func preorder(_ node: TreeNode?) {
            guard let node = node else {
                // Use marker for nil to presere tree shape 
                serializedParts.append(nullMarker)
                return
            }

            serializedParts.append(String(node.val))
            preorder(node.left)
            preorder(node.right)
        }

        preorder(root)
        return serializedParts.joined(separator: separator)

    }

    // Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        
        var values = data.split(separator: Character(separator)).map { String($0) }
        var currentIndex = 0

        func buildTree() -> TreeNode? {

            if currentIndex >= values.count { return nil }

            let currentValue = values[currentIndex]
            currentIndex += 1

            // Check for a Nil marker 
            if currentValue == nullMarker { return nil }

            // Create node and build children 
            guard let nodeValue = Int(currentValue) else {
                return nil
            }

            let node = TreeNode(nodeValue)
            node.left = buildTree()
            node.right = buildTree()

            return node
        }

        return buildTree()
    }
}
