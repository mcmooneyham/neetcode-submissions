class Solution {
    fun missingNumber(nums: IntArray): Int {

        var totalSum = 0
        var targetSum = sumTo(nums.size)


        for (i in 0 until nums.size ) {
            totalSum += nums[i]
        }

        return targetSum - totalSum

    }
    fun sumTo(n: Int): Int = n * (n + 1) / 2
}
