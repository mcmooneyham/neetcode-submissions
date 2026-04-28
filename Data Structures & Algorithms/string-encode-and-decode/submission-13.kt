import java.util.Base64

class Solution {

    fun encode(strs: List<String>): String {

        if (strs.count() == 0) return ""
        
        return strs.joinToString(",") {
            val encoded = Base64.getEncoder().encodeToString(it.toByteArray())
            "${it.length}|${encoded}"  
        }

    }

    fun decode(str: String): List<String> {
        
        if (str.isEmpty()) return emptyList()

        return str.split(",").map {

            val split = it.split("|")
            val length = split[0]
            val decoded = String(Base64.getDecoder().decode(split[1]))

            decoded
        }
    
    }
}
