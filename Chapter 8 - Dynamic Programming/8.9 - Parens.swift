// Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//
// https://leetcode.com/problems/generate-parentheses/

/**
Solution:
1. Start recursion and pass:
    - # of open left
    - # of closed left
    - path so far
    - empty mutable array to keep track of paths.
2. Base case when open == 0 and closed == 0, append path to array.
3. Non base case: 
    - if open > 0, start recursion with path + "(" and open - 1.
    - if closed < open, start recursion with path + ")" and closed - 1.
4. Return array.

Complexity:
Time = Space = Catalan numbers: C(n) = binomial(2n,n)/(n+1) = (2n)!/(n!(n+1)!)
Derived from http://oeis.org.

Edge cases:
- n < 1
- order of combinations?
*/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var combinations: [String] = []
        var path: [Character] = Array(repeating: Character("."), count: n*2)
        path[0] = "("
        generateCombinations(open: n - 1, closed: n, path: &path, index: 1, array: &combinations)
        return combinations
    }
    
    private func generateCombinations(open: Int, closed: Int, path: inout [Character], index: Int, array: inout [String]) {
        guard open > 0 || closed > 0 else {
            array.append(String(path))
            return
        }
        
        if open > 0 {
            path[index] = "("
            generateCombinations(open: open - 1, closed: closed, path: &path, index: index + 1, array: &array)
        }
        
        if closed > open {
            path[index] = ")"
            generateCombinations(open: open, closed: closed - 1, path: &path, index: index + 1, array: &array)
        }
    }
}