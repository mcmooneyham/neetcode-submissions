class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

        var valueToIndex: [Int:Int] = [:]

        for currentIndex in 0..<nums.count {
            let currentValue = nums[currentIndex]
            let requiredValue = target - currentValue

            if let previousIndex = valueToIndex[requiredValue] {
                return [previousIndex, currentIndex]
            }

            valueToIndex[currentValue] = currentIndex 
        }

        return []
    }
}
