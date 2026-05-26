class Solution {
    func maxProfit(_ prices: [Int]) -> Int {

        // Edge Case where there are fewer than 2 days 
        guard prices.count > 1 else { return 0 }

        var lowestPrice = prices[0] // Best buy price
        var maxProfit = 0

        for currentPrice in prices {
            // Profit if we bought at lowestPrice and sold today
            let profitIfSoldToday = currentPrice - lowestPrice
            if profitIfSoldToday > maxProfit {
                maxProfit = profitIfSoldToday
            }

            // Update lowestPrice if today's price is cheaper
            if currentPrice < lowestPrice {
                lowestPrice = currentPrice
            }
        }

        return maxProfit
    }
}
