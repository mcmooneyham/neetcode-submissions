class MinStack {

    private var stack: [(val: Int, min: Int)] = []

    init() {}

    func push(_ val: Int) {
        let newMin = stack.isEmpty ? val : min(val, stack.last!.min)
        stack.append((val, newMin))
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        return stack.last!.val
    }

    func getMin() -> Int {
        return stack.last!.min
    }
}
