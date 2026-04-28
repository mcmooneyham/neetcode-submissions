class Solution {
    fun maxProfit(prices: IntArray): Int {

        var maxProfit = 0

        prices.forEachIndexed { i, v ->

            var entryMaxProfit = 0

            for (j in i until prices.size) {
                val entryProfit = prices[j] - prices[i]
                if (entryProfit > entryMaxProfit) {
                    entryMaxProfit = entryProfit
                }
            }

            if (entryMaxProfit > maxProfit) {
                maxProfit = entryMaxProfit
            }

        }

        return maxProfit

    }
}
