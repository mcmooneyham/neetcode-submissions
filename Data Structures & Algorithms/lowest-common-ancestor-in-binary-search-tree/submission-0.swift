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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {

        guard let root = root else {
            return nil
        }

        if root.val == p?.val || root.val == q?.val {
            return root
        }

        if ( root.left?.val == p?.val && root.right?.val == q?.val ||
            root.left?.val == q?.val && root.right?.val == p?.val ) {
            return root
        }

        var pLeft = false
        var qLeft = false
        var pRight = false
        var qRight = false

        pLeft = searchForNode(root.left, p)
        if !pLeft {
            pRight = searchForNode(root.right, p)
        }

        qLeft = searchForNode(root.left, q)
        if !qLeft {
            qRight = searchForNode(root.right, q)
        }


        if (pLeft && qRight) || (pRight && qLeft)  {
            return root
        }

        if pLeft && qLeft {
            return lowestCommonAncestor(root.left, p, q)
        }
        
        if pRight && qRight {
            return lowestCommonAncestor(root.right, p, q)
        }
        
        return root

    }

    func searchForNode(_ root: TreeNode?, _ target: TreeNode?) -> Bool {
        guard let root = root, let target = target else {
            return false
        }

        if root.val == target.val {
            return true
        }

        return searchForNode(root.left, target) || searchForNode(root.right, target)
    }
}
