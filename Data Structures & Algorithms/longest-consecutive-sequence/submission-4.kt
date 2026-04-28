class Solution {
    fun longestConsecutive(nums: IntArray): Int {

        if (nums.size <= 1) { return nums.size }

        val sorted = nums.copyOf()
        sorted.sort()

        var best = 1
        var current = 1

        // nums.forEachIndexed { i, v -> 
        //     if (i != nums.size - 1) {
        //         if (sorted[i + 1] - sorted[i] <= 1){
        //             current++
        //             if (current > best) { best = current }
        //         }else{
        //             current = 0
        //         }
        //     }
        // }

        for (i in 1 until sorted.size) {
            when {
                sorted[i] == sorted[i - 1]     -> continue        // skip duplicates
                sorted[i] == sorted[i - 1] + 1 -> {
                    current++
                    if (current > best) best = current
                }
                else -> current = 1
            }
        }

        return best
    }
}
