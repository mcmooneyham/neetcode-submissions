class Solution {
    func isValid(_ s: String) -> Bool {

        let closingToOpening: [Character: Character] = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]

        // Stack to store opening brackets 
        var bracketStack = [Character]()

        for character in s {
            if character == "(" || 
               character == "[" ||
               character == "{" {
                bracketStack.append(character)
            }else{
                guard let expectedOpening = closingToOpening[character], 
                let lastOpening = bracketStack.popLast() 
                else {
                    return false
                }

                if lastOpening != expectedOpening {
                    return false
                }
            }

        }

        return bracketStack.isEmpty

    }
}
