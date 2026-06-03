class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        
        var mutablePoints = points

        quickSelect(
            &mutablePoints,
            leftIndex: 0,
            rightIndex: mutablePoints.count - 1,
            targetIndex: k - 1)

        // First K points
        return Array(mutablePoints[0..<k])
    }

    private func quickSelect(
        _ points: inout [[Int]],
        leftIndex: Int,
        rightIndex: Int,
        targetIndex: Int
    ) {
        var currentLeft = leftIndex
        var currentRight = rightIndex

        while currentLeft <= currentRight {
            let pivotIndex = partition(
                &points,
                leftIndex: currentLeft,
                rightIndex: currentRight)

            if pivotIndex == targetIndex {
                return
            }

            if pivotIndex < targetIndex {
                currentLeft = pivotIndex + 1
            }else{
                currentRight = pivotIndex - 1
            }
        }
    }

    private func partition(
        _ points: inout [[Int]],
        leftIndex: Int,
        rightIndex: Int
    ) -> Int {
        // use rightIndex as pivot position
        let pivotDistance = squaredDistance(points[rightIndex])
        var storeIndex = leftIndex

        var currentIndex = leftIndex
        while currentIndex < rightIndex {
            if squaredDistance(points[currentIndex]) <= pivotDistance {
                points.swapAt(storeIndex, currentIndex)
                storeIndex += 1
            }
            currentIndex += 1
        }

        points.swapAt(storeIndex, rightIndex)
        return storeIndex
    }

    private func squaredDistance(_ point: [Int]) -> Int {
        return Int(pow(Double(point[0]), 2.0) + pow(Double(point[1]), 2.0))
    }
    

}
