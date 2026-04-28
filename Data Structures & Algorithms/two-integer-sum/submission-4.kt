class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {

        val seen = HashMap<Int, Int>() 

        for ((i, num) in nums.withIndex()) {
            val solutionValue = target - num
            val j = seen[solutionValue]
            if (j != null) return intArrayOf(j, i)
            seen[num] = i
        }

        return intArrayOf(-1, -1)
        
    }
}
