class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {

        var products = Array(repeating: 1, count: nums.count)

        for (index, num) in nums.enumerated() {
            let multValues = Array(repeating: num, count: nums.count)
            products = zip(products, multValues).enumerated().map { (i, pair) in
                i == index ? products[i] : pair.0 * pair.1
            }
        }

        return products

    }
}
