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

    private var globalMaximumPathSum = Int.min

    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = findMaxPathFromNode(root)
        return globalMaximumPathSum
    }

    private func findMaxPathFromNode(_ node: TreeNode?) -> Int {

        guard let node = node else { return 0 }

        // Compute max and ignore negatives since they only reduce the sum
        let leftMax = max(0, findMaxPathFromNode(node.left))
        let rightMax = max(0, findMaxPathFromNode(node.right))

        // Path that passes through this node and goes to both sides
        let pathSumThroughNode = leftMax + node.val + rightMax

        // Update global max
        globalMaximumPathSum = max(globalMaximumPathSum, pathSumThroughNode)

        // Return the best downward path to be used by the parent
        return node.val + max(leftMax, rightMax)

    }
}
