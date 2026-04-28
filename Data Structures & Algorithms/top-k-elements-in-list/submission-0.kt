class Solution {
    fun topKFrequent(nums: IntArray, k: Int): IntArray {

        val count = HashMap<Int, Int>()

        for (num in nums){
            count[num] = (count[num] ?: 0) + 1
        }

        return count.entries
            .sortedByDescending { it.value }
            .take(k)
            .map { it.key }  
            .toIntArray() 

    }
}
