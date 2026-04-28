/**
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */

class Solution {
    fun invertTree(root: TreeNode?): TreeNode? {

        root?.let {
            val temp = it.left
            it.left = invertTree(it.right)
            it.right = invertTree(temp)
        }

        return root
    }
}
