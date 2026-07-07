/**
 * Definition of Interval:
 * class Interval {
 *     var start: Int
 *     var end: Int
 *     init(_ start: Int, _ end: Int) {
 *         self.start = start
 *         self.end = end
 *     }
 * }
 */

class Solution {
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {

        guard intervals.count > 1 else { return true }

        let sortedIntervals = intervals.sorted {
            if $0.start == $1.start {
                return $0.end < $1.end
            }
            return $0.start < $1.start
        }

        for currentIndex in 1..<sortedIntervals.count {
            let previousInterval = sortedIntervals[currentIndex - 1]
            let currentInterval = sortedIntervals[currentIndex]

            // Check if a conflict exists 
            if currentInterval.start < previousInterval.end {
                return false
            }

        }

        return true
    }
}
