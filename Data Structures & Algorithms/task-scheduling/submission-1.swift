class Solution {

    class Task {
        let val: Character
        var count = 1
        let cooldown: Int
        var waitTime = 0
        init(_ val: Character, _ cooldown: Int) {
            self.val = val
            self.cooldown = cooldown
        }
        func increaseCount() {
            count += 1
        }
        func run() -> Bool {
            if waitTime == 0 && count > 0 {
                count -= 1
                if count > 0 {
                    waitTime = cooldown
                }
            } else if waitTime > 0 {
                waitTime -= 1
            }else{
                return false
            }
            return true
        }
    }

    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var taskMap: [Character: Task] = [:] 

        for task in tasks {
            if let existing = taskMap[task] {
                existing.increaseCount()
            }else{
                taskMap[task] = Task(task, n)
            }
        }

        var remaining = tasks.count
        var cycleCount = 0

        while remaining > 0 {
            cycleCount += 1

            // Pick the available task with the highest count
            var best: Task? = nil
            for task in taskMap.values {
                if task.waitTime == 0 && task.count > 0 {
                    if best == nil || task.count > best!.count {
                        best = task
                    }
                }
            }

            if let chosen = best {
                chosen.count -= 1
                chosen.waitTime = n
                remaining -= 1
            }

            // Tick cooldowns for all tasks EXCEPT the one just executed
            for task in taskMap.values {
                if task !== best && task.waitTime > 0 {
                    task.waitTime -= 1
                }
            }
        }

        return cycleCount

    }
}
