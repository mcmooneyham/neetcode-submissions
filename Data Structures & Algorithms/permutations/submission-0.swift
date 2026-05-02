class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {

        var results: [[Int]] = []
        var current: [Int] = []
        var used = [Bool](repeating: false, count: nums.count)
        
        func backtrack() {
            if current.count == nums.count {
                results.append(current)
                return
            }
            for i in 0..<nums.count {
                if used[i] { continue }
                used[i] = true
                current.append(nums[i])
                backtrack()
                current.removeLast()
                used[i] = false
            }
        }
        
        backtrack()
        return results
    }
}
