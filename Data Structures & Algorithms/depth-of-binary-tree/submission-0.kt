/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */

class Solution {
    fun maxDepth(root: TreeNode?): Int {

        root?.let {
            val leftDepth = maxDepth(it.left)
            val rightDepth = maxDepth(it.right)

            return maxOf(leftDepth, rightDepth) + 1
        }

        return 0
    }
}
