class Solution {
    func rob(_ nums: [Int]) -> Int {

        var bestWithoutPrev = 0
        var bestWithPrev = 0

        for currentAmount in nums {

            // If rob current, we must have skipped the previous 
            let robCurrent = bestWithoutPrev + currentAmount
            // if we skip current, take the best up to previous
            let skipCurrent = bestWithPrev

            // update for next iteration
            bestWithoutPrev = bestWithPrev
            bestWithPrev = max(robCurrent, skipCurrent)

        }

        return bestWithPrev

    }
}
