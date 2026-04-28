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
    func invertTree(_ root: TreeNode?) -> TreeNode? {

        return invert(root)

    }

    func invert(_ root: TreeNode?) -> TreeNode? {


        if root?.left != nil {
            root?.left = invert(root?.left)
        }

        if root?.right != nil {
            root?.right = invert(root?.right)
        }


        let temp = root?.left
        root?.left = root?.right
        root?.right = temp

        return root

    }
}
