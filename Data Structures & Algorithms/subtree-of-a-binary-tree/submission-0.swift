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

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val &&
               lhs.left == rhs.left &&
               lhs.right == rhs.right
    }
}

class Solution {
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {

        if root == nil { return false }

        if root?.val == subRoot?.val {
            if root == subRoot { return true }
        }

        return isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)

    }
}
