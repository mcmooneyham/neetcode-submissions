class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s2.count >= s1.count else { return false }

        let windowSize = s1.count
        let s1Sorted = s1.sorted()
        let s2Array = Array(s2)

        for i in 0...(s2.count - windowSize) {
            
            let window = s2Array[i..<(i + windowSize)].sorted()
            if window == s1Sorted { return true }

        }

        return false 
    }
}
