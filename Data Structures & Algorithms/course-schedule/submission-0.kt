class Solution {
    fun canFinish(numCourses: Int, prerequisites: Array<IntArray>): Boolean {
        val graph = HashMap<Int, MutableList<Int>>()
        prerequisites.forEach { (course, prereq) ->
            graph.getOrPut(course) { mutableListOf() }.add(prereq)
        }

        // 0 = unvisited, 1 = visiting (in current path), 2 = visited (safe)
        val state = IntArray(numCourses)

        fun hasCycle(course: Int): Boolean {
            if (state[course] == 1) return true   // cycle detected
            if (state[course] == 2) return false   // already verified safe

            state[course] = 1  // mark as visiting

            graph[course]?.forEach { prereq ->
                if (hasCycle(prereq)) return true
            }

            state[course] = 2  // mark as safe
            return false
        }

        for (course in 0 until numCourses) {
            if (hasCycle(course)) return false
        }

        return true
    }
}
