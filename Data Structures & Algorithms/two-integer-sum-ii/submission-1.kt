class Solution {
    fun twoSum(numbers: IntArray, target: Int): IntArray {
        numbers.forEachIndexed { i, value ->
            val solution = numbers.binarySearch(target - value)
            if (solution >= 0) {
                return intArrayOf(i + 1, solution + 1)
            }
        }
        return intArrayOf(0,0)
    }
}
