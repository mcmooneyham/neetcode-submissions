class Solution {
    func letterCombinations(_ digits: String) -> [String] {

        if digits.isEmpty {
            return []
        }

        let digitToLetters: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]

        var allCombinations = [String]()
        var currentCombination = [Character]()
        let digitCharacters = Array(digits)

        func backtrack(digitIndex: Int) {

            if digitIndex == digitCharacters.count {
                allCombinations.append(String(currentCombination))
                return
            }

            let currentDigit = digitCharacters[digitIndex]

            guard let possibleLetters = digitToLetters[currentDigit] else { return }

            for letter in possibleLetters {
                currentCombination.append(letter)
                backtrack(digitIndex: digitIndex + 1)
                currentCombination.removeLast()
            }

        }

        backtrack(digitIndex: 0)
        return allCombinations
    }
}
