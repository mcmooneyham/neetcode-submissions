class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {

        // Map each character to its most recent index
        var lastSeenIndex = [Character: Int]()

        // Left Window Boundary 
        var windowStartIndex = 0

        // Longest length found so far 
        var maximumLength = 0

        // Convert to array for O(n) access
        let characters = Array(s)

        for currentIndex in 0..<characters.count {

            let currentCharacter = characters[currentIndex]

            if let previousIndex = lastSeenIndex[currentCharacter], 
              previousIndex >= windowStartIndex {
                // Duplicate inside current window, shrink from the left 
                windowStartIndex = previousIndex + 1
            }
            
            // Record / Update current index for current character 
            lastSeenIndex[currentCharacter] = currentIndex

            // current window length = right - left + 1
            let currentWindowLength = currentIndex - windowStartIndex + 1
            if currentWindowLength > maximumLength {
                maximumLength = currentWindowLength
            }

        }

        return maximumLength

    }
}
