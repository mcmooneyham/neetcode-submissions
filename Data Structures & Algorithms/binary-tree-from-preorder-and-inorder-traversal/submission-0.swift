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

class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

        // Map each value to its index in the inorder array for fast lookups 
        var inorderIndexByValue: [Int: Int] = [:]
        for (index, value) in inorder.enumerated() {
            inorderIndexByValue[value] = index
        }

        // Current index in preorder (always points to next root)
        var preorderIndex = 0

        // Builds subtree for inorder[left...right]
        func buildSubtree (
            _ inorderLeft: Int,
            _ inorderRight: Int
            ) -> TreeNode? {

            if inorderLeft > inorderRight { return nil }

            // Root is the current preorder element
            let rootValue = preorder[preorderIndex]
            preorderIndex += 1

            let rootNode = TreeNode(rootValue)

            // Find root position in inorder to split left/right subtrees
            guard let inorderRootIndex = inorderIndexByValue[rootValue]
            else { return rootNode }

            // Build the left subtree from left part of inorder range
            rootNode.left = buildSubtree(inorderLeft, inorderRootIndex - 1)

            // Build the right subtree from right part of inorder range
            rootNode.right = buildSubtree(inorderRootIndex + 1, inorderRight)

            return rootNode
            
        }

        return buildSubtree(0, inorder.count - 1)

    }
}
