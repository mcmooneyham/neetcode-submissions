class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {

        var maxArea = 0
        var stack = [Int]()

        func printHistogramVisual() {
            guard !heights.isEmpty else { return }
            let maxHeight = heights.max() ?? 0
            let inStack = Set(stack)

            // Draw rows top-down. "#" = bar, "*" = bar whose index is in the stack.
            for level in stride(from: maxHeight, through: 1, by: -1) {
                var line = ""
                for (i, h) in heights.enumerated() {
                    if h >= level {
                        line += inStack.contains(i) ? "* " : "# "
                    } else {
                        line += "  "
                    }
                }
                print(line)
            }

            // Index axis and current stack contents.
            var axis = ""
            for i in heights.indices { axis += "\(i % 10) " }
            print(axis)
            print("stack indices: \(stack)\n")
        }

        for i in 0...heights.count {
            let currentHeight = i < heights.count ? heights[i] : 0

            while let top = stack.last, heights[top] >= currentHeight {
                stack.removeLast()
                let height = heights[top]
                let width = stack.isEmpty ? i : i - stack.last! - 1
                maxArea = max(maxArea, height * width)
            }

            stack.append(i)
            // printHistogramVisual()  // uncomment to print state each iteration
        }  

        return maxArea

    }

    
}
