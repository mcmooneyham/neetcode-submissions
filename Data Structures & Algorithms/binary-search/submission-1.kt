class Solution {
    fun search(nums: IntArray, target: Int): Int {
        
        return binarySearch(nums, target, 0, nums.size - 1)

    }

    fun binarySearch(nums: IntArray, target: Int, left: Int, right: Int): Int {
        
        if (left > right) return -1


        val middleIndex = left + (right - left) / 2

        if (nums[middleIndex] == target) return middleIndex

        if (nums[middleIndex] < target) {
            return binarySearch(nums, target, middleIndex + 1, right)
        }

        return binarySearch(nums, target, left, middleIndex - 1)

    }
}
