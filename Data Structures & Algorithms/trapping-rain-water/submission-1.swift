class Solution {
    func trap(_ height: [Int]) -> Int {

        if height.count < 3 {
            return 0
        }

        var leftIndex = 0
        var rightIndex = height.count - 1

        var leftMax = height[leftIndex]
        var rightMax = height[rightIndex]

        var waterArea = 0

        while leftIndex < rightIndex {

            if leftMax <= rightMax {
                leftIndex += 1
                leftMax = max(leftMax, height[leftIndex])
                waterArea += max(0, leftMax - height[leftIndex])
            }else{
                rightIndex -= 1
                rightMax = max(rightMax, height[rightIndex])
                waterArea += max(0, rightMax - height[rightIndex])
            }

        }

        return waterArea


    }
}
