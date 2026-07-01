class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        return String(digits.reduce(0) { $0 * 10 + $1 } + 1).compactMap { $0.wholeNumberValue }
    }
}
