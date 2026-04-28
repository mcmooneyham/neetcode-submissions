class Solution {
    fun reverseBits(n: Int): Int {

        var reversed = 0

        for (i in 31 downTo 0) {
            val bit = (n shr i) and 1
            if (bit == 1) {
                reversed = setBit(reversed, 31 - i)
            }
        }

        return reversed

    }
    fun getBit(n: Int, pos: Int): Int = (n shr pos) and 1
    fun setBit(n: Int, pos: Int): Int = n or (1 shl pos)
}
