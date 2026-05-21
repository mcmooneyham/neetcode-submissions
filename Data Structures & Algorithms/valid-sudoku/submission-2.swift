class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {

        //check row
        for row in board {
            if isInvalidArray(row) { return false }
        }

        //check column
        for i in 0..<board.count {
            if isInvalidArray(board.map { $0[i] }) { return false }
        }


        func getBox(_ row: Int,_ col: Int) -> [Character] {
            (0..<3).flatMap { r in
                (0..<3).map { c in board[row + r][col + c] }
            }
        }

        //check 3x3 grid

        for x in stride(from: 0, through: 6, by: 3) {
            for y in stride(from: 0, through: 6, by: 3) {
                if isInvalidArray(getBox(x,y)) { return false }
            }
        }

        return true

    }

    func isInvalidArray(_ chars: [Character]) -> Bool {
        let filtered = chars.filter { $0.isNumber }
        let noDuplicates = filtered.count == Set(filtered).count
        return !noDuplicates
    }
}
