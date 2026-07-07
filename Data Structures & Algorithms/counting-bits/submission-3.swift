class Solution {
    func countBits(_ n: Int) -> [Int] {

        if n < 1 {
            return [0]
        }

        var bitCounts = Array(repeating: 0, count: n+1)

        for number in 1...n {
            // reuse the count from number / 2, then add the last bit
            bitCounts[number] = bitCounts[number >> 1] + (number & 1)
        }

        return bitCounts

    }
}
