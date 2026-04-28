class Solution {
    fun isPalindrome(s: String): Boolean {

        // val filtered = s.filter { it.isLetterOrDigit() }.lowercase()

        // return filtered == filtered.reversed()

        var l = 0
        var r = s.lastIndex
        while (l < r) {
            while (l < r && !s[l].isLetterOrDigit()) l++
            while (l < r && !s[r].isLetterOrDigit()) r--
            if (s[l].lowercaseChar() != s[r].lowercaseChar()) return false
            l++; r--
        }
        return true

    }
}
