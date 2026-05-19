class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {

        if word.isEmpty { return true }
        if board.isEmpty || board[0].isEmpty { return false }

        let rowCount = board.count
        let columnCount = board[0].count
        let wordCharacters = Array(word)

        // Track which cells are already used in the path
        var isVisited = Array (
            repeating: Array (repeating: false, count: columnCount),
            count: rowCount
        )

        // Directions
        let directions = [
            (rowOffset: 1, columnOffset: 0),
            (rowOffset: -1, columnOffset: 0),
            (rowOffset: 0, columnOffset: 1),
            (rowOffset: 0, columnOffset: -1),
        ]


        func dfs(
            _ rowIndex: Int,
            _ columnIndex: Int,
            _ wordIndex: Int
        ) -> Bool {

            // character mismatch or cell used 
            if board[rowIndex][columnIndex] != wordCharacters[wordIndex] 
              || isVisited[rowIndex][columnIndex] {
                return false
            }

            //If last char matches, full word is found
            if wordIndex == wordCharacters.count - 1 {
                return board[rowIndex][columnIndex] == wordCharacters[wordIndex]
            }

            // mark cell as used 
            isVisited[rowIndex][columnIndex] = true

            // explore neighbors 
            for direction in directions {
                let nextRow = rowIndex + direction.rowOffset
                let nextColumn = columnIndex + direction.columnOffset

                if nextRow >= 0 && nextRow < rowCount &&
                  nextColumn >= 0 && nextColumn < columnCount {

                    if dfs (nextRow, nextColumn, wordIndex + 1) {
                        return true
                    }

                }
            }

            // backtrack: unmark current cell
            isVisited[rowIndex][columnIndex] = false
            return false
        }

        for rowIndex in 0..<rowCount {
            for columnIndex in 0..<columnCount {
                if dfs(rowIndex, columnIndex, 0){
                    return true
                }
            }
        }

        return false

    }
}
