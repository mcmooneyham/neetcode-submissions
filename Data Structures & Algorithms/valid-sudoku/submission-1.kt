class Solution {
    fun isValidSudoku(board: Array<CharArray>): Boolean {

        fun getRow(row: Int): CharArray {
            return board[row]
        }

        fun getCol(col: Int): CharArray {
            return board.map { it[col] }.toCharArray()
        }

        fun getSubGrid(row: Int, col: Int): CharArray {
            val grid = mutableListOf<Char>()
            grid.addAll(getRow(row).copyOfRange(col, col+3).toList())
            grid.addAll(getRow(row + 1).copyOfRange(col, col+3).toList())
            grid.addAll(getRow(row + 2).copyOfRange(col, col+3).toList())
            return grid.toCharArray()
        }

        fun hasDuplicates(arr: CharArray): Boolean {
            val filtered = arr.filter { it != '.' }.toCharArray()
            return filtered.toSet().size != filtered.size
        }
    

        for (i in 0 until 9) {
            if (hasDuplicates(getRow(i))) {return false}
            if (hasDuplicates(getCol(i))) {return false}
        }

        for (r in 0..6 step 3) {
            for (c in 0..6 step 3) {
                if (hasDuplicates(getSubGrid(r, c))) { return false }
            }
        }

        return true
    } 
}
