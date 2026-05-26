class Solution {
    func trap(_ height: [Int]) -> Int {

        if height.count < 3 {
            return 0
        }

        // Pointers to the left and right bar
        var leftIndex = 0
        var rightIndex = height.count - 1

        // Max height from each side
        var leftMax = height[leftIndex]
        var rightMax = height[rightIndex]

        // accumulated trapped water
        var waterArea = 0

        // Process both ends toward the center
        while leftIndex < rightIndex {

            if leftMax <= rightMax {
                // Left side is limiting, so move left pointer
                leftIndex += 1
                leftMax = max(leftMax, height[leftIndex])
           
                /** Water is limited by leftMax on this side
                    
                    NOTE: The max() here likely isnt necessary 
                    Since leftMax is always set above and shouldn't
                    ever be below height[leftIndex]. Same goes for 
                    the right index below
                **/
                waterArea += max(0, leftMax - height[leftIndex])
            }else{
                // Right side is limiting, so move right pointer
                rightIndex -= 1
                rightMax = max(rightMax, height[rightIndex])
                // Water is limited by rightMax on this side
                waterArea += max(0, rightMax - height[rightIndex])
            }
        }

        return waterArea
    }
}
