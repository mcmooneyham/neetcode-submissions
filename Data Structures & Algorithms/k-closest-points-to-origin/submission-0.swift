class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {

        var sorted = points

        sorted.sort {
            let dist0 = sqrt( pow(Double(0 - $0[0]), 2.0) + pow(Double(0 - $0[1]), 2.0) )
            let dist1 = sqrt( pow(Double(0 - $1[0]), 2.0) + pow(Double(0 - $1[1]), 2.0) )
            return dist0 < dist1
        }

        return Array(sorted.prefix(k))
    }
}
