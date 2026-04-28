class Solution {
    fun threeSum(nums: IntArray): List<List<Int>> {
        
        val triplets = mutableListOf<List<Int>>()
        
        nums.sort()

        nums.forEachIndexed { i, value ->

            val results = twoSum(nums.copyOfRange(i + 1, nums.count()), 0 - value)

            for (result in results) {
                
                val entry = listOf(value,result[0], result[1])
                if (!triplets.contains(entry)){
                    triplets.add(entry)
                }

               
            }
            

        }

        return triplets
    }

    fun twoSum(numbers: IntArray, target: Int): List<List<Int>> {
        
        val results = mutableListOf<List<Int>>()
        var l = 0
        var r = numbers.lastIndex

        while (l < r) {
            val sum = numbers[l] + numbers[r]
            when {
                sum < target -> l++
                sum > target -> r--
                else -> {
                    results.add(listOf(numbers[l], numbers[r]))
                    l++; r--
                    // skip duplicates
                    while (l < r && numbers[l] == numbers[l - 1]) l++
                    while (l < r && numbers[r] == numbers[r + 1]) r--
                }
            }
        }

        return results
    }
}
