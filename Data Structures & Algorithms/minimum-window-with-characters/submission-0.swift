class Solution {
    func minWindow(_ s: String, _ t: String) -> String {

        if t.isEmpty || t.count > s.count {
            return ""
        }

        let sourceCharacters = Array(s)
        let targetCharacters = Array(t)

        // Count how many times each character is required from t
        var targetFrequency: [Character: Int] = [:]
        for character in targetCharacters {
            targetFrequency[character, default: 0] += 1
        }

        // Number of distinct Characters that must found
        let requiredDistinctCount = targetFrequency.count

        var windowFrequency:[Character: Int] = [:]
        var satisfiedDistinctCount = 0

        var bestWindowLength = Int.max
        var bestWindowStart = 0

        var leftIndex = 0

        for rightIndex in 0..<sourceCharacters.count {

            let rightCharacter = sourceCharacters[rightIndex]
            windowFrequency[rightCharacter, default: 0] += 1

            // If this character is needed and we just hit the required count
            if let requiredCount = targetFrequency[rightCharacter],
                windowFrequency[rightCharacter] == requiredCount {
                satisfiedDistinctCount += 1
            }

            // try to shrink while all counts are satisfied 
            while satisfiedDistinctCount == requiredDistinctCount && leftIndex <= rightIndex {

                let currentWindowLength = rightIndex - leftIndex + 1
                if currentWindowLength < bestWindowLength {
                    bestWindowLength = currentWindowLength
                    bestWindowStart = leftIndex
                }     

                let leftCharacter = sourceCharacters[leftIndex]
                windowFrequency[leftCharacter]! -= 1

                // If the required character drops below the needed count,
                // the window is no longer valid 
                if let requiredCount = targetFrequency[leftCharacter],
                    windowFrequency[leftCharacter]! < requiredCount {
                    satisfiedDistinctCount -= 1
                }

                leftIndex += 1
            }
        }

        if bestWindowLength == Int.max {
            return ""
        }

        let startIndex = s.index(s.startIndex, offsetBy: bestWindowStart)
        let endIndex = s.index(startIndex, offsetBy: bestWindowLength)

        return String(s[startIndex..<endIndex])

    }
}
