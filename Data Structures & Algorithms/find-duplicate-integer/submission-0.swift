class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {


         func pad(_ s: String, _ w: Int) -> String {
            s.count >= w ? s : s + String(repeating: " ", count: w - s.count)
        }

        func printState(slow: Int? = nil,
                        fast: Int? = nil,
                        entry: Int? = nil,
                        label: String = "") {
            let cellWidth = max(4, (nums.map { String($0).count }.max() ?? 1) + 1)

            if !label.isEmpty { print(label) }

            let indexRow = (0..<nums.count).map { pad(String($0), cellWidth) }.joined()
            let valueRow = nums.map { pad(String($0), cellWidth) }.joined()

            var markers = Array(repeating: "", count: nums.count)
            if let s = slow,  s >= 0, s < nums.count  { markers[s]  += "S" }
            if let f = fast,  f >= 0, f < nums.count  { markers[f]  += "F" }
            if let e = entry, e >= 0, e < nums.count  { markers[e]  += "E" }
            let markerRow = markers.map { pad($0, cellWidth) }.joined()

            print("idx: " + indexRow)
            print("val: " + valueRow)
            print("ptr: " + markerRow)
            print("")
        }


        var slowPointer = nums[0]
        var fastPointer = nums[nums[0]]
        var step = 0
        //printState(slow: slowPointer, fast: fastPointer, label: "Phase 1 step \(step)")
        // Find the intercection point of the cycle
        while slowPointer != fastPointer {
            slowPointer = nums[slowPointer]
            fastPointer = nums[nums[fastPointer]]
            step += 1
            //printState(slow: slowPointer, fast: fastPointer, label: "Phase 1 step \(step)")
        }

        // find the entrance to the cycle
        var entryPointer = 0
        step = 0
        //printState(slow: slowPointer, entry: entryPointer, label: "Phase 2 start")
        while entryPointer != slowPointer {
            entryPointer = nums[entryPointer]
            slowPointer = nums[slowPointer]
            step += 1
            //printState(slow: slowPointer, entry: entryPointer, label: "Phase 2 step \(step)")
        }

        //printState(entry: entryPointer, label: "Result: \(entryPointer)")

        return entryPointer

    }
}
