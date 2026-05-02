class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {

        var results: [[Int]] = []
        var current: [Int] = []
        let sorted = nums.sorted()
        
        func backtrack(_ startIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                results.append(current)
                return
            }
            
            for i in startIndex..<sorted.count {
                if sorted[i] > remaining { break }
                current.append(sorted[i])
                backtrack(i, remaining - sorted[i])  // i, not i+1, allows reuse
                current.removeLast()
            }
        }
        
        backtrack(0, target)
        return results

    }

}
