class Solution {
    fun characterReplacement(s: String, k: Int): Int {

        var longest = 0
        

        s.forEachIndexed { i, v ->
            var currentIndex = i
            var currentLength = 0
            var wildRemaining = k

            while (currentIndex < s.length) {

                when (s[currentIndex]) {
                    s[i] -> {
                        currentLength++
                    }
                    else -> {
                        if (wildRemaining > 0) {
                            currentLength++
                            wildRemaining--
                        }else{
                            break
                        }
                    }
                }
                currentIndex++
            }

            // Account for wild chars being applied to the beginning instead of the end 
            val bonusChars = minOf(wildRemaining, i)

            if (currentLength + bonusChars > longest) longest = currentLength + bonusChars
        }

        return longest

    }
}
