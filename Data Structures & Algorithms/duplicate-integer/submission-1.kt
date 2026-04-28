class Solution {
    fun hasDuplicate(nums: IntArray): Boolean {
        val unique = HashSet<Int>(nums.size)
        for (value in nums) {
            if (!unique.add(value)) {
                return true
            }
        }
        return false
    }
}
