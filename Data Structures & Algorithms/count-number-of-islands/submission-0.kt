class Solution {

    fun numIslands(grid: Array<CharArray>): Int {
        
        var islandCount = 0

        grid.forEachIndexed { y, _ ->
            grid[y].forEachIndexed { x, _ ->
                if (grid[y][x] == '1') {
                    islandCount++
                    sinkIsland(x, y, grid)
                }
            }
        }

        return islandCount
    }

    fun sinkIsland(x: Int, y: Int, grid: Array<CharArray>) {
        
        if (y < 0 || y >= grid.size) return
        if (x < 0 || x >= grid[y].size) return
        if (grid[y][x] != '1') return

        grid[y][x] = '0'

        sinkIsland(x, y - 1, grid)
        sinkIsland(x, y + 1, grid)
        sinkIsland(x + 1, y, grid)
        sinkIsland(x - 1, y, grid)
    }
}
