class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {

        var results: [[Int]] = []
        var current: [Int] = []
        let sorted = candidates.sorted()

        func backtrack(_ startIndex: Int, _ remaining: Int) {
            if remaining == 0 {
                results.append(current)
                return
            }
            for i in startIndex..<sorted.count {
                if sorted[i] > remaining { break }
                if i > startIndex && sorted[i] == sorted[i - 1] { continue }
                current.append(sorted[i])
                backtrack(i + 1, remaining - sorted[i])
                current.removeLast()
            }
        }

        backtrack(0, target)
        return results

    }
}
