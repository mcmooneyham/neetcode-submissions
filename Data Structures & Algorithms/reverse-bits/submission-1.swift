class Solution {
    func reverseBits(_ n: Int) -> Int {

        var remainingNumber = UInt32(n)
        var reverseNumber: UInt32 = 0

        for _ in 0..<32 {
            // Make room for the next bit in the reversed result
            reverseNumber <<= 1

            // Copy the current least significant bit
            reverseNumber |= remainingNumber & 1

            // Move to the next bit in the input.
            remainingNumber >>= 1
        }

        return Int(reverseNumber)

    }
}
