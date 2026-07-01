class Solution {
    func isHappy(_ n: Int) -> Bool {

        func sumOfSquares(_ value: Int) -> Int {
            var remainingValue = value
            var sumOfSquares = 0

            while remainingValue > 0 {
                let digit = remainingValue % 10
                sumOfSquares += digit * digit
                remainingValue /= 10
            }

            return sumOfSquares
        }

        var slowValue = n
        var fastValue = sumOfSquares(n)

        while fastValue != 1 && slowValue != fastValue {
            slowValue = sumOfSquares(slowValue)
            fastValue = sumOfSquares(sumOfSquares(fastValue))
        }

        return fastValue == 1

    }
}
