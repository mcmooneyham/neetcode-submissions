class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {

        var resultDigits = digits

        // start from the least significant digit
        var currentIndex = resultDigits.count - 1

        // add one with carry
        while currentIndex >= 0 {
            if resultDigits[currentIndex] < 9 {
                // Simple increment; no carry 
                resultDigits[currentIndex] += 1
                return resultDigits
            }

            // Current digit was 9 -> Becomes 0 and carry 
            resultDigits[currentIndex] = 0
            currentIndex -= 1
        }

        // Handle if all digits were 9 (add an extra digit)
        resultDigits.insert(1, at: 0)

        return resultDigits

    }
}
