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

    var levels: [[Int]] = []

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        handleLevel(root, 0)
        return levels
    }

    func handleLevel(_ root: TreeNode?, _ level: Int) {

        guard let root = root else {
            return
        }

        if level < levels.count {
            levels[level].append(root.val)
        } else {
            levels.append([root.val])
        }

        handleLevel(root.left, level + 1)
        handleLevel(root.right, level + 1)
    }


}
