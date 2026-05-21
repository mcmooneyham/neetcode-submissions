class Solution {
    func isPalindrome(_ s: String) -> Bool {
        
     let chars = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })

        for i in 0..<(chars.count / 2) {
            if chars[i] != chars[chars.count - 1 - i] {
                return false
            }
        }

        return true
    }
}
