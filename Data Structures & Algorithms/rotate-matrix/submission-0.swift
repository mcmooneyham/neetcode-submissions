class Solution {
    func rotate(_ matrix: inout [[Int]]) {

        let size = matrix.count 

        if size <= 1 { return }


        // Transpose the matrix (swap rows and columns)
        for rowIndex in 0..<size {
            for columnIndex in (rowIndex + 1)..<size{
                let tempValue = matrix[rowIndex][columnIndex]
                matrix[rowIndex][columnIndex] = matrix[columnIndex][rowIndex]
                matrix[columnIndex][rowIndex] = tempValue
            }
        }

        // Reverse each row to achieve clockwise rotation
        for rowIndex in 0..<size {
            
            var leftIndex = 0
            var rightIndex = size - 1

            while leftIndex < rightIndex {
                
                let tempValue = matrix[rowIndex][leftIndex]
                matrix[rowIndex][leftIndex] = matrix[rowIndex][rightIndex]
                matrix[rowIndex][rightIndex] = tempValue

                leftIndex += 1
                rightIndex -= 1
            }

        }


    }
}
