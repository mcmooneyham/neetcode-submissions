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
    func isValidBST(_ root: TreeNode?) -> Bool {
        validateSubtree(root, nil, nil)
    }


    func validateSubtree(_ currentNode: TreeNode?, _ lowerBound: Int?, _ upperBound: Int?) -> Bool {
    
        guard let currentNode = currentNode else{
            return true
        }
        
        if let lowerBound = lowerBound {
            if currentNode.val <= lowerBound {
                return false
            }
        }
        if let upperBound = upperBound {
            if currentNode.val >= upperBound {
                return false
            }
        }
    
        let left = validateSubtree(currentNode.left, lowerBound, currentNode.val)
        let right = validateSubtree(currentNode.right, currentNode.val, upperBound)
        
        if left && right {
            return true
        }

        return false
    }
}
