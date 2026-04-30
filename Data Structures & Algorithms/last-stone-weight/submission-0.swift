class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {

        var sorted = stones.sorted()

        while sorted.count > 1 {

            let stone1 = sorted.remove(at: sorted.count - 1)
            let stone2 = sorted.remove(at: sorted.count - 1)

            let result = abs(stone1 - stone2)

            if result != 0 {
                let index = sorted.firstIndex(where: { $0 > result }) ?? sorted.count
                sorted.insert(result, at: index)
            }

        }

        if sorted.count == 1 {
            return sorted[0]
        }

        return 0

    }
}
