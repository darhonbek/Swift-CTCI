/**
    Find all anagrams in string. Implement is as an extension to String.
    https://leetcode.com/problems/find-all-anagrams-in-a-string/
*/

extension String {
    func firstAnagramedIndex(of s: String) -> Int {
        guard s.count <= count else { return -1 }

        let counter1 = s.getCharacterCount()
        var startIndex = 0
        var endIndex = s.count - 1
        var counter2 = String(self[startIndex ... endIndex]).getCharacterCount()

        while endIndex < count - 1 {
            if counter1 == counter2 { return startIndex }

            endIndex += 1
            updateCharacterCounter(&counter2, remove: self[startIndex], add: self[endIndex])
            startIndex += 1
        }

        return counter1 == counter2 ? startIndex : -1
    }

    func getCharacterCount() -> [Int] {
        var chars = Array(repeating: 0, count: 26)
        
        for c in self {
            guard let index = c.getLowercaseAsciiIndex() else { continue }
            chars[index] += 1
        }
        
        return chars
    }
    
    private func updateCharacterCounter(_ counter: inout [Int], 
                                        remove rChar: Character, 
                                        add aChar: Character) {
        if let rIndex = rChar.getLowercaseAsciiIndex() { counter[rIndex] -= 1 }
        if let aIndex = aChar.getLowercaseAsciiIndex() { counter[aIndex] += 1 }
    }
}

extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        return self.prefix(range.lowerBound + range.count).suffix(range.count)
    }
}

private extension Character {
    func getLowercaseAsciiIndex() -> Int? {
        guard let ascii = asciiValue else { return nil }
        let index = Int(ascii) - 97
        return index > -1 && index < 26 ? index : nil
    }
}

// TEST:
let input = [
    ("actor", "rotca"),
    ("actor", "tor"),
    ("actor", "cat"),
    ("actor", "catastrophe"),
    ("actor", "car")
]
let expectedOutput = [0, 2, 0, -1, -1]

let output = input.map { pair in
    pair.0.firstAnagramedIndex(of: pair.1)
}

let result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
