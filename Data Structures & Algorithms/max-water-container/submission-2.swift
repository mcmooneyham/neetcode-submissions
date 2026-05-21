class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        
        // Two pointers bounding the current container
        var leftIndex = 0
        var rightIndex = heights.count - 1

        // Track the best/maximum area found so far
        var maximumArea = 0

        while leftIndex < rightIndex {
            let currentWidth = rightIndex - leftIndex
            let leftHeight = heights[leftIndex]
            let rightHeight = heights[rightIndex]

            // Container height is limited by the shorter line
            let currentHeight = min(leftHeight, rightHeight)
            let currentArea = currentWidth * currentHeight

            if currentArea > maximumArea {
                maximumArea = currentArea
            }

            // Move the pointer at the shorter line inward to
            // try to finf a taller line (which may increase area)
            if  leftHeight < rightHeight {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }

        }

        return maximumArea

    }
}
