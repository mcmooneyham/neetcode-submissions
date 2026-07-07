class Solution {
    func singleNumber(_ nums: [Int]) -> Int {

        var uniqueNumber = 0

        // Duplicate values cancel out, leaving only the single value 
        for number in nums {
            uniqueNumber ^= number
        }

        return uniqueNumber
    }
}
