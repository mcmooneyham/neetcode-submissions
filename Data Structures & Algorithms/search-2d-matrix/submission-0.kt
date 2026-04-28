class Solution {
    fun searchMatrix(matrix: Array<IntArray>, target: Int): Boolean {

        for (numArray in matrix) {
            if (target >= numArray[0] && target <= numArray[numArray.size - 1]) {
                return numArray.binarySearch(target) >= 0
            }
        }
        return false 

    }
}
