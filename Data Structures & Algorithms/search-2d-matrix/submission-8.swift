class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return false }

        let firstColumn = matrix.map { $0[0] }

        // Step 1: pick the row that could contain target.
        let rowIndex: Int
        if let i = firstColumn.firstIndex(where: { $0 >= target }) {
            if firstColumn[i] == target { return true }
            if i == 0 { return false } // target < matrix[0][0]
            rowIndex = i - 1
        } else {
            // target is greater than every first-column value.
            // It could still be in the last row.
            rowIndex = matrix.count - 1
        }

        // Step 2: scan that row.
        let row = matrix[rowIndex]
        guard let j = row.firstIndex(where: { $0 >= target }) else {
            return false
        }
        return row[j] == target
    }
}