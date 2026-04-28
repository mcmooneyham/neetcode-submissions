class Solution {
    fun checkInclusion(s1: String, s2: String): Boolean {

        if (s1.length > s2.length) return false
        val sorted1 = s1.toCharArray().sorted()

        for (i in 0..s2.length - s1.length) {
            val window = s2.substring(i, i + s1.length)
            if (window.toCharArray().sorted() == sorted1) return true
        }

        return false
    }
}
