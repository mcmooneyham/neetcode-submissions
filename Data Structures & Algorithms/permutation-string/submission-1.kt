class Solution {
    fun checkInclusion(s1: String, s2: String): Boolean {

        if (s1.length > s2.length) return false

        val s1Freq = IntArray(26)
        val windowFreq = IntArray(26)
        var matches = 0

        // build initial frequencies
        for (i in s1.indices) {
            s1Freq[s1[i] - 'a']++
            windowFreq[s2[i] - 'a']++
        }

        // count initial matches across all 26 slots
        for (i in 0 until 26) {
            if (s1Freq[i] == windowFreq[i]) matches++
        }

        if (matches == 26) return true

        // slide the window
        for (right in s1.length until s2.length) {
            val addChar = s2[right] - 'a'
            val removeChar = s2[right - s1.length] - 'a'

            // add right char
            windowFreq[addChar]++
            if (windowFreq[addChar] == s1Freq[addChar]) matches++
            else if (windowFreq[addChar] == s1Freq[addChar] + 1) matches--

            // remove left char
            windowFreq[removeChar]--
            if (windowFreq[removeChar] == s1Freq[removeChar]) matches++
            else if (windowFreq[removeChar] == s1Freq[removeChar] - 1) matches--

            if (matches == 26) return true
        }

        return false
    }
}
