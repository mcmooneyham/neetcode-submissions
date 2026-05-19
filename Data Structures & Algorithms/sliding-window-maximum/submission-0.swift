class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        var maximums: [Int] = []
        var indexDeque: [Int] = []

        func appendIndexAndDeque(_ currentIndex: Int) {
            // Remove from back while current element is greater or equal
            while let lastIndex = indexDeque.last, 
              nums[lastIndex] <= nums[currentIndex] {
                    indexDeque.removeLast()
            }
            indexDeque.append(currentIndex)
        }

        for currentIndex in 0..<nums.count {
            // Remove indices outside of window bounds 
            let windowStartIndex = currentIndex - k + 1
            if let firstIndex = indexDeque.first, 
              firstIndex < windowStartIndex {
                indexDeque.removeFirst()
            }

            appendIndexAndDeque(currentIndex)

            if currentIndex >= k - 1 {
                if let maximumIndex = indexDeque.first {
                    maximums.append(nums[maximumIndex])
                }
            }

        }

        return maximums
    }
}
