class Solution {
    fun trap(height: IntArray): Int {

        var totalWater = 0
    
        var left = 0
        var right = height.lastIndex
        var leftMax = 0
        var rightMax = 0


        while (left < right) {
            if (height[left] < height[right]) {
                leftMax = maxOf(leftMax, height[left])
                totalWater += leftMax - height[left]
                left++
            }else{
                rightMax = maxOf(rightMax, height[right])
                totalWater += rightMax - height[right]
                right--
            }
        }

        return totalWater
    }
}
