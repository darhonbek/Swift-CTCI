import Foundation

// MARK: - Extensions

extension Int {
    init?(_ uint8: UInt8?) {
        guard let uint8 = uint8 else { return nil }
        self = Int(UInt(uint8))
    }
}

// MARK: - Actions

func isOneWay(s1: String, s2: String) -> Bool {
    guard abs(s1.count - s2.count) < 2 else { return false }
    
    let c1 = countASCIICharacterFrequency(in: s1)
    let c2 = countASCIICharacterFrequency(in: s2)
    
    var mismatches = 0
    for i in 0..<256 {
        let difference = abs(c1[i] - c2[i])
        if difference > 1 {
            return false
        } else if difference == 1 {
            if mismatches == 2 {
                return false
            }
            
            mismatches += 1
        }
    }
    
    return true
}

func countASCIICharacterFrequency(in s: String) -> [Int] {
    var counter = Array(repeating: 0, count: 256)
    
    for c in s {
        if let ascii = Int(c.asciiValue) {
            counter[ascii] += 1
        }
    }
    
    return counter
}

var input = [
    ("pale", "ple"),
    ("pales", "pale"),
    ("pale", "bale"),
    ("pale", "bake"),
    ("pce", "ple")
]

let output = input.map { isOneWay(s1: $0.0, s2: $0.1) }

var expectedOutput = [
    true,
    true,
    true,
    false,
    true
]
var result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
