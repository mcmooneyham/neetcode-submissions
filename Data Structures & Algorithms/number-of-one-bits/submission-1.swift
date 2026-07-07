class Solution {
    func hammingWeight(_ n: Int) -> Int {

        var remainingNumber = n
        var oneBitCount = 0

        // Remove the lowest set bit until no set bits remain
        while remainingNumber != 0 {
            remainingNumber &= remainingNumber - 1
            oneBitCount += 1
        }

        return oneBitCount
    }
}
