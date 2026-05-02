class Letter {
    let val: Character
    var next: [Letter] = []
    var isEnd: Bool = false
    init (_ val: Character){
        self.val = val
    }
    func addNext(_ char: Character) -> Letter {
        
        if let existing = getNext(char) {
            return existing
        }
        next.append(Letter(char))
        return getNext(char)! 
    }
    func getNext(_ char: Character) -> Letter? {
        if let index = next.firstIndex(where: { $0.val == char }) {
            return next[index]  
        }
        return nil
    }
}


class PrefixTree {

    var letters: [Letter] = []

    func insert(_ word: String) {

        let chars = Array(word)
        var currentLetter: Letter

        if let index = letters.firstIndex(where: { $0.val == chars[0] }) {
            currentLetter = letters[index]
        }else{
            currentLetter = Letter(chars[0])
            letters.append(currentLetter)
        }

        for i in 1..<chars.count {

            if let nextLetter = currentLetter.getNext(chars[i]) {
                currentLetter = nextLetter
            }else{
                currentLetter = currentLetter.addNext(chars[i])
            }
        }
        currentLetter.isEnd = true

    }

    func search(_ word: String) -> Bool {
        let chars = Array(word)
        var currentLetter: Letter

        if let index = letters.firstIndex(where: { $0.val == chars[0] }) {
            currentLetter = letters[index]
        } else {
            return false
        }

        
        for i in 1..<chars.count {

            if let nextLetter = currentLetter.getNext(chars[i]) {
                currentLetter = nextLetter
            }else{
                return false
            }
        }

        return currentLetter.isEnd
    }

    func startsWith(_ prefix: String) -> Bool {
        let chars = Array(prefix)
        var currentLetter: Letter

        if let index = letters.firstIndex(where: { $0.val == chars[0] }) {
            currentLetter = letters[index]
        } else {
            return false
        }

        for i in 1..<chars.count {
            if let nextLetter = currentLetter.getNext(chars[i]) {
                currentLetter = nextLetter
            } else {
                return false
            }
        }
        return true
    }
}
