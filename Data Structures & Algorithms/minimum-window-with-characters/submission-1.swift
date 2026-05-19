class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let sourceCharacters = Array(s)
        var characterDeficit: [Character: Int] = [:]
        for character in t { characterDeficit[character, default: 0] += 1 }
        
        var remainingNeeded = t.count
        var bestWindowStart = 0, bestWindowLength = Int.max, leftIndex = 0
        
        for rightIndex in sourceCharacters.indices {
            let rightCharacter = sourceCharacters[rightIndex]
            if characterDeficit[rightCharacter, default: 0] > 0 { remainingNeeded -= 1 }
            characterDeficit[rightCharacter, default: 0] -= 1
            
            while remainingNeeded == 0 {
                if rightIndex - leftIndex + 1 < bestWindowLength {
                    bestWindowLength = rightIndex - leftIndex + 1
                    bestWindowStart = leftIndex
                }
                let leftCharacter = sourceCharacters[leftIndex]
                characterDeficit[leftCharacter]! += 1
                if characterDeficit[leftCharacter]! > 0 { remainingNeeded += 1 }
                leftIndex += 1
            }
        }
        
        return bestWindowLength == Int.max ? "" : String(sourceCharacters[bestWindowStart ..< bestWindowStart + bestWindowLength])
    
    }
}
