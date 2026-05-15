class Solution {

    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        // Pair and sort by position descending (closest to target first)
        let cars = zip(position, speed)
            .sorted { $0.0 > $1.0 }

        var fleets = 0
        var slowestTime = 0.0

        for (pos, spd) in cars {
            let timeToTarget = Double(target - pos) / Double(spd)
            if timeToTarget > slowestTime {
                // This car cannot catch the fleet ahead, forms a new fleet
                fleets += 1
                slowestTime = timeToTarget
            }
            // Otherwise it catches up and merges (do nothing)
        }

        return fleets
    }
}
