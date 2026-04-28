class Solution {
    fun isPalindrome(s: String): Boolean {

        val filtered = s.filter { it.isLetterOrDigit() }.lowercase()

        return filtered == filtered.reversed()

    }
}
