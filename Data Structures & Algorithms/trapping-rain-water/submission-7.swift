class Solution {
    func trap(_ height: [Int]) -> Int {

        if height.count < 3 {
            return 0
        }

        // Pointers strart at the left
        var leftIndex = 0
        var rightIndex = 0

        // Max height from each side
        var leftMax = height[leftIndex]
        var rightMax = height[rightIndex]

        // accumulated trapped water
        var waterArea = 0

        
        while rightIndex < height.count {
            
            if rightIndex == leftIndex {
                rightIndex += 1
                continue
            }

            if height[rightIndex] >= leftMax {
                // rightIndex is a valid right wall
                // fill everything between the two walls
                for i in (leftIndex + 1)..<rightIndex {
                    waterArea += leftMax - height[i]
                }
                // advance the left wall
                leftIndex = rightIndex
                leftMax = height[leftIndex]
            }

            rightIndex += 1

        }

        // Tail fix: everything after leftIndex is shorter than leftMax.
        // Water there is bounded by the running max from the RIGHT.
        rightMax = 0
        for i in stride(from: height.count - 1, through: leftIndex + 1, by: -1) {
            rightMax = max(rightMax, height[i])
            waterArea += rightMax - height[i]
        }

        return waterArea

    }
}
