/**
https://leetcode.com/problems/minimum-absolute-difference/

Edge cases:
- Array size can be < 2
- Negatives

Solution:
 1. Sort the array in an increasing order.
 2. Go through the array and check diff bwn a[i] with a[i + 1] and find min absoulute diff.
 3. Go through the array and check if diff bwn a[i] with a[i + 1] == minAbsoluteDiff, then append the pair to the ans array.
 3. Return ans array.
 
 Complexity:
 Time O(n log n)
 Space O(n)
 */
 
 func findPairs(in arr: [Int]) -> [[Int]] {
    let n = arr.count
     
    guard !arr.isEmpty && n > 1 else { return [[]] }
    
    var pairs: [[Int]] = []
    
    var arr = arr
    arr.sort()
    var minDiff = abs(arr[0] - arr[1])
    
    for i in 0 ..< n - 1 {
        let curDiff = abs(arr[i] - arr[i + 1])
        if minDiff > curDiff {
            minDiff = curDiff
            pairs.removeAll()
            pairs.append([arr[i], arr[i + 1]])
        } else if minDiff == curDiff {
            pairs.append([arr[i], arr[i + 1]])
        }
    }
    
    return pairs
 }

let input: [Int] = [3,6,9,10,11]
let ans = findPairs(in: input)
print(ans)