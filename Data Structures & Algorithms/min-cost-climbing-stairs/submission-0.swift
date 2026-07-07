class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {

        let stepCount = cost.count

        if stepCount <= 1 {
            return stepCount == 1 ? cost[0] : 0
        }

        var minCostTwoStepsBefore = cost[0]
        var minCostOneStepBefore = cost[1]

        if stepCount > 2 {
            for stepIndex in 2..<stepCount {
                let minCostToCurrent = cost[stepIndex] + min(minCostTwoStepsBefore, minCostOneStepBefore)
                minCostTwoStepsBefore = minCostOneStepBefore
                minCostOneStepBefore = minCostToCurrent
            }
        }

        return min(minCostTwoStepsBefore, minCostOneStepBefore)

    }
}
