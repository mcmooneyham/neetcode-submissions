class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {

        let characters = Array(s)
        let totalLength = characters.count

        // Frequency of each uppercase letter
        var frequency: [Int] = Array(repeating: 0, count: 26)

        var leftIndex = 0
        var maxFrequencyInWindow = 0
        var longestWindowLength = 0

        for rightIndex in 0..<totalLength {

            // Update the count for the new right character
            let rightCharIndex = Int(characters[rightIndex].asciiValue! - 65)
            frequency[rightCharIndex] += 1

            // Track the highest Frequency in the current window 
            maxFrequencyInWindow = max (
                maxFrequencyInWindow,
                frequency[rightCharIndex]
            )
        
            // If replacements exceed k, move left window boundary 
            while (rightIndex - leftIndex + 1) - maxFrequencyInWindow > k {
                let leftCharIndex = Int(characters[leftIndex].asciiValue! - 65)
                frequency[leftCharIndex] -= 1
                leftIndex += 1
            }

            // Update longest valid window length
            let currentWindowLength = rightIndex - leftIndex + 1
            longestWindowLength = max (
                longestWindowLength,
                currentWindowLength
            )
        }

        return longestWindowLength
    }
}
