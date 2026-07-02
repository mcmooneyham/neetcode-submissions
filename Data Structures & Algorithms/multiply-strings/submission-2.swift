class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {

        if num1 == "0" || num2 == "0" {
            return "0"
        }

        let digitToInteger: [Character: Int] = [
            "0": 0,
            "1": 1,
            "2": 2,
            "3": 3,
            "4": 4,
            "5": 5,
            "6": 6,
            "7": 7,
            "8": 8,
            "9": 9
        ]

        let digits1 = num1.map { digitToInteger[$0]! }
        let digits2 = num2.map { digitToInteger[$0]! }

        var result = Array(
            repeating: 0,
            count: digits1.count + digits2.count
        )

        for i in stride(from: digits1.count - 1, through: 0, by: -1) {
            for j in stride(from: digits2.count - 1, through: 0, by: -1) {
                let resultIndex = i + j + 1
                let product = digits1[i] * digits2[j] + result[resultIndex]
                result[resultIndex] = product % 10
                result[resultIndex - 1] += product / 10
            }
        }

        var output = ""
        var foundFirstNonZero = false

        for digit in result {
            if digit != 0 {
                foundFirstNonZero = true
            }
            if foundFirstNonZero {
                output += "\(digit)"
            }
        }

        return output
    }
}
