class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {

        var lowSpeed = 1
        var highSpeed = piles.max() ?? lowSpeed
        var bestSpeed = highSpeed

        while lowSpeed <= highSpeed {

            let middleSpeed = (lowSpeed + highSpeed) / 2

            var totalHoursNeeded = 0
            for pileCount in piles {
                totalHoursNeeded += (pileCount + middleSpeed - 1) / middleSpeed
            }

            if totalHoursNeeded <= h {
                // Speed is fast enough, so trying a slower speed
                bestSpeed = middleSpeed
                highSpeed = middleSpeed - 1
            } else {
                // Need to eat faster
                lowSpeed = middleSpeed + 1
            }

        }

        return bestSpeed

    }
}
