class Solution {
    fun characterReplacement(s: String, k: Int): Int {
        val freq = IntArray(26)
        var left = 0
        var maxFreq = 0
        var longest = 0

        for (right in s.indices) {
            freq[s[right] - 'A']++
            maxFreq = maxOf(maxFreq, freq[s[right] - 'A'])

            // window size - most frequent count = replacements needed
            val windowSize = right - left + 1
            if (windowSize - maxFreq > k) {
                freq[s[left] - 'A']--
                left++
            }

            longest = maxOf(longest, right - left + 1)
        }

        return longest
    }
}
