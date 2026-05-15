class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {

        var stack: [Int] = []

        for i in 0..<temperatures.count {

            var count = 0
            var found = false

            for j in (i + 1)..<temperatures.count {
                count += 1
                if (temperatures[j] > temperatures[i]){
                    found = true
                    break
                }
            }

            if found {
                stack.append(count)
            } else {
                stack.append(0)
            }

        }

        return stack


    }
}
