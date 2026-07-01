class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {

        var number = digits.reduce(0) { $0 * 10 + $1 } + 1

        let digits = String(number).compactMap { $0.wholeNumberValue }

        return digits
    }
}
