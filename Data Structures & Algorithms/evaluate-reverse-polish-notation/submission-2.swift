class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        
       var stack: [Int] = []

        for token in tokens {
            switch token {
            case "+":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a + b)
            case "-":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a - b)
            case "*":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a * b)
            case "/":
                let b = stack.removeLast()
                let a = stack.removeLast()
                stack.append(a / b)
            default:
                stack.append(Int(token)!)
            }
        }

        return stack[0]

    }
}
