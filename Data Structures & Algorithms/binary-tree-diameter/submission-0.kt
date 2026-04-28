/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */

class Solution {
    private var maxDiameter = 0

    fun diameterOfBinaryTree(root: TreeNode?): Int {
        maxDiameter = 0
        height(root)
        return maxDiameter
    }

    private fun height(node: TreeNode?): Int {
        if (node == null) return 0
        val left = height(node.left)
        val right = height(node.right)
        maxDiameter = maxOf(maxDiameter, left + right)
        return maxOf(left, right) + 1
    }
}
