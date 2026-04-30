class KthLargest {

    let k: Int
    var list = [Int]()

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            let _ = add(num)
        }
    }

    func add(_ val: Int) -> Int {
        
        let index = list.firstIndex(where: { $0 > val }) ?? list.count
        list.insert(val, at: index)
        
        if list.count < k {
            return -1  // not enough elements yet
        }
        return list[list.count - k]
    }
}
