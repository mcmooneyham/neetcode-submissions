class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {

        var result: [Int] = []

        var right = matrix[0].count - 1
        var left = 0
        var top = 0
        var bottom = matrix.count - 1


        while left <= right && top <= bottom {

            // 1. Top row: left to right
            for columnIndex in left...right {
                result.append(matrix[top][columnIndex])
            }
            top += 1

            // 2. Right Column: top to bottom
            if top <= bottom {
                for rowIndex in top...bottom {
                    result.append(matrix[rowIndex][right])
                }
                right -= 1
            }

            // 3. Bottom Row: Right to Left
            if top <= bottom && left <= right {
                for columnIndex in stride(from: right, through: left, by: -1) {
                    result.append(matrix[bottom][columnIndex])
                }
                bottom -= 1
            }
            

            // 4. Left Column: bottom to top
            if left <= right {
                for rowIndex in stride(from: bottom, through: top, by: -1)  {
                    result.append(matrix[rowIndex][left])
                }
                left += 1
            }
        }

        return result

    }
}
