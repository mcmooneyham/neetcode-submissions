class Solution {
    fun countBits(n: Int): IntArray {

        var countArray = IntArray(n + 1)

        for (i in 0 until n + 1) {
            countArray[i] = hammingWeight(i)
        }

        return countArray

    }

    fun hammingWeight(n: Int): Int {

        var count = 0

        for (i in 31 downTo 0) {
            val bit = (n shr i) and 1
            if (bit == 1) count++
        }

        return count

    }
}
