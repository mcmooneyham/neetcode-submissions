// Swift 5.7+ (also runs on Swift 6.x).
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        guard rows > 0 else { return }
        let cols = matrix[0].count

        // Find zeros in column-major order.
        // Recurse to the NEXT cell first, so every original zero is located
        // before any zero is written. Writing happens on the way back up.
        func findZero(_ startColumn: Int, _ startRow: Int) {
            for column in startColumn..<cols {
                // startRow applies only to the first column we resume into.
                let rowStart = (column == startColumn) ? startRow : 0
                for row in rowStart..<rows {
                    if matrix[row][column] == 0 {
                        if row + 1 < rows {
                            findZero(column, row + 1)        // next cell: down
                        } else if column + 1 < cols {
                            findZero(column + 1, 0)           // next cell: next column
                        }
                        setZeros(row, column)                 // write on unwind
                        return
                    }
                }
            }
        }

        func setZeros(_ row: Int, _ column: Int) {
            for rowIndex in 0..<rows {
                matrix[rowIndex][column] = 0   // zero this column
            }
            for columnIndex in 0..<cols {
                matrix[row][columnIndex] = 0   // zero this row
            }
        }

        findZero(0, 0)
    }
}