class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        if s.length != t.length { return false }

        let sSorted = s.sorted()
        let tSorted = t.sorted()

        return sSorted == tSorted
    }
}
