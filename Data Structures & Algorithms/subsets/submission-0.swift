class Solution {

    func subsets(_ nums: [Int]) -> [[Int]] {

        var sets: [[Int]] = []

        for mask in generateBitmasks(length: nums.count) {

            var subset: [Int] = []

            for i in 0..<nums.count {
                if (mask & (1 << i)) != 0 {
                    subset.append(nums[i])
                }
            }
            sets.append(subset)
        }

        return sets
    }

    func generateBitmasks(length n: Int) -> [Int] {
        return Array(0..<(1 << n))
    }
}
