class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        var topK = [Int]()
        

        for num in nums {
            insert(num)
        }

        return topK[0]

        func insert(_ val: Int) {
            let index = topK.firstIndex(where: { $0 > val }) ?? topK.count
            topK.insert(val, at: index)
            if topK.count > k {
                topK.removeFirst()  // drop smallest
            }
        }
    }
}
