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
    
    var oddsCount = 0
    for count in counter where count%2 == 1 {
        guard oddsCount == 0 else { return false }
        oddsCount += 1
    }
    
    return true
}

func countCharacterFrequency(in s: String) -> [Int] {
    var counter = Array(repeating: 0, count: 26)
    
    for c in s {
        if let ascii = Int(c.asciiValue) {
            if ascii >= 65 && ascii <= 90 {         // A-Z
                counter[ascii + 32 - 97] += 1
            } else if ascii >= 97 && ascii <= 122 { // a-z
                counter[ascii - 97] += 1
            }
        }
    }
    
    return counter
}

var string = "Polop palap"
let result = isPalindromePermutation(string: string)
print(result)
