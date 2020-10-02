// You are climbing a stair case. It takes n steps to reach to the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
//
// https://leetcode.com/problems/climbing-stairs/

class Solution {
    func climbStairs(_ n: Int) -> Int {
        guard n > 0 else { return 0 }
        guard n > 1 else { return 1 }

        var first = 1
        var second = 1
        var third = 0
        
        for i in 2 ... n {
            third = first + second
            first = second
            second = third
        }
        
        return third
    }
}