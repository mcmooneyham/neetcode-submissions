/*
Definition for a Node.
class Node(var `val`: Int) {
    var neighbors: ArrayList<Node?> = ArrayList()
}
*/

class Solution {
    val visited = HashMap<Int, Node>()
    fun cloneGraph(node: Node?): Node? {

        if (node == null) return null
        if (node.`val` in visited) return visited[node.`val`]
        
        val cloneNode = Node(node.`val`)
        visited[node.`val`] = cloneNode

        node.neighbors?.forEach {
            cloneNode.neighbors.add(cloneGraph(it))
        }

        return cloneNode
    }
}