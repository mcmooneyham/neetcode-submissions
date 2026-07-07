class Solution {
    func rob(_ nums: [Int]) -> Int {

        guard nums.count > 1 else {
            return nums[0]
        }

        let maxSkippingLastHouse = robLinear(
            nums,
            startIndex: 0,
            endIndex: nums.count - 2
        )

        let maxSkippingFirstHouse = robLinear(
            nums,
            startIndex: 1,
            endIndex: nums.count - 1
        )

        return max(maxSkippingLastHouse, maxSkippingFirstHouse)

    }

    private func robLinear(
        _ nums: [Int],
        startIndex: Int,
        endIndex: Int
    ) -> Int {
        var bestWithoutPrev = 0
        var bestWithPrev = 0

        for currentIndex in startIndex...endIndex {

            // If rob current, we must have skipped the previous 
            let robCurrent = bestWithoutPrev + nums[currentIndex]
            // if we skip current, take the best up to previous
            let skipCurrent = bestWithPrev

            // update for next iteration
            bestWithoutPrev = bestWithPrev
            bestWithPrev = max(robCurrent, skipCurrent)

        }

        return bestWithPrev
    }
}
