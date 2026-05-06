class Solution {
    func climbStairs(_ n: Int) -> Int {

        if n <= 2 {
            return n
        }

        var waysToPreviousStep = 2
        var waysToSecondPreviousStep = 1

        for _ in 3...n {
            let waysToCurrentStep = waysToPreviousStep + waysToSecondPreviousStep
            waysToSecondPreviousStep = waysToPreviousStep
            waysToPreviousStep = waysToCurrentStep
        }

        return waysToPreviousStep

    }
}
