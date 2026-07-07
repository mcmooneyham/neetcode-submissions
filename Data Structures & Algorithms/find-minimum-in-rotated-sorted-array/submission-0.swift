class Solution {
    func findMin(_ nums: [Int]) -> Int {

        var leftIndex = 0
        var rightIndex = nums.count - 1

        while leftIndex < rightIndex {
            let middleIndex = leftIndex + (rightIndex - leftIndex) / 2

            // Minimum must be in the unsorted half of the array
            if nums[middleIndex] > nums[rightIndex] {
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex
            }
        }
        
        return nums[leftIndex]
    }
}
