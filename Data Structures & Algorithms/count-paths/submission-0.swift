class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var downRemaining = m - 1
        var rightRemaining = n - 1

        let totalMoveCount = downRemaining + rightRemaining

        // USe the smaller side for the combination to minimize iterations
        let movesToChoose = min(downRemaining, rightRemaining)

        var pathCount = 1

        if movesToChoose > 0 {
            for stepIndex in 1...movesToChoose {
                let numerator = totalMoveCount - movesToChoose + stepIndex
                pathCount = pathCount * numerator / stepIndex
            }
        }

        return pathCount
    }
}
