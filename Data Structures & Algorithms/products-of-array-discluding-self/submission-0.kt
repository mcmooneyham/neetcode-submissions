class Solution {
    fun productExceptSelf(nums: IntArray): IntArray {

        var products = mutableListOf<Int>()

        nums.forEachIndexed { i, v -> 
            val values = nums.filterIndexed { index, _ -> index != i }.toIntArray()
            products.add(
                values.fold(1) {total, value ->
                    total * value
                }
            )
            
        }

        return products.toIntArray()

    }
}
