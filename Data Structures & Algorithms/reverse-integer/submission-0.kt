class Solution {
    fun reverse(x: Int): Int {

        var remainingValue = x
        var reversedValue = 0

        while (remainingValue != 0) {
            // take the last digit from remainingValue
            val lastDigit = remainingValue % 10
            remainingValue /= 10

            // check overflow for positive side
            if (reversedValue > Int.MAX_VALUE / 10 || (reversedValue == Int.MAX_VALUE / 10 && lastDigit > 7)) {
                return 0
            }

            // check overflow for negative side
            if (reversedValue < Int.MIN_VALUE / 10 || (reversedValue == Int.MIN_VALUE / 10 && lastDigit < -8)) {
                return 0
            }

            // Safe to push the digit into reversedValue
            reversedValue = reversedValue * 10 + lastDigit

        }

        return reversedValue

    }
}
