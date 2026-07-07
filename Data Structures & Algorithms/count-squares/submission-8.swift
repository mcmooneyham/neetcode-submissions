class CountSquares {

    private var pointCounts: [String: Int] = [:]
    private var addedPoints: [[Int]] = []

    func add(_ point: [Int]) {
        let pointKey = makeKey(point[0], point[1])

        // track duplicates as separate useable points
        pointCounts[pointKey, default: 0] += 1
        addedPoints.append(point)
    }

    func count(_ point: [Int]) -> Int {
        let queryXCoordinate = point[0]
        let queryYCoordinate = point[1]
        var squareCount = 0

        for diagonalPoint in addedPoints {
            let diagonalXCoordinate = diagonalPoint[0]
            let diagonalYCoordinate = diagonalPoint[1]

            let horizontalDistance = abs (
                diagonalXCoordinate - queryXCoordinate
            )

            let verticalDistance = abs (
                diagonalYCoordinate - queryYCoordinate
            )

            // Opposite corners of an axis-aligned square
            guard horizontalDistance > 0, horizontalDistance == verticalDistance else {
                continue
            }

            let firstCornerKey = makeKey(
                queryXCoordinate,
                diagonalYCoordinate
            )

            let secondCornerKey = makeKey(
                diagonalXCoordinate,
                queryYCoordinate
            )

            let firstCornerCount = pointCounts[firstCornerKey, default: 0]
            let secondCornerCount = pointCounts[secondCornerKey, default: 0]

            squareCount += firstCornerCount * secondCornerCount
        
        }

        return squareCount

    }

    private func makeKey(_ xCoordinate: Int, _ yCoordinate: Int) -> String {
        return "\(xCoordinate),\(yCoordinate)"
    }
}
