class Solution {
    fun isValid(s: String): Boolean {


        var result = s

        while (result.length > 0) {

            val initialLength = result.length

            result = result.replaceFirst("()", "")
            result = result.replaceFirst("[]", "")
            result = result.replaceFirst("{}", "")

            val found = result.length < initialLength

            if (!found) return false

        }

        return true


        // if (s.length == 1) return false
        // if (s.length == 0) return true

        // when (s.first()) {
        //     '(' -> {
        //         if (s.last().equals(')')) {
        //             return isValid(s.substring(1, s.lastIndex))
        //         }else{
        //             return false
        //         }
        //     }
        //     '[' -> {
        //         if (s.last().equals(']')) {
        //             return isValid(s.substring(1, s.lastIndex))
        //         }else{
        //             return false
        //         }
        //     }
        //     '{' -> {
        //         if (s.last().equals('}')) {
        //             return isValid(s.substring(1, s.lastIndex))
        //         }else{
        //             return false
        //         }
        //     }
        // }

        // return false

    }
}
