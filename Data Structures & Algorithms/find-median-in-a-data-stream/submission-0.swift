class MedianFinder {

    var sortedNums: [Int] = []

    func addNum(_ num: Int) {
        let index = sortedNums.firstIndex(where: { $0 >= num }) ?? sortedNums.count
        sortedNums.insert(num, at: index)
    }

    func findMedian() -> Double {

        var median: Double = 0.0

        if sortedNums.count == 1 {
            median = Double(sortedNums[0])
        }else if sortedNums.count % 2 == 0 {
            let num1 = sortedNums[sortedNums.count/2 - 1]
            let num2 = sortedNums[sortedNums.count/2 ]
            median = Double(num1 + num2) / 2.0
        }else{
            median = Double(sortedNums[sortedNums.count/2])
        }

        return median

    }
}
