class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {

        if s.isEmpty { return true }


        let wordSet = Set(wordDict)
        let chars = Array(s)
        let n = chars.count

        var dp = Array(repeating: false, count: n + 1)
        dp[0] = true

        for i in 1...n {
            for j in 0..<i { 

                if !dp[j] {continue}

                let subStr = String(chars[j..<i])

                if wordSet.contains(subStr) {
                    dp[i] = true
                    break
                }

            }
        }

        return dp[n]

    }
}
