class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 { return 1.0 } // Power of 0 is always 1

        let exponentIsNegative = n < 0
        var remainingExponent = abs(n)

        // Current power of x to multiply
        var currentMultiplier = x
        // Accumulated result
        var result = 1.0

        while remainingExponent > 0 {
            // If current Bit is set, multiply result by current power
            if remainingExponent % 2 == 1 {
                result *= currentMultiplier
            }

            // Square the multiplier for the next bit 
            currentMultiplier *= currentMultiplier

            // Move to next bit of exponent
            remainingExponent /= 2
        }

        return exponentIsNegative ? 1.0 / result : result

    }
}
