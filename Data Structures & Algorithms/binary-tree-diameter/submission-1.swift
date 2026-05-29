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
    
    private var maxDiameter = 0

    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        maxDiameter = 0
        _ = height(root)
        return maxDiameter
    }

    private func height(_ node: TreeNode?) -> Int {
        guard node != nil else { return 0 }

        let left = height(node?.left)
        let right = height(node?.right)
        maxDiameter = max(maxDiameter, left + right)

        return max(left, right) + 1
    }
}
