class Solution {
    func maxArea(_ heights: [Int]) -> Int {

        var leftIndex = 0
        var rightIndex = heights.count - 1

        var maxArea = 0

        while leftIndex < rightIndex {

            var leftHeight = heights[leftIndex]
            var rightHeight = heights[rightIndex]
            var width = rightIndex - leftIndex 

            var height = min(leftHeight, rightHeight)
            var area = width * height

            if area > maxArea {
                maxArea = area
            }

            if leftHeight < rightHeight {
                leftIndex += 1
            }else{
                rightIndex -= 1 
            }
        }

    
        return maxArea

    }
}
