class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {

        var frequency = s.reduce(into: [:]) { 
            $0[$1, default: 0] += 1
        }

        for char in t { frequency[char, default: 0] -= 1 }

        return frequency.values.allSatisfy { $0 == 0 }

    }
}
