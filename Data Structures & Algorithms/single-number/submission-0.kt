class Solution {
    fun singleNumber(nums: IntArray): Int {

        nums.sort()

        for (i in nums.indices step 2) {
            if (i == nums.size - 1) return nums[i]
            if (nums[i] != nums[i+1]) return nums[i]
        }

        return 0
    }
}
