class Solution {
    fun maxArea(heights: IntArray): Int {
        
        var largest = 0

        heights.forEachIndexed {i, value ->  
            var areas = heights.copyOfRange(i + 1, heights.count())

            areas.forEachIndexed { j, v ->
                val area = minOf(value, v) * (j + 1)
                if(area > largest){
                    largest = area
                }
            }
        }

        return largest
    }
}
