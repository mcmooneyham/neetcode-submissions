class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {

        let freq = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }

        var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for (num, count) in freq {
            buckets[count].append(num)
        }

        return buckets.reversed().flatMap { $0 }.prefix(k).map { $0 }
    }
}
