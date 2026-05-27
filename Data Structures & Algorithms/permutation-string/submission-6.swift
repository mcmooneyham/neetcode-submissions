class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s2.count >= s1.count else { return false }

        let asciiValueOfA = Int(Character("a").asciiValue!)
        let targetLength = s1.count

        // Frequency Arrays 
        var frequencyS1: [Int] = Array(repeating: 0, count: 26)
        var frequencyWindow: [Int] = Array(repeating: 0, count: 26)

        let charactersS1 = Array(s1)
        let charactersS2 = Array(s2)

        var leftIndex = 0

        // Build frequency for S1 and first window in S2
        for index in 0..<targetLength {
            let indexS1 = Int(charactersS1[index].asciiValue!) - asciiValueOfA
            let indexS2 = Int(charactersS2[index].asciiValue!) - asciiValueOfA

            frequencyS1[indexS1] += 1
            frequencyWindow[indexS2] += 1
        }

        // Check the first window
        if frequencyS1 == frequencyWindow {
            return true
        }


        // Slide window accross S2
        for rightIndex in targetLength..<charactersS2.count {
            // Add The new right character 
            let rightCharIndex = Int(charactersS2[rightIndex].asciiValue!) - asciiValueOfA
            frequencyWindow[rightCharIndex] += 1

            // Remove the old left character
            let leftCharIndex = Int(charactersS2[leftIndex].asciiValue!) - asciiValueOfA
            frequencyWindow[leftCharIndex] -= 1
            leftIndex += 1

            // Compare frequency Arrays 
            if frequencyS1 == frequencyWindow {
                return true
            }
        }

        return false

    }
}
