class Solution {
    fun groupAnagrams(strs: Array<String>): List<List<String>> {

        val groups = mutableListOf<MutableList<String>>() 

        for (str in strs) {
            var added = false
            for (group in groups) {
                if (isAnagram(group.first(), str)){
                    group.add(str)
                    added = true
                    break
                }
            }
            
            if (!added) {
                groups.add(mutableListOf<String>(str))
            }

        }

        return groups

    }

    fun isAnagram(a: String, b: String): Boolean {
        
        if (a.length != b.length) return false

        val letterCount = IntArray(26)

        for (i in a.indices) {
            letterCount[a[i] - 'a']++
            letterCount[b[i] - 'a']--
        }

        return letterCount.all {it == 0}
    }
}
