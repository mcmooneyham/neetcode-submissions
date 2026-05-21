class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        var valueToIndex: [Int:Int] = [:]

        for currentIndex in 0..<numbers.count {
            let currentValue = numbers[currentIndex]
            let requiredValue = target - currentValue

            if let previousIndex = valueToIndex[requiredValue] {
                return [previousIndex + 1, currentIndex + 1]
            }

            valueToIndex[currentValue] = currentIndex 
        }

        return []

    }
}
