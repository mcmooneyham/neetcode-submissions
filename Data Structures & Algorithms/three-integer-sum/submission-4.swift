class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var sums: Set<[Int]> = []
        for (index, value) in nums.enumerated() {
            let twoSumArray = nums.indices.filter { $0 != index }.map { nums[$0] }
            let solutions = twoSum(twoSumArray, 0 - value)
            for solution in solutions {
                var index1 = 0
                var index2 = 0
                if solution[0] >= index { index1 = solution[0] + 1 }
                else { index1 = solution[0] }
                if solution[1] >= index { index2 = solution[1] + 1 }
                else { index2 = solution[1] }
                sums.insert([value, nums[index1], nums[index2]].sorted())
            }
        }
        return Array(sums)
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var prevMap = [Int: Int]()
        var results: [[Int]] = []
        for (i, n) in nums.enumerated() {
            let diff = target - n
            if let index = prevMap[diff] {
                results.append([index, i])
            }
            prevMap[n] = i
        }
        return results
    }
}