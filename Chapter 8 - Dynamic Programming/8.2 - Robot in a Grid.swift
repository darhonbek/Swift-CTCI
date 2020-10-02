// A robot is located at the top-left corner of a m x n grid.
// The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid.
// How many possible unique paths are there?
//
// https://leetcode.com/problems/unique-paths/

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var paths = Array(repeating: Array<Int>(), count: m)
        for i in 0 ..< m {
            paths[i] = Array(repeating: -1, count: n)
        }
        return getUniquePaths((0, 0), (m - 1, n - 1), &paths)
    }
    
    private func getUniquePaths(_ cur: (row: Int, col: Int),
                                _ finish: (row: Int, col: Int),
                               _ paths: inout [[Int]]) -> Int {
        guard cur.row <= finish.row && cur.col <= finish.col else { return 0 }
        if paths[cur.row][cur.col] != -1 { return paths[cur.row][cur.col] }
        if cur == finish { return 1 }
        
        let right = getUniquePaths((cur.row, cur.col + 1), finish, &paths)
        let down = getUniquePaths((cur.row + 1, cur.col), finish, &paths)
        
        paths[cur.row][cur.col] = right + down
        
        return paths[cur.row][cur.col]
    }
}