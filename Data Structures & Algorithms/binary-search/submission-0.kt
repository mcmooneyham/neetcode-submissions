class Solution {
    fun search(nums: IntArray, target: Int): Int {


        val searchResult = nums.binarySearch(target)
        return if (searchResult >= 0) searchResult else -1

    }
}
