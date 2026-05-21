class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {

        if nums.count <= 1 {
            return nums.count
        }

        let sorted = nums.sorted()
        var longest = 0
        var current = 0

        for i in 0..<sorted.count {
            if current == 0 { 
                current = 1 
            }else{
                if sorted[i] == sorted[i-1] { continue }
                if sorted[i] == sorted[i-1] + 1 { current += 1 }
                else { current = 1 }
            }
            if current > longest { longest = current }
        }

        return longest
    }
}
