class Solution {
    func partition(_ s: String) -> [[String]] {

        let characters = Array(s)
        let length = characters.count

        var allPartitions = [[String]]()
        var currentPartition = [String]()


        func backtrack(from startIndex: Int) {

            // All characters used; record partition
            if startIndex == length {
                allPartitions.append(currentPartition)
                return 
            }

            // Try every possible end index for the next substring
            var endIndex = startIndex
            while endIndex < length {
                if isPalindrome(characters, startIndex, endIndex) {

                    // Extract the current Palindrome
                    let substring = String(characters[startIndex...endIndex])
                    currentPartition.append(substring)

                    
                    backtrack(from: endIndex + 1)
                    
                    // Backtrack Step
                    currentPartition.removeLast()
                }
                endIndex += 1
            }

        }

        func isPalindrome(_ characters: [Character], _ startIndex: Int, _ endIndex: Int) -> Bool {

            var leftIndex = startIndex
            var rightIndex = endIndex

            while leftIndex < rightIndex {
                if characters[leftIndex] != characters[rightIndex] {
                    return false
                }
                leftIndex += 1
                rightIndex -= 1
            }

            return true
        }

        backtrack(from: 0)
        return allPartitions

    }
}
