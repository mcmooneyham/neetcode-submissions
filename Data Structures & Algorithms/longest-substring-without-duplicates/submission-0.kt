class Solution {
    fun lengthOfLongestSubstring(s: String): Int {

        if (s.isEmpty()) return 0

        val charsInWindow = HashSet<Char>()
        var longest = 0
        var windowStart = 0

        for (windowEnd in s.indices) {
            while (s[windowEnd] in charsInWindow) {
                charsInWindow.remove(s[windowStart])
                windowStart++
            }
            charsInWindow.add(s[windowEnd])
            longest = maxOf(longest, windowEnd - windowStart + 1)
        }

        return longest

    }
}
