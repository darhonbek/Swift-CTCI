import Foundation

func compress(string s: String) -> String {
    let n = s.count
    
    guard n > 1 else { return s }
    
    var compressedString = ""
    var i = 0
    
    var count: Int
    var c: Character
    var index: String.Index
    
    while i < n {
        count = 0
        index = s.index(s.startIndex, offsetBy: i)
        c = s[index]
        
        while i < n && c == s[index] {
            i += 1
            count += 1
            index = s.index(s.startIndex, offsetBy: i)
        }
        
        compressedString += "\(c)\(count)"
    }
    
    return compressedString.count == s.count * 2 ? s : compressedString
}

var input = [
    "aabcccccaaa",
    "aaoaoaoaaa",
    "abbcccddddeeeee",
    "abcde",
    "abcd",
    "a",
    ""
]

let output = input.map { compress(string: $0) }

var expectedOutput = [
    "a2b1c5a3",
    "a2o1a1o1a1o1a3",
    "a1b2c3d4e5",
    "abcde",
    "abcd",
    "a",
    ""
]

var result = output == expectedOutput ? "Accepted" : "Failed"
print(result)
