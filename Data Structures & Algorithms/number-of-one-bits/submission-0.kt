class Solution {
    fun hammingWeight(n: Int): Int {

        var count = 0

        for (i in 31 downTo 0) {
            val bit = (n shr i) and 1
            if (bit == 1) count++
        }

        return count

    }
}
