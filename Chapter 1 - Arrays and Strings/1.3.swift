import Foundation

// MARK: - Extensions

extension Int {
    init?(_ uint8: UInt8?) {
        guard let uint8 = uint8 else { return nil }
        self = Int(UInt(uint8))
    }
}

// MARK: - Actions

func isPalindromePermutation(string s: String) -> Bool {
    let counter = countCharacterFrequency(in: s)
    var oddsCount = counter.filter { $0%2 == 1 }.count
    
    return oddsCount < 2
}

func countCharacterFrequency(in s: String) -> [Int] {
    var counter = Array(repeating: 0, count: 26)
    
    for c in s {
        if var ascii = Int(c.asciiValue) {
            ascii -= 65 // Subtract ASCII value of 'A'.
            if ascii > 31 && ascii < 58 { ascii -= 32 } // Make a-z -> A-Z.
            if ascii > -1 && ascii < 26 { counter[ascii] += 1 }
        }
    }
    
    return counter
}

var input = [
    "Polops fpalap",
    "Polop palap",
    "Jackie Chan",
    "Tact Coa"
]

let output = input.map { isPalindromePermutation(string: $0) }

var expectedOutput = [
    false,
    true,
    false,
    true
]
var result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
