/**
    Similar to the problem below, but need to return paths:
    https://leetcode.com/problems/unique-paths/
*/

func pathsToCell(_ r: Int, _ c: Int, _ path: String = "") -> [String] {
    guard r > 0, c > 0 else { return [] }
    
    var paths: [String] = []
    
    if r == 1 && c == 1 { // origin
        paths.append(path)
    } else {
        paths.append(contentsOf: pathsToCell(r-1, c, path + "D"))
        paths.append(contentsOf: pathsToCell(r, c-1, path + "R"))
    }
    
    return paths
}

// TEST:

let input = [1, 2, 3]
let expectedOutput = [
    [""],
    ["DR", "RD"],
    ["DDRR", "DRDR", "DRRD", "RDDR", "RDRD", "RRDD"]
]

let output = input.map { pathsToCell($0, $0) }
let result = output == expectedOutput ? "Accepted" : "Failed"

print(result)
